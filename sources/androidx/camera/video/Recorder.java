package androidx.camera.video;

import android.content.ContentValues;
import android.content.Context;
import android.location.Location;
import android.media.MediaMuxer;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.util.Pair;
import android.view.Surface;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.CamcorderProfileProxy;
import androidx.camera.core.impl.MutableStateObservable;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.StateObservable;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.utils.CloseGuardHelper;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.utils.ArrayRingBuffer;
import androidx.camera.core.internal.utils.RingBuffer;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.MediaSpec;
import androidx.camera.video.Recorder;
import androidx.camera.video.StreamInfo;
import androidx.camera.video.VideoOutput;
import androidx.camera.video.VideoRecordEvent;
import androidx.camera.video.VideoSpec;
import androidx.camera.video.internal.AudioSource;
import androidx.camera.video.internal.AudioSourceAccessException;
import androidx.camera.video.internal.DebugUtils;
import androidx.camera.video.internal.compat.Api26Impl;
import androidx.camera.video.internal.compat.quirk.DeactivateEncoderSurfaceBeforeStopEncoderQuirk;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.EncoderNotUsePersistentInputSurfaceQuirk;
import androidx.camera.video.internal.config.AudioConfigUtil;
import androidx.camera.video.internal.config.MimeInfo;
import androidx.camera.video.internal.config.VideoConfigUtil;
import androidx.camera.video.internal.encoder.BufferCopiedEncodedData;
import androidx.camera.video.internal.encoder.EncodeException;
import androidx.camera.video.internal.encoder.EncodedData;
import androidx.camera.video.internal.encoder.Encoder;
import androidx.camera.video.internal.encoder.EncoderCallback;
import androidx.camera.video.internal.encoder.EncoderConfig;
import androidx.camera.video.internal.encoder.EncoderFactory;
import androidx.camera.video.internal.encoder.EncoderImpl;
import androidx.camera.video.internal.encoder.InvalidConfigException;
import androidx.camera.video.internal.encoder.OutputConfig;
import androidx.camera.video.internal.utils.OutputUtil;
import androidx.camera.video.internal.workaround.CorrectNegativeLatLongForMediaMuxer;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.internal.LongCompanionObject;

/* loaded from: classes.dex */
public final class Recorder implements VideoOutput {
    private static final int AUDIO_CACHE_SIZE = 60;
    private static final Executor AUDIO_EXECUTOR;
    static final EncoderFactory DEFAULT_ENCODER_FACTORY;
    public static final QualitySelector DEFAULT_QUALITY_SELECTOR;
    private static final String MEDIA_COLUMN = "_data";
    private static final MediaSpec MEDIA_SPEC_DEFAULT;
    private static final int NOT_PENDING = 0;
    private static final int PENDING = 1;
    private static final Exception PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE;
    private static final long SOURCE_NON_STREAMING_TIMEOUT_MS = 1000;
    private static final String TAG = "Recorder";
    private static final VideoSpec VIDEO_SPEC_DEFAULT;
    private final EncoderFactory mAudioEncoderFactory;
    private final Executor mExecutor;
    final MutableStateObservable<MediaSpec> mMediaSpec;
    final Executor mSequentialExecutor;
    private boolean mShouldWaitForNewSurface;
    private final MutableStateObservable<StreamInfo> mStreamInfo;
    SurfaceRequest mSurfaceRequest;
    private final Executor mUserProvidedExecutor;
    private final EncoderFactory mVideoEncoderFactory;
    Timebase mVideoSourceTimebase;
    private static final Set<State> PENDING_STATES = Collections.unmodifiableSet(EnumSet.of(State.PENDING_RECORDING, State.PENDING_PAUSED));
    private static final Set<State> VALID_NON_PENDING_STATES_WHILE_PENDING = Collections.unmodifiableSet(EnumSet.of(State.INITIALIZING, State.IDLING, State.RESETTING, State.STOPPING, State.ERROR));
    private final Object mLock = new Object();
    private State mState = State.INITIALIZING;
    private State mNonPendingState = null;
    int mStreamId = 0;
    RecordingRecord mActiveRecordingRecord = null;
    RecordingRecord mPendingRecordingRecord = null;
    private long mLastGeneratedRecordingId = 0;
    private RecordingRecord mInProgressRecording = null;
    boolean mInProgressRecordingStopping = false;
    private SurfaceRequest.TransformationInfo mSurfaceTransformationInfo = null;
    private CamcorderProfileProxy mResolvedCamcorderProfile = null;
    final List<ListenableFuture<Void>> mEncodingFutures = new ArrayList();
    Integer mAudioTrackIndex = null;
    Integer mVideoTrackIndex = null;
    Surface mLatestSurface = null;
    Surface mActiveSurface = null;
    MediaMuxer mMediaMuxer = null;
    AudioSource mAudioSource = null;
    Encoder mVideoEncoder = null;
    OutputConfig mVideoOutputConfig = null;
    Encoder mAudioEncoder = null;
    OutputConfig mAudioOutputConfig = null;
    AudioState mAudioState = AudioState.INITIALIZING;
    Uri mOutputUri = Uri.EMPTY;
    long mRecordingBytes = 0;
    long mRecordingDurationNs = 0;
    long mFirstRecordingVideoDataTimeUs = LongCompanionObject.MAX_VALUE;
    long mFirstRecordingAudioDataTimeUs = LongCompanionObject.MAX_VALUE;
    long mPreviousRecordingVideoDataTimeUs = LongCompanionObject.MAX_VALUE;
    long mPreviousRecordingAudioDataTimeUs = LongCompanionObject.MAX_VALUE;
    long mFileSizeLimitInBytes = 0;
    long mDurationLimitNs = 0;
    int mRecordingStopError = 1;
    Throwable mRecordingStopErrorCause = null;
    EncodedData mPendingFirstVideoData = null;
    final RingBuffer<EncodedData> mPendingAudioRingBuffer = new ArrayRingBuffer(60);
    Throwable mAudioErrorCause = null;
    boolean mIsAudioSourceSilenced = false;
    VideoOutput.SourceState mSourceState = VideoOutput.SourceState.INACTIVE;
    private ScheduledFuture<?> mSourceNonStreamingTimeout = null;

    enum AudioState {
        INITIALIZING,
        IDLING,
        DISABLED,
        ACTIVE,
        ERROR_ENCODER,
        ERROR_SOURCE
    }

    enum State {
        INITIALIZING,
        PENDING_RECORDING,
        PENDING_PAUSED,
        IDLING,
        RECORDING,
        PAUSED,
        STOPPING,
        RESETTING,
        ERROR
    }

