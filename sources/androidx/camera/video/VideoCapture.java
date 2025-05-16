package androidx.camera.video;

import android.graphics.Rect;
import android.media.MediaCodec;
import android.util.Pair;
import android.util.Range;
import android.util.Size;
import androidx.arch.core.util.Function;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.Logger;
import androidx.camera.core.ResolutionSelector;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ConfigProvider;
import androidx.camera.core.impl.ConstantObservable;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.ThreadConfig;
import androidx.camera.core.internal.UseCaseEventConfig;
import androidx.camera.core.processing.DefaultSurfaceProcessor;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.SurfaceProcessorInternal;
import androidx.camera.core.processing.SurfaceProcessorNode;
import androidx.camera.video.StreamInfo;
import androidx.camera.video.VideoCapture;
import androidx.camera.video.VideoOutput;
import androidx.camera.video.impl.VideoCaptureConfig;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.ImageCaptureFailedWhenVideoCaptureIsBoundQuirk;
import androidx.camera.video.internal.compat.quirk.PreviewDelayWhenVideoCaptureIsBoundQuirk;
import androidx.camera.video.internal.compat.quirk.PreviewStretchWhenVideoCaptureIsBoundQuirk;
import androidx.camera.video.internal.compat.quirk.VideoQualityQuirk;
import androidx.camera.video.internal.config.VideoConfigUtil;
import androidx.camera.video.internal.encoder.InvalidConfigException;
import androidx.camera.video.internal.encoder.VideoEncoderConfig;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.camera.video.internal.encoder.VideoEncoderInfoImpl;
import androidx.camera.video.internal.workaround.VideoEncoderInfoWrapper;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import androidx.core.util.Supplier;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class VideoCapture<T extends VideoOutput> extends UseCase {
    private static final Defaults DEFAULT_CONFIG = new Defaults();
    private static final boolean ENABLE_SURFACE_PROCESSING_BY_QUIRK;
    private static final String SURFACE_UPDATE_KEY = "androidx.camera.video.VideoCapture.streamUpdate";
    private static final String TAG = "VideoCapture";
    private static final boolean USE_TEMPLATE_PREVIEW_BY_QUIRK;
    private SurfaceEdge mCameraEdge;
    private Rect mCropRect;
    DeferrableSurface mDeferrableSurface;
    private SurfaceProcessorNode mNode;
    SessionConfig.Builder mSessionConfigBuilder;
    VideoOutput.SourceState mSourceState;
    StreamInfo mStreamInfo;
    private final Observable.Observer<StreamInfo> mStreamInfoObserver;
    private SurfaceProcessorInternal mSurfaceProcessor;
    private SurfaceRequest mSurfaceRequest;
    ListenableFuture<Void> mSurfaceUpdateFuture;
    private VideoEncoderInfo mVideoEncoderInfo;

    static {
        boolean z = true;
        boolean z2 = DeviceQuirks.get(PreviewStretchWhenVideoCaptureIsBoundQuirk.class) != null;
        boolean z3 = DeviceQuirks.get(PreviewDelayWhenVideoCaptureIsBoundQuirk.class) != null;
        boolean z4 = DeviceQuirks.get(ImageCaptureFailedWhenVideoCaptureIsBoundQuirk.class) != null;
        boolean hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing = hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing();
        USE_TEMPLATE_PREVIEW_BY_QUIRK = z2 || z3 || z4;
        if (!z3 && !z4 && !hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing) {
            z = false;
        }
        ENABLE_SURFACE_PROCESSING_BY_QUIRK = z;
    }

    public static <T extends VideoOutput> VideoCapture<T> withOutput(T t) {
        return new Builder((VideoOutput) Preconditions.checkNotNull(t)).build();
    }

    VideoCapture(VideoCaptureConfig<T> videoCaptureConfig) {
        super(videoCaptureConfig);
        this.mStreamInfo = StreamInfo.STREAM_INFO_ANY_INACTIVE;
        this.mSessionConfigBuilder = new SessionConfig.Builder();
        this.mSurfaceUpdateFuture = null;
        this.mSourceState = VideoOutput.SourceState.INACTIVE;
        this.mStreamInfoObserver = new Observable.Observer<StreamInfo>() { // from class: androidx.camera.video.VideoCapture.1
            @Override // androidx.camera.core.impl.Observable.Observer
            public void onNewData(StreamInfo streamInfo) {
                if (streamInfo == null) {
                    throw new IllegalArgumentException("StreamInfo can't be null");
                }
                if (VideoCapture.this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                    return;
                }
                Logger.d(VideoCapture.TAG, "Stream info update: old: " + VideoCapture.this.mStreamInfo + " new: " + streamInfo);
                StreamInfo streamInfo2 = VideoCapture.this.mStreamInfo;
                VideoCapture.this.mStreamInfo = streamInfo;
                if (!StreamInfo.NON_SURFACE_STREAM_ID.contains(Integer.valueOf(streamInfo2.getId())) && !StreamInfo.NON_SURFACE_STREAM_ID.contains(Integer.valueOf(streamInfo.getId())) && streamInfo2.getId() != streamInfo.getId()) {
                    VideoCapture videoCapture = VideoCapture.this;
                    videoCapture.resetPipeline(videoCapture.getCameraId(), (VideoCaptureConfig) VideoCapture.this.getCurrentConfig(), (Size) Preconditions.checkNotNull(VideoCapture.this.getAttachedSurfaceResolution()));
                    return;
                }
                if ((streamInfo2.getId() != -1 && streamInfo.getId() == -1) || (streamInfo2.getId() == -1 && streamInfo.getId() != -1)) {
                    VideoCapture videoCapture2 = VideoCapture.this;
                    videoCapture2.applyStreamInfoToSessionConfigBuilder(videoCapture2.mSessionConfigBuilder, streamInfo);
                    VideoCapture videoCapture3 = VideoCapture.this;
                    videoCapture3.updateSessionConfig(videoCapture3.mSessionConfigBuilder.build());
                    VideoCapture.this.notifyReset();
                    return;
                }
                if (streamInfo2.getStreamState() != streamInfo.getStreamState()) {
                    VideoCapture videoCapture4 = VideoCapture.this;
                    videoCapture4.applyStreamInfoToSessionConfigBuilder(videoCapture4.mSessionConfigBuilder, streamInfo);
                    VideoCapture videoCapture5 = VideoCapture.this;
                    videoCapture5.updateSessionConfig(videoCapture5.mSessionConfigBuilder.build());
                    VideoCapture.this.notifyUpdated();
                }
            }

            @Override // androidx.camera.core.impl.Observable.Observer
            public void onError(Throwable th) {
                Logger.w(VideoCapture.TAG, "Receive onError from StreamState observer", th);
            }
        };
    }

    public T getOutput() {
        return (T) ((VideoCaptureConfig) getCurrentConfig()).getVideoOutput();
    }

    public int getTargetRotation() {
        return getTargetRotationInternal();
    }

    public void setTargetRotation(int i) {
        if (setTargetRotationInternal(i)) {
            sendTransformationInfoIfReady(getAttachedSurfaceResolution());
        }
    }

    @Override // androidx.camera.core.UseCase
    public void onStateAttached() {
        super.onStateAttached();
        getOutput().getStreamInfo().addObserver(CameraXExecutors.mainThreadExecutor(), this.mStreamInfoObserver);
        setSourceState(VideoOutput.SourceState.ACTIVE_NON_STREAMING);
    }

    @Override // androidx.camera.core.UseCase
    protected Size onSuggestedResolutionUpdated(Size size) {
        Logger.d(TAG, "suggestedResolution = " + size);
        String cameraId = getCameraId();
        VideoCaptureConfig<T> videoCaptureConfig = (VideoCaptureConfig) getCurrentConfig();
        Size[] sizeArr = null;
        List supportedResolutions = videoCaptureConfig.getSupportedResolutions(null);
        if (supportedResolutions != null) {
            Iterator it = supportedResolutions.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Pair pair = (Pair) it.next();
                if (((Integer) pair.first).intValue() == getImageFormat() && pair.second != null) {
                    sizeArr = (Size[]) pair.second;
                    break;
                }
            }
        }
        if (sizeArr != null) {
            int width = size.getWidth() * size.getHeight();
            int length = sizeArr.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                Size size2 = sizeArr[i];
                if (Objects.equals(size2, size)) {
                    break;
                }
                if (size2.getWidth() * size2.getHeight() < width) {
                    Logger.d(TAG, "Find a higher priority resolution: " + size2);
                    size = size2;
                    break;
                }
                i++;
            }
        }
        this.mStreamInfo = (StreamInfo) fetchObservableValue(getOutput().getStreamInfo(), StreamInfo.STREAM_INFO_ANY_INACTIVE);
        SessionConfig.Builder createPipeline = createPipeline(cameraId, videoCaptureConfig, size);
        this.mSessionConfigBuilder = createPipeline;
        applyStreamInfoToSessionConfigBuilder(createPipeline, this.mStreamInfo);
        updateSessionConfig(this.mSessionConfigBuilder.build());
        notifyActive();
        return size;
    }

    @Override // androidx.camera.core.UseCase
    public void setViewPortCropRect(Rect rect) {
        super.setViewPortCropRect(rect);
        sendTransformationInfoIfReady(getAttachedSurfaceResolution());
    }

    public void setProcessor(SurfaceProcessorInternal surfaceProcessorInternal) {
        this.mSurfaceProcessor = surfaceProcessorInternal;
    }

    @Override // androidx.camera.core.UseCase
    public void onDetached() {
        clearPipeline();
    }

    @Override // androidx.camera.core.UseCase
    public void onStateDetached() {
        Preconditions.checkState(Threads.isMainThread(), "VideoCapture can only be detached on the main thread.");
        setSourceState(VideoOutput.SourceState.INACTIVE);
        getOutput().getStreamInfo().removeObserver(this.mStreamInfoObserver);
        ListenableFuture<Void> listenableFuture = this.mSurfaceUpdateFuture;
        if (listenableFuture == null || !listenableFuture.cancel(false)) {
            return;
        }
        Logger.d(TAG, "VideoCapture is detached from the camera. Surface update cancelled.");
    }

    public String toString() {
        return "VideoCapture:" + getName();
    }

    /* JADX WARN: Type inference failed for: r3v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    public UseCaseConfig<?> getDefaultConfig(boolean z, UseCaseConfigFactory useCaseConfigFactory) {
        Config config = useCaseConfigFactory.getConfig(UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE, 1);
        if (z) {
            config = Config.CC.mergeConfigs(config, DEFAULT_CONFIG.getConfig());
        }
        if (config == null) {
            return null;
        }
        return getUseCaseConfigBuilder(config).getUseCaseConfig();
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfoInternal, UseCaseConfig.Builder<?, ?, ?> builder) {
        updateSupportedResolutionsByQuality(cameraInfoInternal, builder);
        return builder.getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    public UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config) {
        return Builder.fromConfig(config);
    }

    private void sendTransformationInfoIfReady(Size size) {
        CameraInternal camera = getCamera();
        SurfaceRequest surfaceRequest = this.mSurfaceRequest;
        Rect cropRect = getCropRect(size);
        if (camera == null || surfaceRequest == null || cropRect == null) {
            return;
        }
        int relativeRotation = getRelativeRotation(camera);
        int appTargetRotation = getAppTargetRotation();
        SurfaceEdge surfaceEdge = this.mCameraEdge;
        if (surfaceEdge != null) {
            surfaceEdge.setRotationDegrees(relativeRotation);
        } else {
            surfaceRequest.updateTransformationInfo(SurfaceRequest.TransformationInfo.of(cropRect, relativeRotation, appTargetRotation, true));
        }
    }

    Rect getCropRect() {
        return this.mCropRect;
    }

    private Rect getCropRect(Size size) {
        if (getViewPortCropRect() != null) {
            return getViewPortCropRect();
        }
        if (size != null) {
            return new Rect(0, 0, size.getWidth(), size.getHeight());
        }
        return null;
    }

    private SessionConfig.Builder createPipeline(final String str, final VideoCaptureConfig<T> videoCaptureConfig, final Size size) {
        final Size size2;
        int i;
        final Timebase timebase;
        Threads.checkMainThread();
        final CameraInternal cameraInternal = (CameraInternal) Preconditions.checkNotNull(getCamera());
        Runnable runnable = new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                VideoCapture.this.notifyReset();
            }
        };
        final Range<Integer> targetFramerate = videoCaptureConfig.getTargetFramerate(Defaults.DEFAULT_FPS_RANGE);
        Objects.requireNonNull(targetFramerate);
        Rect cropRect = getCropRect(size);
        Objects.requireNonNull(cropRect);
        SurfaceProcessorNode createNodeIfNeeded = createNodeIfNeeded(isCropNeeded(cropRect, size));
        this.mNode = createNodeIfNeeded;
        if (createNodeIfNeeded != null) {
            final MediaSpec mediaSpec = getMediaSpec();
            Objects.requireNonNull(mediaSpec);
            timebase = cameraInternal.getCameraInfoInternal().getTimebase();
            this.mCropRect = adjustCropRectIfNeeded(cropRect, size, new Supplier() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda2
                @Override // androidx.core.util.Supplier
                public final Object get() {
                    return VideoCapture.this.m180lambda$createPipeline$1$androidxcameravideoVideoCapture(videoCaptureConfig, cameraInternal, timebase, mediaSpec, size, targetFramerate);
                }
            });
            Preconditions.checkState(this.mCameraEdge == null);
            i = 1;
            size2 = size;
            final SurfaceEdge surfaceEdge = new SurfaceEdge(2, size, 34, getSensorToBufferTransformMatrix(), true, this.mCropRect, getRelativeRotation(cameraInternal), false, runnable);
            this.mCameraEdge = surfaceEdge;
            SurfaceProcessorNode.OutConfig of = SurfaceProcessorNode.OutConfig.of(surfaceEdge);
            SurfaceEdge surfaceEdge2 = this.mNode.transform(SurfaceProcessorNode.In.of(surfaceEdge, Collections.singletonList(of))).get(of);
            Objects.requireNonNull(surfaceEdge2);
            this.mSurfaceRequest = surfaceEdge2.createSurfaceRequest(cameraInternal, targetFramerate);
            DeferrableSurface deferrableSurface = surfaceEdge.getDeferrableSurface();
            this.mDeferrableSurface = deferrableSurface;
            deferrableSurface.getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    VideoCapture.this.m181lambda$createPipeline$2$androidxcameravideoVideoCapture(surfaceEdge);
                }
            }, CameraXExecutors.mainThreadExecutor());
        } else {
            size2 = size;
            i = 1;
            SurfaceRequest surfaceRequest = new SurfaceRequest(size2, cameraInternal, targetFramerate, runnable);
            this.mSurfaceRequest = surfaceRequest;
            this.mDeferrableSurface = surfaceRequest.getDeferrableSurface();
            timebase = Timebase.UPTIME;
            this.mCropRect = cropRect;
        }
        videoCaptureConfig.getVideoOutput().onSurfaceRequested(this.mSurfaceRequest, timebase);
        sendTransformationInfoIfReady(size2);
        this.mDeferrableSurface.setContainerClass(MediaCodec.class);
        SessionConfig.Builder createFrom = SessionConfig.Builder.createFrom(videoCaptureConfig);
        createFrom.addErrorListener(new SessionConfig.ErrorListener() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                VideoCapture.this.m182lambda$createPipeline$3$androidxcameravideoVideoCapture(str, videoCaptureConfig, size2, sessionConfig, sessionError);
            }
        });
        if (USE_TEMPLATE_PREVIEW_BY_QUIRK) {
            createFrom.setTemplateType(i);
        }
        return createFrom;
    }

    /* renamed from: lambda$createPipeline$1$androidx-camera-video-VideoCapture, reason: not valid java name */
    /* synthetic */ VideoEncoderInfo m180lambda$createPipeline$1$androidxcameravideoVideoCapture(VideoCaptureConfig videoCaptureConfig, CameraInternal cameraInternal, Timebase timebase, MediaSpec mediaSpec, Size size, Range range) {
        return getVideoEncoderInfo(videoCaptureConfig.getVideoEncoderInfoFinder(), VideoCapabilities.from(cameraInternal.getCameraInfo()), timebase, mediaSpec, size, range);
    }

    /* renamed from: lambda$createPipeline$2$androidx-camera-video-VideoCapture, reason: not valid java name */
    /* synthetic */ void m181lambda$createPipeline$2$androidxcameravideoVideoCapture(SurfaceEdge surfaceEdge) {
        if (surfaceEdge.getDeferrableSurface() == this.mDeferrableSurface) {
            clearPipeline();
        }
    }

    /* renamed from: lambda$createPipeline$3$androidx-camera-video-VideoCapture, reason: not valid java name */
    /* synthetic */ void m182lambda$createPipeline$3$androidxcameravideoVideoCapture(String str, VideoCaptureConfig videoCaptureConfig, Size size, SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
        resetPipeline(str, videoCaptureConfig, size);
    }

    private void clearPipeline() {
        Threads.checkMainThread();
        DeferrableSurface deferrableSurface = this.mDeferrableSurface;
        if (deferrableSurface != null) {
            deferrableSurface.close();
            this.mDeferrableSurface = null;
        }
        SurfaceProcessorNode surfaceProcessorNode = this.mNode;
        if (surfaceProcessorNode != null) {
            surfaceProcessorNode.release();
            this.mNode = null;
        }
        SurfaceEdge surfaceEdge = this.mCameraEdge;
        if (surfaceEdge != null) {
            surfaceEdge.close();
            this.mCameraEdge = null;
        }
        this.mVideoEncoderInfo = null;
        this.mCropRect = null;
        this.mSurfaceRequest = null;
        this.mStreamInfo = StreamInfo.STREAM_INFO_ANY_INACTIVE;
    }

    void resetPipeline(String str, VideoCaptureConfig<T> videoCaptureConfig, Size size) {
        clearPipeline();
        if (isCurrentCamera(str)) {
            SessionConfig.Builder createPipeline = createPipeline(str, videoCaptureConfig, size);
            this.mSessionConfigBuilder = createPipeline;
            applyStreamInfoToSessionConfigBuilder(createPipeline, this.mStreamInfo);
            updateSessionConfig(this.mSessionConfigBuilder.build());
            notifyReset();
        }
    }

    public static final class Defaults implements ConfigProvider<VideoCaptureConfig<?>> {
        private static final VideoCaptureConfig<?> DEFAULT_CONFIG;
        static final Range<Integer> DEFAULT_FPS_RANGE;
        private static final int DEFAULT_SURFACE_OCCUPANCY_PRIORITY = 5;
        private static final Function<VideoEncoderConfig, VideoEncoderInfo> DEFAULT_VIDEO_ENCODER_INFO_FINDER;
        private static final VideoOutput DEFAULT_VIDEO_OUTPUT;

        static {
            VideoCapture$Defaults$$ExternalSyntheticLambda1 videoCapture$Defaults$$ExternalSyntheticLambda1 = new VideoOutput() { // from class: androidx.camera.video.VideoCapture$Defaults$$ExternalSyntheticLambda1
                @Override // androidx.camera.video.VideoOutput
                public /* synthetic */ Observable getMediaSpec() {
                    Observable withValue;
                    withValue = ConstantObservable.withValue(null);
                    return withValue;
                }

                @Override // androidx.camera.video.VideoOutput
                public /* synthetic */ Observable getStreamInfo() {
                    Observable observable;
                    observable = StreamInfo.ALWAYS_ACTIVE_OBSERVABLE;
                    return observable;
                }

                @Override // androidx.camera.video.VideoOutput
                public /* synthetic */ void onSourceStateChanged(VideoOutput.SourceState sourceState) {
                    VideoOutput.CC.$default$onSourceStateChanged(this, sourceState);
                }

                @Override // androidx.camera.video.VideoOutput
                public final void onSurfaceRequested(SurfaceRequest surfaceRequest) {
                    surfaceRequest.willNotProvideSurface();
                }

                @Override // androidx.camera.video.VideoOutput
                public /* synthetic */ void onSurfaceRequested(SurfaceRequest surfaceRequest, Timebase timebase) {
                    onSurfaceRequested(surfaceRequest);
                }
            };
            DEFAULT_VIDEO_OUTPUT = videoCapture$Defaults$$ExternalSyntheticLambda1;
            VideoCapture$Defaults$$ExternalSyntheticLambda0 videoCapture$Defaults$$ExternalSyntheticLambda0 = new Function() { // from class: androidx.camera.video.VideoCapture$Defaults$$ExternalSyntheticLambda0
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return VideoCapture.Defaults.lambda$static$0((VideoEncoderConfig) obj);
                }
            };
            DEFAULT_VIDEO_ENCODER_INFO_FINDER = videoCapture$Defaults$$ExternalSyntheticLambda0;
            DEFAULT_FPS_RANGE = new Range<>(30, 30);
            DEFAULT_CONFIG = new Builder(videoCapture$Defaults$$ExternalSyntheticLambda1).setSurfaceOccupancyPriority(5).setVideoEncoderInfoFinder(videoCapture$Defaults$$ExternalSyntheticLambda0).getUseCaseConfig();
        }

        static /* synthetic */ VideoEncoderInfo lambda$static$0(VideoEncoderConfig videoEncoderConfig) {
            try {
                return VideoEncoderInfoImpl.from(videoEncoderConfig);
            } catch (InvalidConfigException e) {
                Logger.w(VideoCapture.TAG, "Unable to find VideoEncoderInfo", e);
                return null;
            }
        }

        @Override // androidx.camera.core.impl.ConfigProvider
        public VideoCaptureConfig<?> getConfig() {
            return DEFAULT_CONFIG;
        }
    }

    private MediaSpec getMediaSpec() {
        return (MediaSpec) fetchObservableValue(getOutput().getMediaSpec(), null);
    }

    void applyStreamInfoToSessionConfigBuilder(SessionConfig.Builder builder, StreamInfo streamInfo) {
        boolean z = streamInfo.getId() == -1;
        boolean z2 = streamInfo.getStreamState() == StreamInfo.StreamState.ACTIVE;
        if (z && z2) {
            throw new IllegalStateException("Unexpected stream state, stream is error but active");
        }
        builder.clearSurfaces();
        if (!z) {
            if (z2) {
                builder.addSurface(this.mDeferrableSurface);
            } else {
                builder.addNonRepeatingSurface(this.mDeferrableSurface);
            }
        }
        setupSurfaceUpdateNotifier(builder, z2);
    }

    private SurfaceProcessorNode createNodeIfNeeded(boolean z) {
        if (this.mSurfaceProcessor == null && !ENABLE_SURFACE_PROCESSING_BY_QUIRK && !z) {
            return null;
        }
        Logger.d(TAG, "Surface processing is enabled.");
        CameraInternal camera = getCamera();
        Objects.requireNonNull(camera);
        SurfaceProcessorInternal surfaceProcessorInternal = this.mSurfaceProcessor;
        if (surfaceProcessorInternal == null) {
            surfaceProcessorInternal = new DefaultSurfaceProcessor();
        }
        return new SurfaceProcessorNode(camera, surfaceProcessorInternal);
    }

    SurfaceProcessorNode getNode() {
        return this.mNode;
    }

    private Rect adjustCropRectIfNeeded(Rect rect, Size size, Supplier<VideoEncoderInfo> supplier) {
        if (!isCropNeeded(rect, size)) {
            return rect;
        }
        VideoEncoderInfo videoEncoderInfo = supplier.get();
        if (videoEncoderInfo == null) {
            Logger.w(TAG, "Crop is needed but can't find the encoder info to adjust the cropRect");
            return rect;
        }
        return adjustCropRectToValidSize(rect, size, videoEncoderInfo);
    }

    private static Rect adjustCropRectToValidSize(final Rect rect, Size size, VideoEncoderInfo videoEncoderInfo) {
        Logger.d(TAG, String.format("Adjust cropRect %s by width/height alignment %d/%d and supported widths %s / supported heights %s", TransformUtils.rectToString(rect), Integer.valueOf(videoEncoderInfo.getWidthAlignment()), Integer.valueOf(videoEncoderInfo.getHeightAlignment()), videoEncoderInfo.getSupportedWidths(), videoEncoderInfo.getSupportedHeights()));
        int widthAlignment = videoEncoderInfo.getWidthAlignment();
        int heightAlignment = videoEncoderInfo.getHeightAlignment();
        Range<Integer> supportedWidths = videoEncoderInfo.getSupportedWidths();
        Range<Integer> supportedHeights = videoEncoderInfo.getSupportedHeights();
        int alignDown = alignDown(rect.width(), widthAlignment, supportedWidths);
        int alignUp = alignUp(rect.width(), widthAlignment, supportedWidths);
        int alignDown2 = alignDown(rect.height(), heightAlignment, supportedHeights);
        int alignUp2 = alignUp(rect.height(), heightAlignment, supportedHeights);
        HashSet hashSet = new HashSet();
        addBySupportedSize(hashSet, alignDown, alignDown2, size, videoEncoderInfo);
        addBySupportedSize(hashSet, alignDown, alignUp2, size, videoEncoderInfo);
        addBySupportedSize(hashSet, alignUp, alignDown2, size, videoEncoderInfo);
        addBySupportedSize(hashSet, alignUp, alignUp2, size, videoEncoderInfo);
        if (hashSet.isEmpty()) {
            Logger.w(TAG, "Can't find valid cropped size");
            return rect;
        }
        ArrayList arrayList = new ArrayList(hashSet);
        Logger.d(TAG, "candidatesList = " + arrayList);
        Collections.sort(arrayList, new Comparator() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda6
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return VideoCapture.lambda$adjustCropRectToValidSize$4(rect, (Size) obj, (Size) obj2);
            }
        });
        Logger.d(TAG, "sorted candidatesList = " + arrayList);
        Size size2 = (Size) arrayList.get(0);
        int width = size2.getWidth();
        int height = size2.getHeight();
        if (width == rect.width() && height == rect.height()) {
            Logger.d(TAG, "No need to adjust cropRect because crop size is valid.");
            return rect;
        }
        Preconditions.checkState(width % 2 == 0 && height % 2 == 0 && width <= size.getWidth() && height <= size.getHeight());
        Rect rect2 = new Rect(rect);
        if (width != rect.width()) {
            rect2.left = Math.max(0, rect.centerX() - (width / 2));
            rect2.right = rect2.left + width;
            if (rect2.right > size.getWidth()) {
                rect2.right = size.getWidth();
                rect2.left = rect2.right - width;
            }
        }
        if (height != rect.height()) {
            rect2.top = Math.max(0, rect.centerY() - (height / 2));
            rect2.bottom = rect2.top + height;
            if (rect2.bottom > size.getHeight()) {
                rect2.bottom = size.getHeight();
                rect2.top = rect2.bottom - height;
            }
        }
        Logger.d(TAG, String.format("Adjust cropRect from %s to %s", TransformUtils.rectToString(rect), TransformUtils.rectToString(rect2)));
        return rect2;
    }

    static /* synthetic */ int lambda$adjustCropRectToValidSize$4(Rect rect, Size size, Size size2) {
        return (Math.abs(size.getWidth() - rect.width()) + Math.abs(size.getHeight() - rect.height())) - (Math.abs(size2.getWidth() - rect.width()) + Math.abs(size2.getHeight() - rect.height()));
    }

    private static void addBySupportedSize(Set<Size> set, int i, int i2, Size size, VideoEncoderInfo videoEncoderInfo) {
        if (i > size.getWidth() || i2 > size.getHeight()) {
            return;
        }
        try {
            set.add(new Size(i, videoEncoderInfo.getSupportedHeightsFor(i).clamp(Integer.valueOf(i2)).intValue()));
        } catch (IllegalArgumentException e) {
            Logger.w(TAG, "No supportedHeights for width: " + i, e);
        }
        try {
            set.add(new Size(videoEncoderInfo.getSupportedWidthsFor(i2).clamp(Integer.valueOf(i)).intValue(), i2));
        } catch (IllegalArgumentException e2) {
            Logger.w(TAG, "No supportedWidths for height: " + i2, e2);
        }
    }

    private static boolean isCropNeeded(Rect rect, Size size) {
        return (size.getWidth() == rect.width() && size.getHeight() == rect.height()) ? false : true;
    }

    private static int alignDown(int i, int i2, Range<Integer> range) {
        return align(true, i, i2, range);
    }

    private static int alignUp(int i, int i2, Range<Integer> range) {
        return align(false, i, i2, range);
    }

    private static int align(boolean z, int i, int i2, Range<Integer> range) {
        int i3 = i % i2;
        if (i3 != 0) {
            i = z ? i - i3 : i + (i2 - i3);
        }
        return range.clamp(Integer.valueOf(i)).intValue();
    }

    private VideoEncoderInfo getVideoEncoderInfo(Function<VideoEncoderConfig, VideoEncoderInfo> function, VideoCapabilities videoCapabilities, Timebase timebase, MediaSpec mediaSpec, Size size, Range<Integer> range) {
        VideoEncoderInfo videoEncoderInfo = this.mVideoEncoderInfo;
        if (videoEncoderInfo != null) {
            return videoEncoderInfo;
        }
        VideoEncoderInfo resolveVideoEncoderInfo = resolveVideoEncoderInfo(function, videoCapabilities, timebase, mediaSpec, size, range);
        if (resolveVideoEncoderInfo == null) {
            return null;
        }
        VideoEncoderInfo from = VideoEncoderInfoWrapper.from(resolveVideoEncoderInfo, size);
        this.mVideoEncoderInfo = from;
        return from;
    }

    private static VideoEncoderInfo resolveVideoEncoderInfo(Function<VideoEncoderConfig, VideoEncoderInfo> function, VideoCapabilities videoCapabilities, Timebase timebase, MediaSpec mediaSpec, Size size, Range<Integer> range) {
        return function.apply(VideoConfigUtil.resolveVideoEncoderConfig(VideoConfigUtil.resolveVideoMimeInfo(mediaSpec, videoCapabilities.findHighestSupportedCamcorderProfileFor(size)), timebase, mediaSpec.getVideoSpec(), size, range));
    }

    private void setupSurfaceUpdateNotifier(final SessionConfig.Builder builder, final boolean z) {
        ListenableFuture<Void> listenableFuture = this.mSurfaceUpdateFuture;
        if (listenableFuture != null && listenableFuture.cancel(false)) {
            Logger.d(TAG, "A newer surface update is requested. Previous surface update cancelled.");
        }
        final ListenableFuture<Void> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return VideoCapture.this.m183xc7537f7(builder, completer);
            }
        });
        this.mSurfaceUpdateFuture = future;
        Futures.addCallback(future, new FutureCallback<Void>() { // from class: androidx.camera.video.VideoCapture.3
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void r2) {
                if (future != VideoCapture.this.mSurfaceUpdateFuture || VideoCapture.this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                    return;
                }
                VideoCapture.this.setSourceState(z ? VideoOutput.SourceState.ACTIVE_STREAMING : VideoOutput.SourceState.ACTIVE_NON_STREAMING);
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable th) {
                if (th instanceof CancellationException) {
                    return;
                }
                Logger.e(VideoCapture.TAG, "Surface update completed with unexpected exception", th);
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    /* renamed from: lambda$setupSurfaceUpdateNotifier$6$androidx-camera-video-VideoCapture, reason: not valid java name */
    /* synthetic */ Object m183xc7537f7(final SessionConfig.Builder builder, CallbackToFutureAdapter.Completer completer) throws Exception {
        builder.addTag(SURFACE_UPDATE_KEY, Integer.valueOf(completer.hashCode()));
        final AtomicBoolean atomicBoolean = new AtomicBoolean(false);
        final AnonymousClass2 anonymousClass2 = new AnonymousClass2(atomicBoolean, completer, builder);
        completer.addCancellationListener(new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                VideoCapture.lambda$setupSurfaceUpdateNotifier$5(atomicBoolean, builder, anonymousClass2);
            }
        }, CameraXExecutors.directExecutor());
        builder.addRepeatingCameraCaptureCallback(anonymousClass2);
        return String.format("%s[0x%x]", SURFACE_UPDATE_KEY, Integer.valueOf(completer.hashCode()));
    }

    /* renamed from: androidx.camera.video.VideoCapture$2, reason: invalid class name */
    class AnonymousClass2 extends CameraCaptureCallback {
        final /* synthetic */ CallbackToFutureAdapter.Completer val$completer;
        final /* synthetic */ SessionConfig.Builder val$sessionConfigBuilder;
        final /* synthetic */ AtomicBoolean val$surfaceUpdateComplete;

        AnonymousClass2(AtomicBoolean atomicBoolean, CallbackToFutureAdapter.Completer completer, SessionConfig.Builder builder) {
            this.val$surfaceUpdateComplete = atomicBoolean;
            this.val$completer = completer;
            this.val$sessionConfigBuilder = builder;
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureCompleted(CameraCaptureResult cameraCaptureResult) {
            Object tag;
            super.onCaptureCompleted(cameraCaptureResult);
            if (this.val$surfaceUpdateComplete.get() || (tag = cameraCaptureResult.getTagBundle().getTag(VideoCapture.SURFACE_UPDATE_KEY)) == null || ((Integer) tag).intValue() != this.val$completer.hashCode() || !this.val$completer.set(null) || this.val$surfaceUpdateComplete.getAndSet(true)) {
                return;
            }
            ScheduledExecutorService mainThreadExecutor = CameraXExecutors.mainThreadExecutor();
            final SessionConfig.Builder builder = this.val$sessionConfigBuilder;
            mainThreadExecutor.execute(new Runnable() { // from class: androidx.camera.video.VideoCapture$2$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    VideoCapture.AnonymousClass2.this.m184lambda$onCaptureCompleted$0$androidxcameravideoVideoCapture$2(builder);
                }
            });
        }

        /* renamed from: lambda$onCaptureCompleted$0$androidx-camera-video-VideoCapture$2, reason: not valid java name */
        /* synthetic */ void m184lambda$onCaptureCompleted$0$androidxcameravideoVideoCapture$2(SessionConfig.Builder builder) {
            builder.removeCameraCaptureCallback(this);
        }
    }

    static /* synthetic */ void lambda$setupSurfaceUpdateNotifier$5(AtomicBoolean atomicBoolean, SessionConfig.Builder builder, CameraCaptureCallback cameraCaptureCallback) {
        Preconditions.checkState(Threads.isMainThread(), "Surface update cancellation should only occur on main thread.");
        atomicBoolean.set(true);
        builder.removeCameraCaptureCallback(cameraCaptureCallback);
    }

    private void updateSupportedResolutionsByQuality(CameraInfoInternal cameraInfoInternal, UseCaseConfig.Builder<?, ?, ?> builder) throws IllegalArgumentException {
        MediaSpec mediaSpec = getMediaSpec();
        Preconditions.checkArgument(mediaSpec != null, "Unable to update target resolution by null MediaSpec.");
        if (QualitySelector.getSupportedQualities(cameraInfoInternal).isEmpty()) {
            Logger.w(TAG, "Can't find any supported quality on the device.");
            return;
        }
        QualitySelector qualitySelector = mediaSpec.getVideoSpec().getQualitySelector();
        List<Quality> prioritizedQualities = qualitySelector.getPrioritizedQualities(cameraInfoInternal);
        Logger.d(TAG, "Found selectedQualities " + prioritizedQualities + " by " + qualitySelector);
        if (prioritizedQualities.isEmpty()) {
            throw new IllegalArgumentException("Unable to find supported quality by QualitySelector");
        }
        ArrayList arrayList = new ArrayList();
        Iterator<Quality> it = prioritizedQualities.iterator();
        while (it.hasNext()) {
            arrayList.add(QualitySelector.getResolution(cameraInfoInternal, it.next()));
        }
        Logger.d(TAG, "Set supported resolutions = " + arrayList);
        List<Size> filterOutResolutions = filterOutResolutions(arrayList);
        Logger.d(TAG, "supportedResolutions after filter out " + filterOutResolutions);
        Preconditions.checkState(prioritizedQualities.isEmpty() ^ true, "No supportedResolutions after filter out");
        builder.getMutableConfig().insertOption(ImageOutputConfig.OPTION_SUPPORTED_RESOLUTIONS, Collections.singletonList(Pair.create(Integer.valueOf(getImageFormat()), (Size[]) filterOutResolutions.toArray(new Size[0]))));
    }

    static List<Size> filterOutResolutions(List<Size> list) {
        ArrayList arrayList = new ArrayList(list.size());
        int i = Integer.MAX_VALUE;
        for (Size size : list) {
            int area = getArea(size);
            if (area < i) {
                arrayList.add(size);
                i = area;
            }
        }
        return arrayList;
    }

    private static boolean hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing() {
        Iterator it = DeviceQuirks.getAll(VideoQualityQuirk.class).iterator();
        while (it.hasNext()) {
            if (((VideoQualityQuirk) it.next()).workaroundBySurfaceProcessing()) {
                return true;
            }
        }
        return false;
    }

    private static int getArea(Size size) {
        return size.getWidth() * size.getHeight();
    }

    private static <T> T fetchObservableValue(Observable<T> observable, T t) {
        ListenableFuture<T> fetchData = observable.fetchData();
        if (!fetchData.isDone()) {
            return t;
        }
        try {
            return fetchData.get();
        } catch (InterruptedException | ExecutionException e) {
            throw new IllegalStateException(e);
        }
    }

    void setSourceState(VideoOutput.SourceState sourceState) {
        if (sourceState != this.mSourceState) {
            this.mSourceState = sourceState;
            getOutput().onSourceStateChanged(sourceState);
        }
    }

    public static final class Builder<T extends VideoOutput> implements UseCaseConfig.Builder<VideoCapture<T>, VideoCaptureConfig<T>, Builder<T>>, ImageOutputConfig.Builder<Builder<T>>, ThreadConfig.Builder<Builder<T>> {
        private final MutableOptionsBundle mMutableConfig;

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* synthetic */ Object setSupportedResolutions(List list) {
            return setSupportedResolutions((List<Pair<Integer, Size[]>>) list);
        }

        Builder(T t) {
            this(createInitialBundle(t));
        }

        private Builder(MutableOptionsBundle mutableOptionsBundle) {
            this.mMutableConfig = mutableOptionsBundle;
            if (!mutableOptionsBundle.containsOption(VideoCaptureConfig.OPTION_VIDEO_OUTPUT)) {
                throw new IllegalArgumentException("VideoOutput is required");
            }
            Class cls = (Class) mutableOptionsBundle.retrieveOption(TargetConfig.OPTION_TARGET_CLASS, null);
            if (cls != null && !cls.equals(VideoCapture.class)) {
                throw new IllegalArgumentException("Invalid target class configuration for " + this + ": " + cls);
            }
            setTargetClass((Class) VideoCapture.class);
        }

        static Builder<? extends VideoOutput> fromConfig(Config config) {
            return new Builder<>(MutableOptionsBundle.from(config));
        }

        public static <T extends VideoOutput> Builder<T> fromConfig(VideoCaptureConfig<T> videoCaptureConfig) {
            return new Builder<>(MutableOptionsBundle.from((Config) videoCaptureConfig));
        }

        private static <T extends VideoOutput> MutableOptionsBundle createInitialBundle(T t) {
            MutableOptionsBundle create = MutableOptionsBundle.create();
            create.insertOption(VideoCaptureConfig.OPTION_VIDEO_OUTPUT, t);
            return create;
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public MutableConfig getMutableConfig() {
            return this.mMutableConfig;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public VideoCaptureConfig<T> getUseCaseConfig() {
            return new VideoCaptureConfig<>(OptionsBundle.from(this.mMutableConfig));
        }

        Builder<T> setVideoEncoderInfoFinder(Function<VideoEncoderConfig, VideoEncoderInfo> function) {
            getMutableConfig().insertOption(VideoCaptureConfig.OPTION_VIDEO_ENCODER_INFO_FINDER, function);
            return this;
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public VideoCapture<T> build() {
            return new VideoCapture<>(getUseCaseConfig());
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder<T> setTargetClass(Class<VideoCapture<T>> cls) {
            getMutableConfig().insertOption(TargetConfig.OPTION_TARGET_CLASS, cls);
            if (getMutableConfig().retrieveOption(TargetConfig.OPTION_TARGET_NAME, null) == null) {
                setTargetName(cls.getCanonicalName() + "-" + UUID.randomUUID());
            }
            return this;
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder<T> setTargetName(String str) {
            getMutableConfig().insertOption(TargetConfig.OPTION_TARGET_NAME, str);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setTargetAspectRatio(int i) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO, Integer.valueOf(i));
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setTargetRotation(int i) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_TARGET_ROTATION, Integer.valueOf(i));
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setTargetResolution(Size size) {
            throw new UnsupportedOperationException("setTargetResolution is not supported.");
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setDefaultResolution(Size size) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_DEFAULT_RESOLUTION, size);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setMaxResolution(Size size) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_MAX_RESOLUTION, size);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setSupportedResolutions(List<Pair<Integer, Size[]>> list) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_SUPPORTED_RESOLUTIONS, list);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setResolutionSelector(ResolutionSelector resolutionSelector) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, resolutionSelector);
            return this;
        }

        @Override // androidx.camera.core.internal.ThreadConfig.Builder
        public Builder<T> setBackgroundExecutor(Executor executor) {
            getMutableConfig().insertOption(ThreadConfig.OPTION_BACKGROUND_EXECUTOR, executor);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setDefaultSessionConfig(SessionConfig sessionConfig) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_DEFAULT_SESSION_CONFIG, sessionConfig);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setDefaultCaptureConfig(CaptureConfig captureConfig) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_DEFAULT_CAPTURE_CONFIG, captureConfig);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_SESSION_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setSurfaceOccupancyPriority(int i) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(i));
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setCameraSelector(CameraSelector cameraSelector) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAMERA_SELECTOR, cameraSelector);
            return this;
        }

        @Override // androidx.camera.core.internal.UseCaseEventConfig.Builder
        public Builder<T> setUseCaseEventCallback(UseCase.EventCallback eventCallback) {
            getMutableConfig().insertOption(UseCaseEventConfig.OPTION_USE_CASE_EVENT_CALLBACK, eventCallback);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setZslDisabled(boolean z) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, Boolean.valueOf(z));
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setHighResolutionDisabled(boolean z) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_HIGH_RESOLUTION_DISABLED, Boolean.valueOf(z));
            return this;
        }
    }
}