    static {
        QualitySelector fromOrderedList = QualitySelector.fromOrderedList(Arrays.asList(Quality.FHD, Quality.HD, Quality.SD), FallbackStrategy.higherQualityOrLowerThan(Quality.FHD));
        DEFAULT_QUALITY_SELECTOR = fromOrderedList;
        VideoSpec build = VideoSpec.builder().setQualitySelector(fromOrderedList).setAspectRatio(1).build();
        VIDEO_SPEC_DEFAULT = build;
        MEDIA_SPEC_DEFAULT = MediaSpec.builder().setOutputFormat(-1).setVideoSpec(build).build();
        PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE = new RuntimeException("The video frame producer became inactive before any data was received.");
        DEFAULT_ENCODER_FACTORY = new EncoderFactory() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda11
            @Override // androidx.camera.video.internal.encoder.EncoderFactory
            public final Encoder createEncoder(Executor executor, EncoderConfig encoderConfig) {
                return new EncoderImpl(executor, encoderConfig);
            }
        };
        AUDIO_EXECUTOR = CameraXExecutors.newSequentialExecutor(CameraXExecutors.ioExecutor());
    }

    Recorder(Executor executor, MediaSpec mediaSpec, EncoderFactory encoderFactory, EncoderFactory encoderFactory2) {
        this.mUserProvidedExecutor = executor;
        executor = executor == null ? CameraXExecutors.ioExecutor() : executor;
        this.mExecutor = executor;
        this.mSequentialExecutor = CameraXExecutors.newSequentialExecutor(executor);
        this.mMediaSpec = MutableStateObservable.withInitialState(composeRecorderMediaSpec(mediaSpec));
        this.mStreamInfo = MutableStateObservable.withInitialState(StreamInfo.of(this.mStreamId, internalStateToStreamState(this.mState)));
        this.mVideoEncoderFactory = encoderFactory;
        this.mAudioEncoderFactory = encoderFactory2;
    }

    @Override // androidx.camera.video.VideoOutput
    public void onSurfaceRequested(SurfaceRequest surfaceRequest) {
        onSurfaceRequested(surfaceRequest, Timebase.UPTIME);
    }

    @Override // androidx.camera.video.VideoOutput
    public void onSurfaceRequested(final SurfaceRequest surfaceRequest, final Timebase timebase) {
        synchronized (this.mLock) {
            Logger.d(TAG, "Surface is requested in state: " + this.mState + ", Current surface: " + this.mStreamId);
            switch (AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()]) {
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                    this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda2
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.this.m170lambda$onSurfaceRequested$0$androidxcameravideoRecorder(surfaceRequest, timebase);
                        }
                    });
                    break;
                case 6:
                case 7:
                case 8:
                    throw new IllegalStateException("Surface was requested when the Recorder had been initialized with state " + this.mState);
                case 9:
                    Logger.w(TAG, "Surface was requested when the Recorder had encountered error.");
                    setState(State.INITIALIZING);
                    this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda3
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.this.m171lambda$onSurfaceRequested$1$androidxcameravideoRecorder(surfaceRequest, timebase);
                        }
                    });
                    break;
            }
        }
    }

    /* renamed from: lambda$onSurfaceRequested$0$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m170lambda$onSurfaceRequested$0$androidxcameravideoRecorder(SurfaceRequest surfaceRequest, Timebase timebase) {
        this.mSurfaceRequest = surfaceRequest;
        this.mVideoSourceTimebase = timebase;
        initializeInternal(surfaceRequest, timebase);
    }

    /* renamed from: lambda$onSurfaceRequested$1$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m171lambda$onSurfaceRequested$1$androidxcameravideoRecorder(SurfaceRequest surfaceRequest, Timebase timebase) {
        SurfaceRequest surfaceRequest2 = this.mSurfaceRequest;
        if (surfaceRequest2 != null) {
            surfaceRequest2.willNotProvideSurface();
        }
        this.mSurfaceRequest = surfaceRequest;
        this.mVideoSourceTimebase = timebase;
        initializeInternal(surfaceRequest, timebase);
    }

    @Override // androidx.camera.video.VideoOutput
    public Observable<MediaSpec> getMediaSpec() {
        return this.mMediaSpec;
    }

    @Override // androidx.camera.video.VideoOutput
    public Observable<StreamInfo> getStreamInfo() {
        return this.mStreamInfo;
    }

    @Override // androidx.camera.video.VideoOutput
    public void onSourceStateChanged(final VideoOutput.SourceState sourceState) {
        this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                Recorder.this.m169lambda$onSourceStateChanged$2$androidxcameravideoRecorder(sourceState);
            }
        });
    }

    public PendingRecording prepareRecording(Context context, FileOutputOptions fileOutputOptions) {
        return prepareRecordingInternal(context, fileOutputOptions);
    }

    public PendingRecording prepareRecording(Context context, FileDescriptorOutputOptions fileDescriptorOutputOptions) {
        if (Build.VERSION.SDK_INT < 26) {
            throw new UnsupportedOperationException("File descriptors as output destinations are not supported on pre-Android O (API 26) devices.");
        }
        return prepareRecordingInternal(context, fileDescriptorOutputOptions);
    }

    public PendingRecording prepareRecording(Context context, MediaStoreOutputOptions mediaStoreOutputOptions) {
        return prepareRecordingInternal(context, mediaStoreOutputOptions);
    }

    private PendingRecording prepareRecordingInternal(Context context, OutputOptions outputOptions) {
        Preconditions.checkNotNull(outputOptions, "The OutputOptions cannot be null.");
        return new PendingRecording(context, this, outputOptions);
    }

    public QualitySelector getQualitySelector() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getVideoSpec().getQualitySelector();
    }

    int getAudioSource() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getAudioSpec().getSource();
    }

    public Executor getExecutor() {
        return this.mUserProvidedExecutor;
    }

    int getAspectRatio() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getVideoSpec().getAspectRatio();
    }

    Recording start(PendingRecording pendingRecording) {
        long j;
        int i;
        RecordingRecord recordingRecord;
        RecordingRecord recordingRecord2;
        Preconditions.checkNotNull(pendingRecording, "The given PendingRecording cannot be null.");
        synchronized (this.mLock) {
            j = this.mLastGeneratedRecordingId + 1;
            this.mLastGeneratedRecordingId = j;
            i = 0;
            recordingRecord = null;
            switch (AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()]) {
                case 1:
                case 2:
                case 5:
                case 6:
                case 9:
                    if (this.mState == State.IDLING) {
                        Preconditions.checkState(this.mActiveRecordingRecord == null && this.mPendingRecordingRecord == null, "Expected recorder to be idle but a recording is either pending or in progress.");
                    }
                    try {
                        RecordingRecord from = RecordingRecord.from(pendingRecording, j);
                        from.initializeRecording(pendingRecording.getApplicationContext());
                        this.mPendingRecordingRecord = from;
                        if (this.mState == State.IDLING) {
                            setState(State.PENDING_RECORDING);
                            this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda1
                                @Override // java.lang.Runnable
                                public final void run() {
                                    Recorder.this.tryServicePendingRecording();
                                }
                            });
                        } else if (this.mState == State.ERROR) {
                            setState(State.PENDING_RECORDING);
                            this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda18
                                @Override // java.lang.Runnable
                                public final void run() {
                                    Recorder.this.m176lambda$start$3$androidxcameravideoRecorder();
                                }
                            });
                        } else {
                            setState(State.PENDING_RECORDING);
                        }
                        e = null;
                        break;
                    } catch (IOException e) {
                        e = e;
                        i = 5;
                        break;
                    }
                case 3:
                case 4:
                    recordingRecord2 = (RecordingRecord) Preconditions.checkNotNull(this.mPendingRecordingRecord);
                    recordingRecord = recordingRecord2;
                    e = null;
                    break;
                case 7:
                case 8:
                    recordingRecord2 = this.mActiveRecordingRecord;
                    recordingRecord = recordingRecord2;
                    e = null;
                    break;
                default:
                    e = null;
                    break;
            }
        }
        if (recordingRecord != null) {
            throw new IllegalStateException("A recording is already in progress. Previous recordings must be stopped before a new recording can be started.");
        }
        if (i != 0) {
            Logger.e(TAG, "Recording was started when the Recorder had encountered error " + e);
            finalizePendingRecording(RecordingRecord.from(pendingRecording, j), i, e);
            return Recording.createFinalizedFrom(pendingRecording, j);
        }
        return Recording.from(pendingRecording, j);
    }

    /* renamed from: lambda$start$3$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m176lambda$start$3$androidxcameravideoRecorder() {
        SurfaceRequest surfaceRequest = this.mSurfaceRequest;
        if (surfaceRequest == null) {
            throw new AssertionError("surface request is required to retry initialization.");
        }
        initializeInternal(surfaceRequest, this.mVideoSourceTimebase);
    }

    void pause(Recording recording) {
        synchronized (this.mLock) {
            if (!isSameRecording(recording, this.mPendingRecordingRecord) && !isSameRecording(recording, this.mActiveRecordingRecord)) {
                Logger.d(TAG, "pause() called on a recording that is no longer active: " + recording.getOutputOptions());
                return;
            }
            int i = AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()];
            if (i == 3) {
                setState(State.PENDING_PAUSED);
            } else {
                if (i == 5 || i == 6) {
                    throw new IllegalStateException("Called pause() from invalid state: " + this.mState);
                }
                if (i == 7) {
                    setState(State.PAUSED);
                    final RecordingRecord recordingRecord = this.mActiveRecordingRecord;
                    this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda4
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.this.m172lambda$pause$4$androidxcameravideoRecorder(recordingRecord);
                        }
                    });
                }
            }
        }
    }

    void resume(Recording recording) {
        synchronized (this.mLock) {
            if (!isSameRecording(recording, this.mPendingRecordingRecord) && !isSameRecording(recording, this.mActiveRecordingRecord)) {
                Logger.d(TAG, "resume() called on a recording that is no longer active: " + recording.getOutputOptions());
                return;
            }
            int i = AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()];
            if (i == 4) {
                setState(State.PENDING_RECORDING);
            } else {
                if (i == 5 || i == 6) {
                    throw new IllegalStateException("Called resume() from invalid state: " + this.mState);
                }
                if (i == 8) {
                    setState(State.RECORDING);
                    final RecordingRecord recordingRecord = this.mActiveRecordingRecord;
                    this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda5
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.this.m173lambda$resume$5$androidxcameravideoRecorder(recordingRecord);
                        }
                    });
                }
            }
        }
    }

    void stop(Recording recording) {
        synchronized (this.mLock) {
            if (!isSameRecording(recording, this.mPendingRecordingRecord) && !isSameRecording(recording, this.mActiveRecordingRecord)) {
                Logger.d(TAG, "stop() called on a recording that is no longer active: " + recording.getOutputOptions());
                return;
            }
            RecordingRecord recordingRecord = null;
            switch (AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()]) {
                case 1:
                case 2:
                    Preconditions.checkState(isSameRecording(recording, this.mActiveRecordingRecord));
                    break;
                case 3:
                case 4:
                    Preconditions.checkState(isSameRecording(recording, this.mPendingRecordingRecord));
                    RecordingRecord recordingRecord2 = this.mPendingRecordingRecord;
                    this.mPendingRecordingRecord = null;
                    restoreNonPendingState();
                    recordingRecord = recordingRecord2;
                    break;
                case 5:
                case 6:
                    throw new IllegalStateException("Calling stop() while idling or initializing is invalid.");
                case 7:
                case 8:
                    setState(State.STOPPING);
                    final long micros = TimeUnit.NANOSECONDS.toMicros(System.nanoTime());
                    final RecordingRecord recordingRecord3 = this.mActiveRecordingRecord;
                    this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda6
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.this.m177lambda$stop$6$androidxcameravideoRecorder(recordingRecord3, micros);
                        }
                    });
                    break;
            }
            if (recordingRecord != null) {
                finalizePendingRecording(recordingRecord, 8, new RuntimeException("Recording was stopped before any data could be produced."));
            }
        }
    }

    /* renamed from: lambda$stop$6$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m177lambda$stop$6$androidxcameravideoRecorder(RecordingRecord recordingRecord, long j) {
        stopInternal(recordingRecord, Long.valueOf(j), 0, null);
    }

    private void finalizePendingRecording(RecordingRecord recordingRecord, int i, Throwable th) {
        recordingRecord.finalizeRecording(Uri.EMPTY);
        recordingRecord.updateVideoRecordEvent(VideoRecordEvent.finalizeWithError(recordingRecord.getOutputOptions(), RecordingStats.of(0L, 0L, AudioStats.of(1, this.mAudioErrorCause)), OutputResults.of(Uri.EMPTY), i, th));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: onSourceStateChangedInternal, reason: merged with bridge method [inline-methods] */
    public void m169lambda$onSourceStateChanged$2$androidxcameravideoRecorder(VideoOutput.SourceState sourceState) {
        ScheduledFuture<?> scheduledFuture;
        Encoder encoder;
        VideoOutput.SourceState sourceState2 = this.mSourceState;
        this.mSourceState = sourceState;
        if (sourceState2 != sourceState) {
            Logger.d(TAG, "Video source has transitioned to state: " + sourceState);
            if (sourceState == VideoOutput.SourceState.INACTIVE) {
                if (this.mActiveSurface == null) {
                    reset(4, null);
                    setLatestSurface(null);
                    return;
                } else {
                    RecordingRecord recordingRecord = this.mInProgressRecording;
                    if (recordingRecord != null) {
                        onInProgressRecordingInternalError(recordingRecord, 4, null);
                        return;
                    }
                    return;
                }
            }
            if (sourceState != VideoOutput.SourceState.ACTIVE_NON_STREAMING || (scheduledFuture = this.mSourceNonStreamingTimeout) == null || !scheduledFuture.cancel(false) || (encoder = this.mVideoEncoder) == null) {
                return;
            }
            notifyEncoderSourceStopped(encoder);
            return;
        }
        Logger.d(TAG, "Video source transitions to the same state: " + sourceState);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    void reset(int i, Throwable th) {
        boolean z;
        boolean z2;
        synchronized (this.mLock) {
            z = false;
            z2 = true;
            switch (AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()]) {
                case 1:
                    setState(State.RESETTING);
                    z2 = false;
                    break;
                case 2:
                default:
                    z2 = false;
                    break;
                case 3:
                case 4:
                    updateNonPendingState(State.RESETTING);
                    z = true;
                    z2 = false;
                    break;
                case 5:
                    z = true;
                    z2 = false;
                    break;
                case 6:
                case 9:
                    setState(State.INITIALIZING);
                    z = true;
                    z2 = false;
                    break;
                case 7:
                case 8:
                    if (this.mActiveRecordingRecord != this.mInProgressRecording) {
                        throw new AssertionError("In-progress recording does not match the active recording. Unable to reset encoder.");
                    }
                    setState(State.RESETTING);
                    break;
            }
        }
        if (z) {
            resetInternal();
        } else if (z2) {
            stopInternal(this.mInProgressRecording, null, i, th);
        }
    }

    private void initializeInternal(SurfaceRequest surfaceRequest, Timebase timebase) {
        Surface surface = this.mLatestSurface;
        if (surface != null) {
            this.mActiveSurface = surface;
            surfaceRequest.provideSurface(surface, this.mSequentialExecutor, new Recorder$$ExternalSyntheticLambda15(this));
            onInitialized();
        } else {
            surfaceRequest.setTransformationInfoListener(this.mSequentialExecutor, new SurfaceRequest.TransformationInfoListener() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda0
                @Override // androidx.camera.core.SurfaceRequest.TransformationInfoListener
                public final void onTransformationInfoUpdate(SurfaceRequest.TransformationInfo transformationInfo) {
                    Recorder.this.m168lambda$initializeInternal$7$androidxcameravideoRecorder(transformationInfo);
                }
            });
            this.mResolvedCamcorderProfile = VideoCapabilities.from(surfaceRequest.getCamera().getCameraInfo()).findHighestSupportedCamcorderProfileFor(surfaceRequest.getResolution());
            setupVideo(surfaceRequest, timebase);
        }
    }

    /* renamed from: lambda$initializeInternal$7$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m168lambda$initializeInternal$7$androidxcameravideoRecorder(SurfaceRequest.TransformationInfo transformationInfo) {
        this.mSurfaceTransformationInfo = transformationInfo;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0029  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x002b A[Catch: all -> 0x0082, TryCatch #0 {, blocks: (B:4:0x0003, B:5:0x000f, B:9:0x0075, B:18:0x0014, B:19:0x001c, B:21:0x0025, B:24:0x002b, B:26:0x0031, B:27:0x003f, B:29:0x004a, B:30:0x0062, B:31:0x0063, B:33:0x0067, B:34:0x006a, B:35:0x0071), top: B:3:0x0003 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    private void onInitialized() {
        /*
            r7 = this;
            java.lang.Object r0 = r7.mLock
            monitor-enter(r0)
            int[] r1 = androidx.camera.video.Recorder.AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State     // Catch: java.lang.Throwable -> L82
            androidx.camera.video.Recorder$State r2 = r7.mState     // Catch: java.lang.Throwable -> L82
            int r2 = r2.ordinal()     // Catch: java.lang.Throwable -> L82
            r1 = r1[r2]     // Catch: java.lang.Throwable -> L82
            r2 = 0
            r3 = 0
            switch(r1) {
                case 1: goto L63;
                case 2: goto L4a;
                case 3: goto L24;
                case 4: goto L22;
                case 5: goto L1c;
                case 6: goto L4a;
                case 7: goto L4a;
                case 8: goto L4a;
                case 9: goto L14;
                default: goto L12;
            }     // Catch: java.lang.Throwable -> L82
        L12:
            goto L72
        L14:
            java.lang.String r1 = "Recorder"
            java.lang.String r4 = "onInitialized() was invoked when the Recorder had encountered error"
            androidx.camera.core.Logger.e(r1, r4)     // Catch: java.lang.Throwable -> L82
            goto L72
        L1c:
            androidx.camera.video.Recorder$State r1 = androidx.camera.video.Recorder.State.IDLING     // Catch: java.lang.Throwable -> L82
            r7.setState(r1)     // Catch: java.lang.Throwable -> L82
            goto L72
        L22:
            r1 = 1
            goto L25
        L24:
            r1 = 0
        L25:
            androidx.camera.video.Recorder$RecordingRecord r4 = r7.mActiveRecordingRecord     // Catch: java.lang.Throwable -> L82
            if (r4 == 0) goto L2b
            r2 = r1
            goto L72
        L2b:
            androidx.camera.video.VideoOutput$SourceState r4 = r7.mSourceState     // Catch: java.lang.Throwable -> L82
            androidx.camera.video.VideoOutput$SourceState r5 = androidx.camera.video.VideoOutput.SourceState.INACTIVE     // Catch: java.lang.Throwable -> L82
            if (r4 != r5) goto L3f
            androidx.camera.video.Recorder$RecordingRecord r2 = r7.mPendingRecordingRecord     // Catch: java.lang.Throwable -> L82
            r7.mPendingRecordingRecord = r3     // Catch: java.lang.Throwable -> L82
            r7.restoreNonPendingState()     // Catch: java.lang.Throwable -> L82
            r4 = 4
            java.lang.Exception r5 = androidx.camera.video.Recorder.PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE     // Catch: java.lang.Throwable -> L82
            r6 = r2
            r2 = r1
            r1 = r6
            goto L75
        L3f:
            androidx.camera.video.Recorder$State r4 = r7.mState     // Catch: java.lang.Throwable -> L82
            androidx.camera.video.Recorder$RecordingRecord r4 = r7.makePendingRecordingActiveLocked(r4)     // Catch: java.lang.Throwable -> L82
            r2 = r1
            r1 = r3
            r5 = r1
            r3 = r4
            goto L74
        L4a:
            java.lang.AssertionError r1 = new java.lang.AssertionError     // Catch: java.lang.Throwable -> L82
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L82
            r2.<init>()     // Catch: java.lang.Throwable -> L82
            java.lang.String r3 = "Incorrectly invoke onInitialized() in state "
            r2.append(r3)     // Catch: java.lang.Throwable -> L82
            androidx.camera.video.Recorder$State r3 = r7.mState     // Catch: java.lang.Throwable -> L82
            r2.append(r3)     // Catch: java.lang.Throwable -> L82
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> L82
            r1.<init>(r2)     // Catch: java.lang.Throwable -> L82
            throw r1     // Catch: java.lang.Throwable -> L82
        L63:
            boolean r1 = r7.mShouldWaitForNewSurface     // Catch: java.lang.Throwable -> L82
            if (r1 == 0) goto L6a
            r7.mShouldWaitForNewSurface = r2     // Catch: java.lang.Throwable -> L82
            goto L72
        L6a:
            java.lang.AssertionError r1 = new java.lang.AssertionError     // Catch: java.lang.Throwable -> L82
            java.lang.String r2 = "Unexpectedly invoke onInitialized() in a STOPPING state when it's not waiting for a new surface."
            r1.<init>(r2)     // Catch: java.lang.Throwable -> L82
            throw r1     // Catch: java.lang.Throwable -> L82
        L72:
            r1 = r3
            r5 = r1
        L74:
            r4 = 0
        L75:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L82
            if (r3 == 0) goto L7c
            r7.startRecording(r3, r2)
            goto L81
        L7c:
            if (r1 == 0) goto L81
            r7.finalizePendingRecording(r1, r4, r5)
        L81:
            return
        L82:
            r1 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L82
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.Recorder.onInitialized():void");
    }

    private MediaSpec composeRecorderMediaSpec(MediaSpec mediaSpec) {
        MediaSpec.Builder builder = mediaSpec.toBuilder();
        if (mediaSpec.getVideoSpec().getAspectRatio() == -1) {
            builder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda17
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setAspectRatio(Recorder.VIDEO_SPEC_DEFAULT.getAspectRatio());
                }
            });
        }
        return builder.build();
    }

    private static boolean isSameRecording(Recording recording, RecordingRecord recordingRecord) {
        return recordingRecord != null && recording.getRecordingId() == recordingRecord.getRecordingId();
    }

    private void setupAudio(RecordingRecord recordingRecord) throws AudioSourceAccessException, InvalidConfigException {
        MediaSpec mediaSpec = (MediaSpec) getObservableData(this.mMediaSpec);
        MimeInfo resolveAudioMimeInfo = AudioConfigUtil.resolveAudioMimeInfo(mediaSpec, this.mResolvedCamcorderProfile);
        Timebase timebase = Timebase.UPTIME;
        AudioSource.Settings resolveAudioSourceSettings = AudioConfigUtil.resolveAudioSourceSettings(resolveAudioMimeInfo, mediaSpec.getAudioSpec());
        if (this.mAudioSource != null) {
            releaseCurrentAudioSource();
        }
        AudioSource audioSource = setupAudioSource(recordingRecord, resolveAudioSourceSettings);
        this.mAudioSource = audioSource;
        Logger.d(TAG, String.format("Set up new audio source: 0x%x", Integer.valueOf(audioSource.hashCode())));
        Encoder createEncoder = this.mAudioEncoderFactory.createEncoder(this.mExecutor, AudioConfigUtil.resolveAudioEncoderConfig(resolveAudioMimeInfo, timebase, resolveAudioSourceSettings, mediaSpec.getAudioSpec()));
        this.mAudioEncoder = createEncoder;
        Encoder.EncoderInput input = createEncoder.getInput();
        if (!(input instanceof Encoder.ByteBufferInput)) {
            throw new AssertionError("The EncoderInput of audio isn't a ByteBufferInput.");
        }
        this.mAudioSource.setBufferProvider((Encoder.ByteBufferInput) input);
    }

    private AudioSource setupAudioSource(RecordingRecord recordingRecord, AudioSource.Settings settings) throws AudioSourceAccessException {
        return recordingRecord.performOneTimeAudioSourceCreation(settings, AUDIO_EXECUTOR);
    }

    private void releaseCurrentAudioSource() {
        final AudioSource audioSource = this.mAudioSource;
        if (audioSource == null) {
            throw new AssertionError("Cannot release null audio source.");
        }
        this.mAudioSource = null;
        Logger.d(TAG, String.format("Releasing audio source: 0x%x", Integer.valueOf(audioSource.hashCode())));
        Futures.addCallback(audioSource.release(), new FutureCallback<Void>() { // from class: androidx.camera.video.Recorder.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void r3) {
                Logger.d(Recorder.TAG, String.format("Released audio source successfully: 0x%x", Integer.valueOf(audioSource.hashCode())));
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable th) {
                Logger.d(Recorder.TAG, String.format("An error occurred while attempting to release audio source: 0x%x", Integer.valueOf(audioSource.hashCode())));
            }
        }, CameraXExecutors.directExecutor());
    }

    private void setupVideo(final SurfaceRequest surfaceRequest, Timebase timebase) {
        MediaSpec mediaSpec = (MediaSpec) getObservableData(this.mMediaSpec);
        try {
            Encoder createEncoder = this.mVideoEncoderFactory.createEncoder(this.mExecutor, VideoConfigUtil.resolveVideoEncoderConfig(VideoConfigUtil.resolveVideoMimeInfo(mediaSpec, this.mResolvedCamcorderProfile), timebase, mediaSpec.getVideoSpec(), surfaceRequest.getResolution(), surfaceRequest.getExpectedFrameRate()));
            this.mVideoEncoder = createEncoder;
            Encoder.EncoderInput input = createEncoder.getInput();
            if (!(input instanceof Encoder.SurfaceInput)) {
                throw new AssertionError("The EncoderInput of video isn't a SurfaceInput.");
            }
            ((Encoder.SurfaceInput) input).setOnSurfaceUpdateListener(this.mSequentialExecutor, new Encoder.SurfaceInput.OnSurfaceUpdateListener() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda10
                @Override // androidx.camera.video.internal.encoder.Encoder.SurfaceInput.OnSurfaceUpdateListener
                public final void onSurfaceUpdate(Surface surface) {
                    Recorder.this.m175lambda$setupVideo$9$androidxcameravideoRecorder(surfaceRequest, surface);
                }
            });
        } catch (InvalidConfigException e) {
            Logger.e(TAG, "Unable to initialize video encoder.", e);
            onEncoderSetupError(e);
        }
    }

    /* renamed from: lambda$setupVideo$9$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m175lambda$setupVideo$9$androidxcameravideoRecorder(SurfaceRequest surfaceRequest, Surface surface) {
        synchronized (this.mLock) {
            Logger.d(TAG, "Encoder surface updated: " + surface.hashCode() + ", Current surface: " + this.mStreamId);
            switch (AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()]) {
                case 1:
                case 3:
                case 4:
                case 5:
                case 6:
                    onEncoderSurfaceUpdated(surface, surfaceRequest);
                    break;
                case 7:
                case 8:
                    throw new AssertionError("Unexpected state on update of encoder surface " + this.mState);
            }
        }
    }

    private void onEncoderSurfaceUpdated(Surface surface, SurfaceRequest surfaceRequest) {
        Surface surface2 = this.mLatestSurface;
        if (surface2 != surface) {
            setLatestSurface(surface);
            if (surface2 == null) {
                this.mActiveSurface = surface;
                surfaceRequest.provideSurface(surface, this.mSequentialExecutor, new Recorder$$ExternalSyntheticLambda15(this));
                onInitialized();
                return;
            }
            return;
        }
        Logger.d(TAG, "Video encoder provides the same surface.");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:19:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public void onSurfaceRequestComplete(androidx.camera.core.SurfaceRequest.Result r5) {
        /*
            r4 = this;
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "Surface closed: "
            r0.append(r1)
            android.view.Surface r1 = r5.getSurface()
            int r1 = r1.hashCode()
            r0.append(r1)
            java.lang.String r0 = r0.toString()
            java.lang.String r1 = "Recorder"
            androidx.camera.core.Logger.d(r1, r0)
            android.view.Surface r5 = r5.getSurface()
            android.view.Surface r0 = r4.mActiveSurface
            if (r5 != r0) goto L5f
            java.util.concurrent.ScheduledFuture<?> r5 = r4.mSourceNonStreamingTimeout
            r0 = 0
            if (r5 == 0) goto L38
            boolean r5 = r5.cancel(r0)
            if (r5 == 0) goto L38
            androidx.camera.video.internal.encoder.Encoder r5 = r4.mVideoEncoder
            if (r5 == 0) goto L38
            notifyEncoderSourceStopped(r5)
        L38:
            androidx.camera.video.VideoOutput$SourceState r5 = r4.mSourceState
            androidx.camera.video.VideoOutput$SourceState r2 = androidx.camera.video.VideoOutput.SourceState.INACTIVE
            r3 = 1
            if (r5 != r2) goto L46
            java.lang.String r5 = "Latest active surface no longer in use and source state is INACTIVE. Resetting recorder..."
            androidx.camera.core.Logger.d(r1, r5)
        L44:
            r0 = 1
            goto L52
        L46:
            android.view.Surface r5 = r4.mActiveSurface
            android.view.Surface r2 = r4.mLatestSurface
            if (r5 != r2) goto L52
            java.lang.String r5 = "Source has stopped producing frames into active surface, yet source state is still active. Stopping any in-progress recordings and resetting encoders in case a new surface is required."
            androidx.camera.core.Logger.w(r1, r5)
            goto L44
        L52:
            r5 = 0
            r4.mActiveSurface = r5
            if (r0 == 0) goto L62
            r0 = 4
            r4.reset(r0, r5)
            r4.setLatestSurface(r5)
            goto L62
        L5f:
            r5.release()
        L62:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.Recorder.onSurfaceRequestComplete(androidx.camera.core.SurfaceRequest$Result):void");
    }

    private void onEncoderSetupError(Throwable th) {
        RecordingRecord recordingRecord;
        synchronized (this.mLock) {
            recordingRecord = null;
            switch (AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()]) {
                case 1:
                case 2:
                case 6:
                case 7:
                case 8:
                    throw new AssertionError("Encountered encoder setup error while in unexpected state " + this.mState + ": " + th);
                case 3:
                case 4:
                    RecordingRecord recordingRecord2 = this.mPendingRecordingRecord;
                    this.mPendingRecordingRecord = null;
                    recordingRecord = recordingRecord2;
                case 5:
                    setStreamId(-1);
                    setState(State.ERROR);
                    break;
            }
        }
        if (recordingRecord != null) {
            finalizePendingRecording(recordingRecord, 7, th);
        }
    }

    void setupAndStartMediaMuxer(RecordingRecord recordingRecord) {
        if (this.mMediaMuxer != null) {
            throw new AssertionError("Unable to set up media muxer when one already exists.");
        }
        if (isAudioEnabled() && this.mPendingAudioRingBuffer.isEmpty()) {
            throw new AssertionError("Audio is enabled but no audio sample is ready. Cannot start media muxer.");
        }
        EncodedData encodedData = this.mPendingFirstVideoData;
        if (encodedData == null) {
            throw new AssertionError("Media muxer cannot be started without an encoded video frame.");
        }
        try {
            this.mPendingFirstVideoData = null;
            List<EncodedData> audioDataToWriteAndClearCache = getAudioDataToWriteAndClearCache(encodedData.getPresentationTimeUs());
            long size = encodedData.size();
            Iterator<EncodedData> it = audioDataToWriteAndClearCache.iterator();
            while (it.hasNext()) {
                size += it.next().size();
            }
            long j = this.mFileSizeLimitInBytes;
            if (j != 0 && size > j) {
                Logger.d(TAG, String.format("Initial data exceeds file size limit %d > %d", Long.valueOf(size), Long.valueOf(this.mFileSizeLimitInBytes)));
                onInProgressRecordingInternalError(recordingRecord, 2, null);
                if (encodedData != null) {
                    encodedData.close();
                    return;
                }
                return;
            }
            try {
                MediaSpec mediaSpec = (MediaSpec) getObservableData(this.mMediaSpec);
                MediaMuxer performOneTimeMediaMuxerCreation = recordingRecord.performOneTimeMediaMuxerCreation(mediaSpec.getOutputFormat() == -1 ? supportedMuxerFormatOrDefaultFrom(this.mResolvedCamcorderProfile, MediaSpec.outputFormatToMuxerFormat(MEDIA_SPEC_DEFAULT.getOutputFormat())) : MediaSpec.outputFormatToMuxerFormat(mediaSpec.getOutputFormat()), new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda14
                    @Override // androidx.core.util.Consumer
                    public final void accept(Object obj) {
                        Recorder.this.m174lambda$setupAndStartMediaMuxer$10$androidxcameravideoRecorder((Uri) obj);
                    }
                });
                SurfaceRequest.TransformationInfo transformationInfo = this.mSurfaceTransformationInfo;
                if (transformationInfo != null) {
                    performOneTimeMediaMuxerCreation.setOrientationHint(transformationInfo.getRotationDegrees());
                }
                Location location = recordingRecord.getOutputOptions().getLocation();
                if (location != null) {
                    try {
                        Pair<Double, Double> adjustGeoLocation = CorrectNegativeLatLongForMediaMuxer.adjustGeoLocation(location.getLatitude(), location.getLongitude());
                        performOneTimeMediaMuxerCreation.setLocation((float) ((Double) adjustGeoLocation.first).doubleValue(), (float) ((Double) adjustGeoLocation.second).doubleValue());
                    } catch (IllegalArgumentException e) {
                        performOneTimeMediaMuxerCreation.release();
                        onInProgressRecordingInternalError(recordingRecord, 5, e);
                        if (encodedData != null) {
                            encodedData.close();
                            return;
                        }
                        return;
                    }
                }
                this.mVideoTrackIndex = Integer.valueOf(performOneTimeMediaMuxerCreation.addTrack(this.mVideoOutputConfig.getMediaFormat()));
                if (isAudioEnabled()) {
                    this.mAudioTrackIndex = Integer.valueOf(performOneTimeMediaMuxerCreation.addTrack(this.mAudioOutputConfig.getMediaFormat()));
                }
                performOneTimeMediaMuxerCreation.start();
                this.mMediaMuxer = performOneTimeMediaMuxerCreation;
                writeVideoData(encodedData, recordingRecord);
                Iterator<EncodedData> it2 = audioDataToWriteAndClearCache.iterator();
                while (it2.hasNext()) {
                    writeAudioData(it2.next(), recordingRecord);
                }
                if (encodedData != null) {
                    encodedData.close();
                }
            } catch (IOException e2) {
                onInProgressRecordingInternalError(recordingRecord, 5, e2);
                if (encodedData != null) {
                    encodedData.close();
                }
            }
        } catch (Throwable th) {
            if (encodedData != null) {
                try {
                    encodedData.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    /* renamed from: lambda$setupAndStartMediaMuxer$10$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m174lambda$setupAndStartMediaMuxer$10$androidxcameravideoRecorder(Uri uri) {
        this.mOutputUri = uri;
    }

    private List<EncodedData> getAudioDataToWriteAndClearCache(long j) {
        ArrayList arrayList = new ArrayList();
        while (!this.mPendingAudioRingBuffer.isEmpty()) {
            EncodedData dequeue = this.mPendingAudioRingBuffer.dequeue();
            if (dequeue.getPresentationTimeUs() >= j) {
                arrayList.add(dequeue);
            }
        }
        return arrayList;
    }

    private void startInternal(RecordingRecord recordingRecord) {
        AudioState audioState;
        if (this.mInProgressRecording != null) {
            throw new AssertionError("Attempted to start a new recording while another was in progress.");
        }
        if (recordingRecord.getOutputOptions().getFileSizeLimit() > 0) {
            this.mFileSizeLimitInBytes = Math.round(recordingRecord.getOutputOptions().getFileSizeLimit() * 0.95d);
            Logger.d(TAG, "File size limit in bytes: " + this.mFileSizeLimitInBytes);
        } else {
            this.mFileSizeLimitInBytes = 0L;
        }
        if (recordingRecord.getOutputOptions().getDurationLimitMillis() > 0) {
            this.mDurationLimitNs = TimeUnit.MILLISECONDS.toNanos(recordingRecord.getOutputOptions().getDurationLimitMillis());
            Logger.d(TAG, "Duration limit in nanoseconds: " + this.mDurationLimitNs);
        } else {
            this.mDurationLimitNs = 0L;
        }
        this.mInProgressRecording = recordingRecord;
        switch (AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$AudioState[this.mAudioState.ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 4:
                throw new AssertionError("Incorrectly invoke startInternal in audio state " + this.mAudioState);
            case 5:
                setAudioState(recordingRecord.hasAudioEnabled() ? AudioState.ACTIVE : AudioState.DISABLED);
                break;
            case 6:
                if (recordingRecord.hasAudioEnabled()) {
                    if (!isAudioSupported()) {
                        throw new AssertionError("The Recorder doesn't support recording with audio");
                    }
                    try {
                        setupAudio(recordingRecord);
                        setAudioState(AudioState.ACTIVE);
                        break;
                    } catch (AudioSourceAccessException | InvalidConfigException e) {
                        Logger.e(TAG, "Unable to create audio resource with error: ", e);
                        if (e instanceof InvalidConfigException) {
                            audioState = AudioState.ERROR_ENCODER;
                        } else {
                            audioState = AudioState.ERROR_SOURCE;
                        }
                        setAudioState(audioState);
                        this.mAudioErrorCause = e;
                        break;
                    }
                }
                break;
        }
        initEncoderAndAudioSourceCallbacks(recordingRecord);
        if (isAudioEnabled()) {
            this.mAudioSource.start();
            this.mAudioEncoder.start();
        }
        this.mVideoEncoder.start();
        RecordingRecord recordingRecord2 = this.mInProgressRecording;
        recordingRecord2.updateVideoRecordEvent(VideoRecordEvent.start(recordingRecord2.getOutputOptions(), getInProgressRecordingStats()));
    }

    /* renamed from: androidx.camera.video.Recorder$6, reason: invalid class name */
    static /* synthetic */ class AnonymousClass6 {
        static final /* synthetic */ int[] $SwitchMap$androidx$camera$video$Recorder$AudioState;
        static final /* synthetic */ int[] $SwitchMap$androidx$camera$video$Recorder$State;

        static {
            int[] iArr = new int[AudioState.values().length];
            $SwitchMap$androidx$camera$video$Recorder$AudioState = iArr;
            try {
                iArr[AudioState.ERROR_ENCODER.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$AudioState[AudioState.ERROR_SOURCE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$AudioState[AudioState.ACTIVE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$AudioState[AudioState.DISABLED.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$AudioState[AudioState.IDLING.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$AudioState[AudioState.INITIALIZING.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            int[] iArr2 = new int[State.values().length];
            $SwitchMap$androidx$camera$video$Recorder$State = iArr2;
            try {
                iArr2[State.STOPPING.ordinal()] = 1;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$State[State.RESETTING.ordinal()] = 2;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$State[State.PENDING_RECORDING.ordinal()] = 3;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$State[State.PENDING_PAUSED.ordinal()] = 4;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$State[State.INITIALIZING.ordinal()] = 5;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$State[State.IDLING.ordinal()] = 6;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$State[State.RECORDING.ordinal()] = 7;
            } catch (NoSuchFieldError unused13) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$State[State.PAUSED.ordinal()] = 8;
            } catch (NoSuchFieldError unused14) {
            }
            try {
                $SwitchMap$androidx$camera$video$Recorder$State[State.ERROR.ordinal()] = 9;
            } catch (NoSuchFieldError unused15) {
            }
        }
    }

    private void initEncoderAndAudioSourceCallbacks(final RecordingRecord recordingRecord) {
        this.mEncodingFutures.add(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda12
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Recorder.this.m165x4113bf9(recordingRecord, completer);
            }
        }));
        if (isAudioEnabled()) {
            this.mEncodingFutures.add(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda13
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Recorder.this.m167x1471bbb7(recordingRecord, completer);
                }
            }));
        }
        Futures.addCallback(Futures.allAsList(this.mEncodingFutures), new FutureCallback<List<Void>>() { // from class: androidx.camera.video.Recorder.5
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(List<Void> list) {
                Logger.d(Recorder.TAG, "Encodings end successfully.");
                Recorder recorder = Recorder.this;
                recorder.finalizeInProgressRecording(recorder.mRecordingStopError, Recorder.this.mRecordingStopErrorCause);
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable th) {
                Logger.d(Recorder.TAG, "Encodings end with error: " + th);
                Recorder.this.finalizeInProgressRecording(6, th);
            }
        }, CameraXExecutors.directExecutor());
    }

    /* renamed from: lambda$initEncoderAndAudioSourceCallbacks$11$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ Object m165x4113bf9(final RecordingRecord recordingRecord, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mVideoEncoder.setEncoderCallback(new EncoderCallback() { // from class: androidx.camera.video.Recorder.2
            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public /* synthetic */ void onEncodePaused() {
                EncoderCallback.CC.$default$onEncodePaused(this);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStart() {
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStop() {
                completer.set(null);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeError(EncodeException encodeException) {
                completer.setException(encodeException);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodedData(EncodedData encodedData) {
                if (Recorder.this.mMediaMuxer == null) {
                    if (!Recorder.this.mInProgressRecordingStopping) {
                        boolean z = false;
                        if (Recorder.this.mPendingFirstVideoData != null) {
                            z = true;
                            Recorder.this.mPendingFirstVideoData.close();
                            Recorder.this.mPendingFirstVideoData = null;
                        }
                        if (encodedData.isKeyFrame()) {
                            Recorder.this.mPendingFirstVideoData = encodedData;
                            if (!Recorder.this.isAudioEnabled() || !Recorder.this.mPendingAudioRingBuffer.isEmpty()) {
                                Logger.d(Recorder.TAG, "Received video keyframe. Starting muxer...");
                                Recorder.this.setupAndStartMediaMuxer(recordingRecord);
                                return;
                            } else if (z) {
                                Logger.d(Recorder.TAG, "Replaced cached video keyframe with newer keyframe.");
                                return;
                            } else {
                                Logger.d(Recorder.TAG, "Cached video keyframe while we wait for first audio sample before starting muxer.");
                                return;
                            }
                        }
                        if (z) {
                            Logger.d(Recorder.TAG, "Dropped cached keyframe since we have new video data and have not yet received audio data.");
                        }
                        Logger.d(Recorder.TAG, "Dropped video data since muxer has not yet started and data is not a keyframe.");
                        Recorder.this.mVideoEncoder.requestKeyFrame();
                        encodedData.close();
                        return;
                    }
                    Logger.d(Recorder.TAG, "Drop video data since recording is stopping.");
                    encodedData.close();
                    return;
                }
                try {
                    Recorder.this.writeVideoData(encodedData, recordingRecord);
                    if (encodedData != null) {
                        encodedData.close();
                    }
                } catch (Throwable th) {
                    if (encodedData != null) {
                        try {
                            encodedData.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                    }
                    throw th;
                }
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onOutputConfigUpdate(OutputConfig outputConfig) {
                Recorder.this.mVideoOutputConfig = outputConfig;
            }
        }, this.mSequentialExecutor);
        return "videoEncodingFuture";
    }

    /* renamed from: lambda$initEncoderAndAudioSourceCallbacks$13$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ Object m167x1471bbb7(final RecordingRecord recordingRecord, final CallbackToFutureAdapter.Completer completer) throws Exception {
        final Consumer consumer = new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda16
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                Recorder.this.m166x8c417bd8(completer, (Throwable) obj);
            }
        };
        this.mAudioSource.setAudioSourceCallback(this.mSequentialExecutor, new AudioSource.AudioSourceCallback() { // from class: androidx.camera.video.Recorder.3
            @Override // androidx.camera.video.internal.AudioSource.AudioSourceCallback
            public void onSilenced(boolean z) {
                if (Recorder.this.mIsAudioSourceSilenced != z) {
                    Recorder.this.mIsAudioSourceSilenced = z;
                    Recorder.this.mAudioErrorCause = z ? new IllegalStateException("The audio source has been silenced.") : null;
                    Recorder.this.updateInProgressStatusEvent();
                    return;
                }
                Logger.w(Recorder.TAG, "Audio source silenced transitions to the same state " + z);
            }

            @Override // androidx.camera.video.internal.AudioSource.AudioSourceCallback
            public void onError(Throwable th) {
                Logger.e(Recorder.TAG, "Error occurred after audio source started.", th);
                if (th instanceof AudioSourceAccessException) {
                    consumer.accept(th);
                }
            }
        });
        this.mAudioEncoder.setEncoderCallback(new EncoderCallback() { // from class: androidx.camera.video.Recorder.4
            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public /* synthetic */ void onEncodePaused() {
                EncoderCallback.CC.$default$onEncodePaused(this);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStart() {
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStop() {
                completer.set(null);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeError(EncodeException encodeException) {
                if (Recorder.this.mAudioErrorCause == null) {
                    consumer.accept(encodeException);
                }
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodedData(EncodedData encodedData) {
                if (Recorder.this.mAudioState == AudioState.DISABLED) {
                    throw new AssertionError("Audio is not enabled but audio encoded data is produced.");
                }
                if (Recorder.this.mMediaMuxer == null) {
                    if (!Recorder.this.mInProgressRecordingStopping) {
                        Recorder.this.mPendingAudioRingBuffer.enqueue(new BufferCopiedEncodedData(encodedData));
                        if (Recorder.this.mPendingFirstVideoData != null) {
                            Logger.d(Recorder.TAG, "Received audio data. Starting muxer...");
                            Recorder.this.setupAndStartMediaMuxer(recordingRecord);
                        } else {
                            Logger.d(Recorder.TAG, "Cached audio data while we wait for video keyframe before starting muxer.");
                        }
                    } else {
                        Logger.d(Recorder.TAG, "Drop audio data since recording is stopping.");
                    }
                    encodedData.close();
                    return;
                }
                try {
                    Recorder.this.writeAudioData(encodedData, recordingRecord);
                    if (encodedData != null) {
                        encodedData.close();
                    }
                } catch (Throwable th) {
                    if (encodedData != null) {
                        try {
                            encodedData.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                    }
                    throw th;
                }
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onOutputConfigUpdate(OutputConfig outputConfig) {
                Recorder.this.mAudioOutputConfig = outputConfig;
            }
        }, this.mSequentialExecutor);
        return "audioEncodingFuture";
    }

    /* renamed from: lambda$initEncoderAndAudioSourceCallbacks$12$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m166x8c417bd8(CallbackToFutureAdapter.Completer completer, Throwable th) {
        if (this.mAudioErrorCause == null) {
            if (th instanceof EncodeException) {
                setAudioState(AudioState.ERROR_ENCODER);
            } else {
                setAudioState(AudioState.ERROR_SOURCE);
            }
            this.mAudioErrorCause = th;
            updateInProgressStatusEvent();
            completer.set(null);
        }
    }

    void writeVideoData(EncodedData encodedData, RecordingRecord recordingRecord) {
        if (this.mVideoTrackIndex == null) {
            throw new AssertionError("Video data comes before the track is added to MediaMuxer.");
        }
        long size = this.mRecordingBytes + encodedData.size();
        long j = this.mFileSizeLimitInBytes;
        long j2 = 0;
        if (j != 0 && size > j) {
            Logger.d(TAG, String.format("Reach file size limit %d > %d", Long.valueOf(size), Long.valueOf(this.mFileSizeLimitInBytes)));
            onInProgressRecordingInternalError(recordingRecord, 2, null);
            return;
        }
        long presentationTimeUs = encodedData.getPresentationTimeUs();
        if (this.mFirstRecordingVideoDataTimeUs == LongCompanionObject.MAX_VALUE) {
            this.mFirstRecordingVideoDataTimeUs = presentationTimeUs;
            Logger.d(TAG, String.format("First video time: %d (%s)", Long.valueOf(presentationTimeUs), DebugUtils.readableUs(this.mFirstRecordingVideoDataTimeUs)));
        } else {
            long nanos = TimeUnit.MICROSECONDS.toNanos(presentationTimeUs - Math.min(this.mFirstRecordingVideoDataTimeUs, this.mFirstRecordingAudioDataTimeUs));
            Preconditions.checkState(this.mPreviousRecordingVideoDataTimeUs != LongCompanionObject.MAX_VALUE, "There should be a previous data for adjusting the duration.");
            long nanos2 = TimeUnit.MICROSECONDS.toNanos(presentationTimeUs - this.mPreviousRecordingVideoDataTimeUs) + nanos;
            long j3 = this.mDurationLimitNs;
            if (j3 != 0 && nanos2 > j3) {
                Logger.d(TAG, String.format("Video data reaches duration limit %d > %d", Long.valueOf(nanos2), Long.valueOf(this.mDurationLimitNs)));
                onInProgressRecordingInternalError(recordingRecord, 9, null);
                return;
            }
            j2 = nanos;
        }
        this.mMediaMuxer.writeSampleData(this.mVideoTrackIndex.intValue(), encodedData.getByteBuffer(), encodedData.getBufferInfo());
        this.mRecordingBytes = size;
        this.mRecordingDurationNs = j2;
        this.mPreviousRecordingVideoDataTimeUs = presentationTimeUs;
        updateInProgressStatusEvent();
    }

    void writeAudioData(EncodedData encodedData, RecordingRecord recordingRecord) {
        long size = this.mRecordingBytes + encodedData.size();
        long j = this.mFileSizeLimitInBytes;
        if (j != 0 && size > j) {
            Logger.d(TAG, String.format("Reach file size limit %d > %d", Long.valueOf(size), Long.valueOf(this.mFileSizeLimitInBytes)));
            onInProgressRecordingInternalError(recordingRecord, 2, null);
            return;
        }
        long presentationTimeUs = encodedData.getPresentationTimeUs();
        if (this.mFirstRecordingAudioDataTimeUs == LongCompanionObject.MAX_VALUE) {
            this.mFirstRecordingAudioDataTimeUs = presentationTimeUs;
            Logger.d(TAG, String.format("First audio time: %d (%s)", Long.valueOf(presentationTimeUs), DebugUtils.readableUs(this.mFirstRecordingAudioDataTimeUs)));
        } else {
            long nanos = TimeUnit.MICROSECONDS.toNanos(presentationTimeUs - Math.min(this.mFirstRecordingVideoDataTimeUs, this.mFirstRecordingAudioDataTimeUs));
            Preconditions.checkState(this.mPreviousRecordingAudioDataTimeUs != LongCompanionObject.MAX_VALUE, "There should be a previous data for adjusting the duration.");
            long nanos2 = nanos + TimeUnit.MICROSECONDS.toNanos(presentationTimeUs - this.mPreviousRecordingAudioDataTimeUs);
            long j2 = this.mDurationLimitNs;
            if (j2 != 0 && nanos2 > j2) {
                Logger.d(TAG, String.format("Audio data reaches duration limit %d > %d", Long.valueOf(nanos2), Long.valueOf(this.mDurationLimitNs)));
                onInProgressRecordingInternalError(recordingRecord, 9, null);
                return;
            }
        }
        this.mMediaMuxer.writeSampleData(this.mAudioTrackIndex.intValue(), encodedData.getByteBuffer(), encodedData.getBufferInfo());
        this.mRecordingBytes = size;
        this.mPreviousRecordingAudioDataTimeUs = presentationTimeUs;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: pauseInternal, reason: merged with bridge method [inline-methods] */
    public void m172lambda$pause$4$androidxcameravideoRecorder(RecordingRecord recordingRecord) {
        if (this.mInProgressRecording != recordingRecord || this.mInProgressRecordingStopping) {
            return;
        }
        if (isAudioEnabled()) {
            this.mAudioEncoder.pause();
        }
        this.mVideoEncoder.pause();
        RecordingRecord recordingRecord2 = this.mInProgressRecording;
        recordingRecord2.updateVideoRecordEvent(VideoRecordEvent.pause(recordingRecord2.getOutputOptions(), getInProgressRecordingStats()));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: resumeInternal, reason: merged with bridge method [inline-methods] */
    public void m173lambda$resume$5$androidxcameravideoRecorder(RecordingRecord recordingRecord) {
        if (this.mInProgressRecording != recordingRecord || this.mInProgressRecordingStopping) {
            return;
        }
        if (isAudioEnabled()) {
            this.mAudioEncoder.start();
        }
        this.mVideoEncoder.start();
        RecordingRecord recordingRecord2 = this.mInProgressRecording;
        recordingRecord2.updateVideoRecordEvent(VideoRecordEvent.resume(recordingRecord2.getOutputOptions(), getInProgressRecordingStats()));
    }

    void stopInternal(RecordingRecord recordingRecord, Long l, int i, Throwable th) {
        if (this.mInProgressRecording != recordingRecord || this.mInProgressRecordingStopping) {
            return;
        }
        this.mShouldWaitForNewSurface = DeviceQuirks.get(EncoderNotUsePersistentInputSurfaceQuirk.class) != null;
        this.mInProgressRecordingStopping = true;
        this.mRecordingStopError = i;
        this.mRecordingStopErrorCause = th;
        if (isAudioEnabled()) {
            clearPendingAudioRingBuffer();
            if (l == null) {
                this.mAudioEncoder.stop();
            } else {
                this.mAudioEncoder.stop(l.longValue());
            }
        }
        EncodedData encodedData = this.mPendingFirstVideoData;
        if (encodedData != null) {
            encodedData.close();
            this.mPendingFirstVideoData = null;
        }
        if (this.mSourceState != VideoOutput.SourceState.ACTIVE_NON_STREAMING) {
            final Encoder encoder = this.mVideoEncoder;
            this.mSourceNonStreamingTimeout = CameraXExecutors.mainThreadExecutor().schedule(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda8
                @Override // java.lang.Runnable
                public final void run() {
                    Recorder.this.m178lambda$stopInternal$15$androidxcameravideoRecorder(encoder);
                }
            }, SOURCE_NON_STREAMING_TIMEOUT_MS, TimeUnit.MILLISECONDS);
        } else {
            notifyEncoderSourceStopped(this.mVideoEncoder);
        }
        if (l == null) {
            this.mVideoEncoder.stop();
        } else {
            this.mVideoEncoder.stop(l.longValue());
        }
    }

    /* renamed from: lambda$stopInternal$15$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m178lambda$stopInternal$15$androidxcameravideoRecorder(final Encoder encoder) {
        this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                Recorder.lambda$stopInternal$14(Encoder.this);
            }
        });
    }

    static /* synthetic */ void lambda$stopInternal$14(Encoder encoder) {
        Logger.d(TAG, "The source didn't become non-streaming before timeout. Waited 1000ms");
        if (DeviceQuirks.get(DeactivateEncoderSurfaceBeforeStopEncoderQuirk.class) != null) {
            notifyEncoderSourceStopped(encoder);
        }
    }

    private static void notifyEncoderSourceStopped(Encoder encoder) {
        if (encoder instanceof EncoderImpl) {
            ((EncoderImpl) encoder).signalSourceStopped();
        }
    }

    private void clearPendingAudioRingBuffer() {
        while (!this.mPendingAudioRingBuffer.isEmpty()) {
            this.mPendingAudioRingBuffer.dequeue();
        }
    }

    private void resetInternal() {
        if (this.mAudioEncoder != null) {
            Logger.d(TAG, "Releasing audio encoder.");
            this.mAudioEncoder.release();
            this.mAudioEncoder = null;
            this.mAudioOutputConfig = null;
        }
        if (this.mVideoEncoder != null) {
            Logger.d(TAG, "Releasing video encoder.");
            this.mVideoEncoder.release();
            this.mVideoEncoder = null;
            this.mVideoOutputConfig = null;
        }
        if (this.mAudioSource != null) {
            releaseCurrentAudioSource();
        }
        setAudioState(AudioState.INITIALIZING);
    }

    private int internalAudioStateToAudioStatsState(AudioState audioState) {
        int i = AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$AudioState[audioState.ordinal()];
        if (i == 1) {
            return 3;
        }
        if (i == 2) {
            return 4;
        }
        if (i == 3) {
            return this.mIsAudioSourceSilenced ? 2 : 0;
        }
        if (i == 4 || i == 6) {
            return 1;
        }
        throw new AssertionError("Invalid internal audio state: " + audioState);
    }

    private StreamInfo.StreamState internalStateToStreamState(State state) {
        return (state == State.RECORDING || (state == State.STOPPING && ((DeactivateEncoderSurfaceBeforeStopEncoderQuirk) DeviceQuirks.get(DeactivateEncoderSurfaceBeforeStopEncoderQuirk.class)) == null)) ? StreamInfo.StreamState.ACTIVE : StreamInfo.StreamState.INACTIVE;
    }

    boolean isAudioEnabled() {
        return this.mAudioState == AudioState.ACTIVE;
    }

    void finalizeInProgressRecording(int i, Throwable th) {
        VideoRecordEvent.Finalize finalizeWithError;
        if (this.mInProgressRecording == null) {
            throw new AssertionError("Attempted to finalize in-progress recording, but no recording is in progress.");
        }
        MediaMuxer mediaMuxer = this.mMediaMuxer;
        if (mediaMuxer != null) {
            try {
                mediaMuxer.stop();
                this.mMediaMuxer.release();
            } catch (IllegalStateException e) {
                Logger.e(TAG, "MediaMuxer failed to stop or release with error: " + e.getMessage());
                if (i == 0) {
                    i = 1;
                }
            }
            this.mMediaMuxer = null;
        } else if (i == 0) {
            i = 8;
        }
        this.mInProgressRecording.finalizeRecording(this.mOutputUri);
        OutputOptions outputOptions = this.mInProgressRecording.getOutputOptions();
        RecordingStats inProgressRecordingStats = getInProgressRecordingStats();
        OutputResults of = OutputResults.of(this.mOutputUri);
        RecordingRecord recordingRecord = this.mInProgressRecording;
        if (i == 0) {
            finalizeWithError = VideoRecordEvent.finalize(outputOptions, inProgressRecordingStats, of);
        } else {
            finalizeWithError = VideoRecordEvent.finalizeWithError(outputOptions, inProgressRecordingStats, of, i, th);
        }
        recordingRecord.updateVideoRecordEvent(finalizeWithError);
        RecordingRecord recordingRecord2 = this.mInProgressRecording;
        this.mInProgressRecording = null;
        this.mInProgressRecordingStopping = false;
        this.mAudioTrackIndex = null;
        this.mVideoTrackIndex = null;
        this.mEncodingFutures.clear();
        this.mOutputUri = Uri.EMPTY;
        this.mRecordingBytes = 0L;
        this.mRecordingDurationNs = 0L;
        this.mFirstRecordingVideoDataTimeUs = LongCompanionObject.MAX_VALUE;
        this.mFirstRecordingAudioDataTimeUs = LongCompanionObject.MAX_VALUE;
        this.mPreviousRecordingVideoDataTimeUs = LongCompanionObject.MAX_VALUE;
        this.mPreviousRecordingAudioDataTimeUs = LongCompanionObject.MAX_VALUE;
        this.mRecordingStopError = 1;
        this.mRecordingStopErrorCause = null;
        this.mAudioErrorCause = null;
        clearPendingAudioRingBuffer();
        int i2 = AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$AudioState[this.mAudioState.ordinal()];
        if (i2 == 1 || i2 == 2) {
            setAudioState(AudioState.INITIALIZING);
        } else if (i2 == 3 || i2 == 4) {
            setAudioState(AudioState.IDLING);
            this.mAudioSource.stop();
        } else if (i2 == 5) {
            throw new AssertionError("Incorrectly finalize recording when audio state is IDLING");
        }
        onRecordingFinalized(recordingRecord2);
    }

    private void onRecordingFinalized(RecordingRecord recordingRecord) {
        RecordingRecord recordingRecord2;
        boolean z;
        int i;
        RecordingRecord recordingRecord3;
        Exception exc;
        boolean z2;
        synchronized (this.mLock) {
            if (this.mActiveRecordingRecord != recordingRecord) {
                throw new AssertionError("Active recording did not match finalized recording on finalize.");
            }
            recordingRecord2 = null;
            this.mActiveRecordingRecord = null;
            z = true;
            i = 0;
            switch (AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()]) {
                case 1:
                case 7:
                case 8:
                    if (this.mShouldWaitForNewSurface) {
                        setState(State.INITIALIZING);
                    } else {
                        setState(State.IDLING);
                    }
                    recordingRecord3 = null;
                    exc = null;
                    z = false;
                    z2 = false;
                    break;
                case 2:
                    setState(State.INITIALIZING);
                    recordingRecord3 = null;
                    exc = null;
                    z2 = false;
                    break;
                case 3:
                    z = false;
                case 4:
                    if (this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                        recordingRecord3 = this.mPendingRecordingRecord;
                        this.mPendingRecordingRecord = null;
                        setState(State.INITIALIZING);
                        exc = PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE;
                        z2 = z;
                        z = false;
                        i = 4;
                    } else if (this.mShouldWaitForNewSurface) {
                        updateNonPendingState(State.INITIALIZING);
                        recordingRecord3 = null;
                        exc = null;
                        z2 = z;
                        z = false;
                    } else {
                        exc = null;
                        z2 = z;
                        z = false;
                        recordingRecord2 = makePendingRecordingActiveLocked(this.mState);
                        recordingRecord3 = null;
                    }
                    break;
                case 5:
                case 6:
                    throw new AssertionError("Unexpected state on finalize of recording: " + this.mState);
                default:
                    recordingRecord3 = null;
                    exc = null;
                    z = false;
                    z2 = false;
                    break;
            }
        }
        if (z) {
            resetInternal();
            return;
        }
        if (recordingRecord2 != null) {
            if (this.mShouldWaitForNewSurface) {
                throw new AssertionError("Attempt to start a pending recording while the Recorder is waiting for a new surface request.");
            }
            startRecording(recordingRecord2, z2);
        } else if (recordingRecord3 != null) {
            finalizePendingRecording(recordingRecord3, i, exc);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:20:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x003b A[Catch: all -> 0x004b, TryCatch #0 {, blocks: (B:6:0x0008, B:7:0x0012, B:9:0x0043, B:15:0x0016, B:16:0x001d, B:17:0x0035, B:18:0x0036, B:21:0x003b, B:22:0x0042), top: B:5:0x0008 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    void onInProgressRecordingInternalError(androidx.camera.video.Recorder.RecordingRecord r5, int r6, java.lang.Throwable r7) {
        /*
            r4 = this;
            androidx.camera.video.Recorder$RecordingRecord r0 = r4.mInProgressRecording
            if (r5 != r0) goto L4e
            r0 = 0
            java.lang.Object r1 = r4.mLock
            monitor-enter(r1)
            int[] r2 = androidx.camera.video.Recorder.AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State     // Catch: java.lang.Throwable -> L4b
            androidx.camera.video.Recorder$State r3 = r4.mState     // Catch: java.lang.Throwable -> L4b
            int r3 = r3.ordinal()     // Catch: java.lang.Throwable -> L4b
            r2 = r2[r3]     // Catch: java.lang.Throwable -> L4b
            switch(r2) {
                case 1: goto L36;
                case 2: goto L36;
                case 3: goto L36;
                case 4: goto L36;
                case 5: goto L1d;
                case 6: goto L1d;
                case 7: goto L16;
                case 8: goto L16;
                case 9: goto L1d;
                default: goto L15;
            }     // Catch: java.lang.Throwable -> L4b
        L15:
            goto L43
        L16:
            androidx.camera.video.Recorder$State r0 = androidx.camera.video.Recorder.State.STOPPING     // Catch: java.lang.Throwable -> L4b
            r4.setState(r0)     // Catch: java.lang.Throwable -> L4b
            r0 = 1
            goto L36
        L1d:
            java.lang.AssertionError r5 = new java.lang.AssertionError     // Catch: java.lang.Throwable -> L4b
            java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L4b
            r6.<init>()     // Catch: java.lang.Throwable -> L4b
            java.lang.String r7 = "In-progress recording error occurred while in unexpected state: "
            r6.append(r7)     // Catch: java.lang.Throwable -> L4b
            androidx.camera.video.Recorder$State r7 = r4.mState     // Catch: java.lang.Throwable -> L4b
            r6.append(r7)     // Catch: java.lang.Throwable -> L4b
            java.lang.String r6 = r6.toString()     // Catch: java.lang.Throwable -> L4b
            r5.<init>(r6)     // Catch: java.lang.Throwable -> L4b
            throw r5     // Catch: java.lang.Throwable -> L4b
        L36:
            androidx.camera.video.Recorder$RecordingRecord r2 = r4.mActiveRecordingRecord     // Catch: java.lang.Throwable -> L4b
            if (r5 != r2) goto L3b
            goto L43
        L3b:
            java.lang.AssertionError r5 = new java.lang.AssertionError     // Catch: java.lang.Throwable -> L4b
            java.lang.String r6 = "Internal error occurred for recording but it is not the active recording."
            r5.<init>(r6)     // Catch: java.lang.Throwable -> L4b
            throw r5     // Catch: java.lang.Throwable -> L4b
        L43:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L4b
            if (r0 == 0) goto L4a
            r0 = 0
            r4.stopInternal(r5, r0, r6, r7)
        L4a:
            return
        L4b:
            r5 = move-exception
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L4b
            throw r5
        L4e:
            java.lang.AssertionError r5 = new java.lang.AssertionError
            java.lang.String r6 = "Internal error occurred on recording that is not the current in-progress recording."
            r5.<init>(r6)
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.Recorder.onInProgressRecordingInternalError(androidx.camera.video.Recorder$RecordingRecord, int, java.lang.Throwable):void");
    }

    void tryServicePendingRecording() {
        int i;
        boolean z;
        RecordingRecord recordingRecord;
        boolean z2;
        Exception exc;
        RecordingRecord recordingRecord2;
        synchronized (this.mLock) {
            int i2 = AnonymousClass6.$SwitchMap$androidx$camera$video$Recorder$State[this.mState.ordinal()];
            i = 4;
            z = false;
            recordingRecord = null;
            if (i2 != 3) {
                z2 = i2 == 4;
                exc = null;
                recordingRecord2 = null;
                i = 0;
            }
            if (this.mActiveRecordingRecord != null) {
                z = z2;
                exc = null;
                recordingRecord2 = null;
                i = 0;
            } else if (this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                recordingRecord2 = this.mPendingRecordingRecord;
                this.mPendingRecordingRecord = null;
                restoreNonPendingState();
                z = z2;
                exc = PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE;
            } else {
                z = z2;
                exc = null;
                i = 0;
                recordingRecord = makePendingRecordingActiveLocked(this.mState);
                recordingRecord2 = null;
            }
        }
        if (recordingRecord != null) {
            startRecording(recordingRecord, z);
        } else if (recordingRecord2 != null) {
            finalizePendingRecording(recordingRecord2, i, exc);
        }
    }

    private RecordingRecord makePendingRecordingActiveLocked(State state) {
        boolean z;
        if (state == State.PENDING_PAUSED) {
            z = true;
        } else {
            if (state != State.PENDING_RECORDING) {
                throw new AssertionError("makePendingRecordingActiveLocked() can only be called from a pending state.");
            }
            z = false;
        }
        if (this.mActiveRecordingRecord != null) {
            throw new AssertionError("Cannot make pending recording active because another recording is already active.");
        }
        RecordingRecord recordingRecord = this.mPendingRecordingRecord;
        if (recordingRecord == null) {
            throw new AssertionError("Pending recording should exist when in a PENDING state.");
        }
        this.mActiveRecordingRecord = recordingRecord;
        this.mPendingRecordingRecord = null;
        if (z) {
            setState(State.PAUSED);
        } else {
            setState(State.RECORDING);
        }
        return recordingRecord;
    }

    private void startRecording(RecordingRecord recordingRecord, boolean z) {
        startInternal(recordingRecord);
        if (z) {
            m172lambda$pause$4$androidxcameravideoRecorder(recordingRecord);
        }
    }

    void updateInProgressStatusEvent() {
        RecordingRecord recordingRecord = this.mInProgressRecording;
        if (recordingRecord != null) {
            recordingRecord.updateVideoRecordEvent(VideoRecordEvent.status(recordingRecord.getOutputOptions(), getInProgressRecordingStats()));
        }
    }

    RecordingStats getInProgressRecordingStats() {
        return RecordingStats.of(this.mRecordingDurationNs, this.mRecordingBytes, AudioStats.of(internalAudioStateToAudioStatsState(this.mAudioState), this.mAudioErrorCause));
    }

    <T> T getObservableData(StateObservable<T> stateObservable) {
        try {
            return stateObservable.fetchData().get();
        } catch (InterruptedException | ExecutionException e) {
            throw new IllegalStateException(e);
        }
    }

    boolean isAudioSupported() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getAudioSpec().getChannelCount() != 0;
    }

    void setState(State state) {
        if (this.mState == state) {
            throw new AssertionError("Attempted to transition to state " + state + ", but Recorder is already in state " + state);
        }
        Logger.d(TAG, "Transitioning Recorder internal state: " + this.mState + " --> " + state);
        Set<State> set = PENDING_STATES;
        StreamInfo.StreamState streamState = null;
        if (set.contains(state)) {
            if (!set.contains(this.mState)) {
                if (!VALID_NON_PENDING_STATES_WHILE_PENDING.contains(this.mState)) {
                    throw new AssertionError("Invalid state transition. Should not be transitioning to a PENDING state from state " + this.mState);
                }
                State state2 = this.mState;
                this.mNonPendingState = state2;
                streamState = internalStateToStreamState(state2);
            }
        } else if (this.mNonPendingState != null) {
            this.mNonPendingState = null;
        }
        this.mState = state;
        if (streamState == null) {
            streamState = internalStateToStreamState(state);
        }
        this.mStreamInfo.setState(StreamInfo.of(this.mStreamId, streamState));
    }

    private void setLatestSurface(Surface surface) {
        int hashCode;
        if (this.mLatestSurface == surface) {
            return;
        }
        this.mLatestSurface = surface;
        synchronized (this.mLock) {
            if (surface != null) {
                try {
                    hashCode = surface.hashCode();
                } catch (Throwable th) {
                    throw th;
                }
            } else {
                hashCode = 0;
            }
            setStreamId(hashCode);
        }
    }

    private void setStreamId(int i) {
        if (this.mStreamId == i) {
            return;
        }
        Logger.d(TAG, "Transitioning streamId: " + this.mStreamId + " --> " + i);
        this.mStreamId = i;
        this.mStreamInfo.setState(StreamInfo.of(i, internalStateToStreamState(this.mState)));
    }

    private void updateNonPendingState(State state) {
        if (!PENDING_STATES.contains(this.mState)) {
            throw new AssertionError("Can only updated non-pending state from a pending state, but state is " + this.mState);
        }
        if (!VALID_NON_PENDING_STATES_WHILE_PENDING.contains(state)) {
            throw new AssertionError("Invalid state transition. State is not a valid non-pending state while in a pending state: " + state);
        }
        if (this.mNonPendingState != state) {
            this.mNonPendingState = state;
            this.mStreamInfo.setState(StreamInfo.of(this.mStreamId, internalStateToStreamState(state)));
        }
    }

    private void restoreNonPendingState() {
        if (!PENDING_STATES.contains(this.mState)) {
            throw new AssertionError("Cannot restore non-pending state when in state " + this.mState);
        }
        setState(this.mNonPendingState);
    }

    void setAudioState(AudioState audioState) {
        Logger.d(TAG, "Transitioning audio state: " + this.mAudioState + " --> " + audioState);
        this.mAudioState = audioState;
    }

    private static int supportedMuxerFormatOrDefaultFrom(CamcorderProfileProxy camcorderProfileProxy, int i) {
        if (camcorderProfileProxy != null) {
            int fileFormat = camcorderProfileProxy.getFileFormat();
            if (fileFormat == 1) {
                return Build.VERSION.SDK_INT < 26 ? 0 : 2;
            }
            if (fileFormat == 2) {
                return 0;
            }
            if (fileFormat == 9) {
                return 1;
            }
        }
        return i;
    }

    static abstract class RecordingRecord implements AutoCloseable {
        private final CloseGuardHelper mCloseGuard = CloseGuardHelper.create();
        private final AtomicBoolean mInitialized = new AtomicBoolean(false);
        private final AtomicReference<MediaMuxerSupplier> mMediaMuxerSupplier = new AtomicReference<>(null);
        private final AtomicReference<AudioSourceSupplier> mAudioSourceSupplier = new AtomicReference<>(null);
        private final AtomicReference<Consumer<Uri>> mRecordingFinalizer = new AtomicReference<>(new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda5
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                Recorder.RecordingRecord.lambda$new$0((Uri) obj);
            }
        });

        private interface AudioSourceSupplier {
            AudioSource get(AudioSource.Settings settings, Executor executor) throws AudioSourceAccessException;
        }

        /* JADX INFO: Access modifiers changed from: private */
        interface MediaMuxerSupplier {
            MediaMuxer get(int i, Consumer<Uri> consumer) throws IOException;
        }

        static /* synthetic */ void lambda$new$0(Uri uri) {
        }

        abstract Executor getCallbackExecutor();

        abstract Consumer<VideoRecordEvent> getEventListener();

        abstract OutputOptions getOutputOptions();

        abstract long getRecordingId();

        abstract boolean hasAudioEnabled();

        RecordingRecord() {
        }

        static RecordingRecord from(PendingRecording pendingRecording, long j) {
            return new AutoValue_Recorder_RecordingRecord(pendingRecording.getOutputOptions(), pendingRecording.getListenerExecutor(), pendingRecording.getEventListener(), pendingRecording.isAudioEnabled(), j);
        }

        void initializeRecording(final Context context) throws IOException {
            if (this.mInitialized.getAndSet(true)) {
                throw new AssertionError("Recording " + this + " has already been initialized");
            }
            final OutputOptions outputOptions = getOutputOptions();
            boolean z = outputOptions instanceof FileDescriptorOutputOptions;
            Consumer<Uri> consumer = null;
            final ParcelFileDescriptor dup = z ? ((FileDescriptorOutputOptions) outputOptions).getParcelFileDescriptor().dup() : null;
            this.mCloseGuard.open("finalizeRecording");
            this.mMediaMuxerSupplier.set(new MediaMuxerSupplier() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda1
                @Override // androidx.camera.video.Recorder.RecordingRecord.MediaMuxerSupplier
                public final MediaMuxer get(int i, Consumer consumer2) {
                    return Recorder.RecordingRecord.lambda$initializeRecording$1(OutputOptions.this, dup, i, consumer2);
                }
            });
            if (hasAudioEnabled()) {
                if (Build.VERSION.SDK_INT >= 31) {
                    this.mAudioSourceSupplier.set(new AudioSourceSupplier() { // from class: androidx.camera.video.Recorder.RecordingRecord.1
                        @Override // androidx.camera.video.Recorder.RecordingRecord.AudioSourceSupplier
                        public AudioSource get(AudioSource.Settings settings, Executor executor) throws AudioSourceAccessException {
                            return new AudioSource(settings, executor, context);
                        }
                    });
                } else {
                    this.mAudioSourceSupplier.set(new AudioSourceSupplier() { // from class: androidx.camera.video.Recorder.RecordingRecord.2
                        @Override // androidx.camera.video.Recorder.RecordingRecord.AudioSourceSupplier
                        public AudioSource get(AudioSource.Settings settings, Executor executor) throws AudioSourceAccessException {
                            return new AudioSource(settings, executor, null);
                        }
                    });
                }
            }
            if (outputOptions instanceof MediaStoreOutputOptions) {
                final MediaStoreOutputOptions mediaStoreOutputOptions = (MediaStoreOutputOptions) outputOptions;
                if (Build.VERSION.SDK_INT >= 29) {
                    consumer = new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda3
                        @Override // androidx.core.util.Consumer
                        public final void accept(Object obj) {
                            Recorder.RecordingRecord.lambda$initializeRecording$2(MediaStoreOutputOptions.this, (Uri) obj);
                        }
                    };
                } else {
                    consumer = new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda4
                        @Override // androidx.core.util.Consumer
                        public final void accept(Object obj) {
                            Recorder.RecordingRecord.lambda$initializeRecording$4(MediaStoreOutputOptions.this, context, (Uri) obj);
                        }
                    };
                }
            } else if (z) {
                consumer = new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda2
                    @Override // androidx.core.util.Consumer
                    public final void accept(Object obj) {
                        Recorder.RecordingRecord.lambda$initializeRecording$5(dup, (Uri) obj);
                    }
                };
            }
            if (consumer != null) {
                this.mRecordingFinalizer.set(consumer);
            }
        }

        static /* synthetic */ MediaMuxer lambda$initializeRecording$1(OutputOptions outputOptions, ParcelFileDescriptor parcelFileDescriptor, int i, Consumer consumer) throws IOException {
            MediaMuxer createMediaMuxer;
            Uri uri = Uri.EMPTY;
            if (outputOptions instanceof FileOutputOptions) {
                File file = ((FileOutputOptions) outputOptions).getFile();
                if (!OutputUtil.createParentFolder(file)) {
                    Logger.w(Recorder.TAG, "Failed to create folder for " + file.getAbsolutePath());
                }
                createMediaMuxer = new MediaMuxer(file.getAbsolutePath(), i);
                uri = Uri.fromFile(file);
            } else if (outputOptions instanceof FileDescriptorOutputOptions) {
                if (Build.VERSION.SDK_INT >= 26) {
                    createMediaMuxer = Api26Impl.createMediaMuxer(parcelFileDescriptor.getFileDescriptor(), i);
                } else {
                    throw new IOException("MediaMuxer doesn't accept FileDescriptor as output destination.");
                }
            } else if (outputOptions instanceof MediaStoreOutputOptions) {
                MediaStoreOutputOptions mediaStoreOutputOptions = (MediaStoreOutputOptions) outputOptions;
                ContentValues contentValues = new ContentValues(mediaStoreOutputOptions.getContentValues());
                if (Build.VERSION.SDK_INT >= 29) {
                    contentValues.put("is_pending", (Integer) 1);
                }
                uri = mediaStoreOutputOptions.getContentResolver().insert(mediaStoreOutputOptions.getCollectionUri(), contentValues);
                if (uri == null) {
                    throw new IOException("Unable to create MediaStore entry.");
                }
                if (Build.VERSION.SDK_INT < 26) {
                    String absolutePathFromUri = OutputUtil.getAbsolutePathFromUri(mediaStoreOutputOptions.getContentResolver(), uri, Recorder.MEDIA_COLUMN);
                    if (absolutePathFromUri == null) {
                        throw new IOException("Unable to get path from uri " + uri);
                    }
                    if (!OutputUtil.createParentFolder(new File(absolutePathFromUri))) {
                        Logger.w(Recorder.TAG, "Failed to create folder for " + absolutePathFromUri);
                    }
                    createMediaMuxer = new MediaMuxer(absolutePathFromUri, i);
                } else {
                    ParcelFileDescriptor openFileDescriptor = mediaStoreOutputOptions.getContentResolver().openFileDescriptor(uri, "rw");
                    createMediaMuxer = Api26Impl.createMediaMuxer(openFileDescriptor.getFileDescriptor(), i);
                    openFileDescriptor.close();
                }
            } else {
                throw new AssertionError("Invalid output options type: " + outputOptions.getClass().getSimpleName());
            }
            consumer.accept(uri);
            return createMediaMuxer;
        }

        static /* synthetic */ void lambda$initializeRecording$2(MediaStoreOutputOptions mediaStoreOutputOptions, Uri uri) {
            if (uri.equals(Uri.EMPTY)) {
                return;
            }
            ContentValues contentValues = new ContentValues();
            contentValues.put("is_pending", (Integer) 0);
            mediaStoreOutputOptions.getContentResolver().update(uri, contentValues, null, null);
        }

        static /* synthetic */ void lambda$initializeRecording$4(MediaStoreOutputOptions mediaStoreOutputOptions, Context context, Uri uri) {
            if (uri.equals(Uri.EMPTY)) {
                return;
            }
            String absolutePathFromUri = OutputUtil.getAbsolutePathFromUri(mediaStoreOutputOptions.getContentResolver(), uri, Recorder.MEDIA_COLUMN);
            if (absolutePathFromUri != null) {
                MediaScannerConnection.scanFile(context, new String[]{absolutePathFromUri}, null, new MediaScannerConnection.OnScanCompletedListener() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda0
                    @Override // android.media.MediaScannerConnection.OnScanCompletedListener
                    public final void onScanCompleted(String str, Uri uri2) {
                        Recorder.RecordingRecord.lambda$initializeRecording$3(str, uri2);
                    }
                });
                return;
            }
            Logger.d(Recorder.TAG, "Skipping media scanner scan. Unable to retrieve file path from URI: " + uri);
        }

        static /* synthetic */ void lambda$initializeRecording$3(String str, Uri uri) {
            if (uri == null) {
                Logger.e(Recorder.TAG, String.format("File scanning operation failed [path: %s]", str));
            } else {
                Logger.d(Recorder.TAG, String.format("File scan completed successfully [path: %s, URI: %s]", str, uri));
            }
        }

        static /* synthetic */ void lambda$initializeRecording$5(ParcelFileDescriptor parcelFileDescriptor, Uri uri) {
            try {
                parcelFileDescriptor.close();
            } catch (IOException e) {
                Logger.e(Recorder.TAG, "Failed to close dup'd ParcelFileDescriptor", e);
            }
        }

        void updateVideoRecordEvent(final VideoRecordEvent videoRecordEvent) {
            if (!Objects.equals(videoRecordEvent.getOutputOptions(), getOutputOptions())) {
                throw new AssertionError("Attempted to update event listener with event from incorrect recording [Recording: " + videoRecordEvent.getOutputOptions() + ", Expected: " + getOutputOptions() + "]");
            }
            String str = "Sending VideoRecordEvent " + videoRecordEvent.getClass().getSimpleName();
            if (videoRecordEvent instanceof VideoRecordEvent.Finalize) {
                VideoRecordEvent.Finalize finalize = (VideoRecordEvent.Finalize) videoRecordEvent;
                if (finalize.hasError()) {
                    str = str + String.format(" [error: %s]", VideoRecordEvent.Finalize.errorToString(finalize.getError()));
                }
            }
            Logger.d(Recorder.TAG, str);
            if (getCallbackExecutor() == null || getEventListener() == null) {
                return;
            }
            try {
                getCallbackExecutor().execute(new Runnable() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda6
                    @Override // java.lang.Runnable
                    public final void run() {
                        Recorder.RecordingRecord.this.m179x1386b2b0(videoRecordEvent);
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(Recorder.TAG, "The callback executor is invalid.", e);
            }
        }

        /* renamed from: lambda$updateVideoRecordEvent$6$androidx-camera-video-Recorder$RecordingRecord, reason: not valid java name */
        /* synthetic */ void m179x1386b2b0(VideoRecordEvent videoRecordEvent) {
            getEventListener().accept(videoRecordEvent);
        }

        AudioSource performOneTimeAudioSourceCreation(AudioSource.Settings settings, Executor executor) throws AudioSourceAccessException {
            if (!hasAudioEnabled()) {
                throw new AssertionError("Recording does not have audio enabled. Unable to create audio source for recording " + this);
            }
            AudioSourceSupplier andSet = this.mAudioSourceSupplier.getAndSet(null);
            if (andSet == null) {
                throw new AssertionError("One-time audio source creation has already occurred for recording " + this);
            }
            return andSet.get(settings, executor);
        }

        MediaMuxer performOneTimeMediaMuxerCreation(int i, Consumer<Uri> consumer) throws IOException {
            if (!this.mInitialized.get()) {
                throw new AssertionError("Recording " + this + " has not been initialized");
            }
            MediaMuxerSupplier andSet = this.mMediaMuxerSupplier.getAndSet(null);
            if (andSet == null) {
                throw new AssertionError("One-time media muxer creation has already occurred for recording " + this);
            }
            return andSet.get(i, consumer);
        }

        void finalizeRecording(Uri uri) {
            if (this.mInitialized.get()) {
                finalizeRecordingInternal(this.mRecordingFinalizer.getAndSet(null), uri);
            }
        }

        @Override // java.lang.AutoCloseable
        public void close() {
            finalizeRecording(Uri.EMPTY);
        }

        protected void finalize() throws Throwable {
            try {
                this.mCloseGuard.warnIfOpen();
                Consumer<Uri> andSet = this.mRecordingFinalizer.getAndSet(null);
                if (andSet != null) {
                    finalizeRecordingInternal(andSet, Uri.EMPTY);
                }
            } finally {
                super.finalize();
            }
        }

        private void finalizeRecordingInternal(Consumer<Uri> consumer, Uri uri) {
            if (consumer == null) {
                throw new AssertionError("Recording " + this + " has already been finalized");
            }
            this.mCloseGuard.close();
            consumer.accept(uri);
        }
    }

    public static final class Builder {
        private Executor mExecutor = null;
        private EncoderFactory mVideoEncoderFactory = Recorder.DEFAULT_ENCODER_FACTORY;
        private EncoderFactory mAudioEncoderFactory = Recorder.DEFAULT_ENCODER_FACTORY;
        private final MediaSpec.Builder mMediaSpecBuilder = MediaSpec.builder();

        public Builder setExecutor(Executor executor) {
            Preconditions.checkNotNull(executor, "The specified executor can't be null.");
            this.mExecutor = executor;
            return this;
        }

        public Builder setQualitySelector(final QualitySelector qualitySelector) {
            Preconditions.checkNotNull(qualitySelector, "The specified quality selector can't be null.");
            this.mMediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda2
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setQualitySelector(QualitySelector.this);
                }
            });
            return this;
        }

        Builder setAspectRatio(final int i) {
            this.mMediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda1
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setAspectRatio(i);
                }
            });
            return this;
        }

        Builder setAudioSource(final int i) {
            this.mMediaSpecBuilder.configureAudio(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda0
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((AudioSpec.Builder) obj).setSource(i);
                }
            });
            return this;
        }

        Builder setVideoEncoderFactory(EncoderFactory encoderFactory) {
            this.mVideoEncoderFactory = encoderFactory;
            return this;
        }

        Builder setAudioEncoderFactory(EncoderFactory encoderFactory) {
            this.mAudioEncoderFactory = encoderFactory;
            return this;
        }

        public Recorder build() {
            return new Recorder(this.mExecutor, this.mMediaSpecBuilder.build(), this.mVideoEncoderFactory, this.mAudioEncoderFactory);
        }
    }
}
