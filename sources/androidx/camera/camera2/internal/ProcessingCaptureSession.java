package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.util.Size;
import androidx.arch.core.util.Function;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.ProcessingCaptureSession;
import androidx.camera.camera2.interop.CaptureRequestOptions;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Logger;
import androidx.camera.core.Preview;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.DeferrableSurfaces;
import androidx.camera.core.impl.OutputSurface;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.SessionProcessor;
import androidx.camera.core.impl.SessionProcessorSurface;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;

/* loaded from: classes.dex */
final class ProcessingCaptureSession implements CaptureSessionInterface {
    private static final String TAG = "ProcessingCaptureSession";
    private static final long TIMEOUT_GET_SURFACE_IN_MS = 5000;
    private static List<DeferrableSurface> sHeldProcessorSurfaces = new ArrayList();
    private static int sNextInstanceId = 0;
    private final Camera2CameraInfoImpl mCamera2CameraInfoImpl;
    final Executor mExecutor;
    private int mInstanceId;
    private SessionConfig mProcessorSessionConfig;
    private Camera2RequestProcessor mRequestProcessor;
    private final ScheduledExecutorService mScheduledExecutorService;
    private SessionConfig mSessionConfig;
    private final SessionProcessor mSessionProcessor;
    private List<DeferrableSurface> mOutputSurfaces = new ArrayList();
    private volatile List<CaptureConfig> mPendingCaptureConfigs = null;
    volatile boolean mIsExecutingStillCaptureRequest = false;
    private CaptureRequestOptions mSessionOptions = new CaptureRequestOptions.Builder().build();
    private CaptureRequestOptions mStillCaptureOptions = new CaptureRequestOptions.Builder().build();
    private final CaptureSession mCaptureSession = new CaptureSession();
    private ProcessorState mProcessorState = ProcessorState.UNINITIALIZED;
    private final SessionProcessorCaptureCallback mSessionProcessorCaptureCallback = new SessionProcessorCaptureCallback();

    private enum ProcessorState {
        UNINITIALIZED,
        SESSION_INITIALIZED,
        ON_CAPTURE_SESSION_STARTED,
        ON_CAPTURE_SESSION_ENDED,
        CLOSED
    }

    ProcessingCaptureSession(SessionProcessor sessionProcessor, Camera2CameraInfoImpl camera2CameraInfoImpl, Executor executor, ScheduledExecutorService scheduledExecutorService) {
        this.mInstanceId = 0;
        this.mSessionProcessor = sessionProcessor;
        this.mCamera2CameraInfoImpl = camera2CameraInfoImpl;
        this.mExecutor = executor;
        this.mScheduledExecutorService = scheduledExecutorService;
        int i = sNextInstanceId;
        sNextInstanceId = i + 1;
        this.mInstanceId = i;
        Logger.d(TAG, "New ProcessingCaptureSession (id=" + this.mInstanceId + ")");
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public ListenableFuture<Void> open(final SessionConfig sessionConfig, final CameraDevice cameraDevice, final SynchronizedCaptureSessionOpener synchronizedCaptureSessionOpener) {
        Preconditions.checkArgument(this.mProcessorState == ProcessorState.UNINITIALIZED, "Invalid state state:" + this.mProcessorState);
        Preconditions.checkArgument(sessionConfig.getSurfaces().isEmpty() ^ true, "SessionConfig contains no surfaces");
        Logger.d(TAG, "open (id=" + this.mInstanceId + ")");
        List<DeferrableSurface> surfaces = sessionConfig.getSurfaces();
        this.mOutputSurfaces = surfaces;
        return FutureChain.from(DeferrableSurfaces.surfaceListWithTimeout(surfaces, false, TIMEOUT_GET_SURFACE_IN_MS, this.mExecutor, this.mScheduledExecutorService)).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                return ProcessingCaptureSession.this.m48x6ab9d420(sessionConfig, cameraDevice, synchronizedCaptureSessionOpener, (List) obj);
            }
        }, this.mExecutor).transform(new Function() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda0
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return ProcessingCaptureSession.this.m49x7b6fa0e1((Void) obj);
            }
        }, this.mExecutor);
    }

    /* renamed from: lambda$open$2$androidx-camera-camera2-internal-ProcessingCaptureSession, reason: not valid java name */
    /* synthetic */ ListenableFuture m48x6ab9d420(SessionConfig sessionConfig, CameraDevice cameraDevice, SynchronizedCaptureSessionOpener synchronizedCaptureSessionOpener, List list) throws Exception {
        Logger.d(TAG, "-- getSurfaces done, start init (id=" + this.mInstanceId + ")");
        if (this.mProcessorState == ProcessorState.CLOSED) {
            return Futures.immediateFailedFuture(new IllegalStateException("SessionProcessorCaptureSession is closed."));
        }
        OutputSurface outputSurface = null;
        if (list.contains(null)) {
            return Futures.immediateFailedFuture(new DeferrableSurface.SurfaceClosedException("Surface closed", sessionConfig.getSurfaces().get(list.indexOf(null))));
        }
        try {
            DeferrableSurfaces.incrementAll(this.mOutputSurfaces);
            OutputSurface outputSurface2 = null;
            OutputSurface outputSurface3 = null;
            for (int i = 0; i < sessionConfig.getSurfaces().size(); i++) {
                DeferrableSurface deferrableSurface = sessionConfig.getSurfaces().get(i);
                if (Objects.equals(deferrableSurface.getContainerClass(), Preview.class)) {
                    outputSurface = OutputSurface.create(deferrableSurface.getSurface().get(), new Size(deferrableSurface.getPrescribedSize().getWidth(), deferrableSurface.getPrescribedSize().getHeight()), deferrableSurface.getPrescribedStreamFormat());
                } else if (Objects.equals(deferrableSurface.getContainerClass(), ImageCapture.class)) {
                    outputSurface2 = OutputSurface.create(deferrableSurface.getSurface().get(), new Size(deferrableSurface.getPrescribedSize().getWidth(), deferrableSurface.getPrescribedSize().getHeight()), deferrableSurface.getPrescribedStreamFormat());
                } else if (Objects.equals(deferrableSurface.getContainerClass(), ImageAnalysis.class)) {
                    outputSurface3 = OutputSurface.create(deferrableSurface.getSurface().get(), new Size(deferrableSurface.getPrescribedSize().getWidth(), deferrableSurface.getPrescribedSize().getHeight()), deferrableSurface.getPrescribedStreamFormat());
                }
            }
            this.mProcessorState = ProcessorState.SESSION_INITIALIZED;
            Logger.w(TAG, "== initSession (id=" + this.mInstanceId + ")");
            SessionConfig initSession = this.mSessionProcessor.initSession(this.mCamera2CameraInfoImpl, outputSurface, outputSurface2, outputSurface3);
            this.mProcessorSessionConfig = initSession;
            initSession.getSurfaces().get(0).getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingCaptureSession.this.m47x494e3a9e();
                }
            }, CameraXExecutors.directExecutor());
            for (final DeferrableSurface deferrableSurface2 : this.mProcessorSessionConfig.getSurfaces()) {
                sHeldProcessorSurfaces.add(deferrableSurface2);
                deferrableSurface2.getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda3
                    @Override // java.lang.Runnable
                    public final void run() {
                        ProcessingCaptureSession.sHeldProcessorSurfaces.remove(DeferrableSurface.this);
                    }
                }, this.mExecutor);
            }
            SessionConfig.ValidatingBuilder validatingBuilder = new SessionConfig.ValidatingBuilder();
            validatingBuilder.add(sessionConfig);
            validatingBuilder.clearSurfaces();
            validatingBuilder.add(this.mProcessorSessionConfig);
            Preconditions.checkArgument(validatingBuilder.isValid(), "Cannot transform the SessionConfig");
            ListenableFuture<Void> open = this.mCaptureSession.open(validatingBuilder.build(), (CameraDevice) Preconditions.checkNotNull(cameraDevice), synchronizedCaptureSessionOpener);
            Futures.addCallback(open, new FutureCallback<Void>() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession.1
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(Void r1) {
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable th) {
                    Logger.e(ProcessingCaptureSession.TAG, "open session failed ", th);
                    ProcessingCaptureSession.this.close();
                }
            }, this.mExecutor);
            return open;
        } catch (DeferrableSurface.SurfaceClosedException e) {
            return Futures.immediateFailedFuture(e);
        }
    }

    /* renamed from: lambda$open$0$androidx-camera-camera2-internal-ProcessingCaptureSession, reason: not valid java name */
    /* synthetic */ void m47x494e3a9e() {
        DeferrableSurfaces.decrementAll(this.mOutputSurfaces);
    }

    /* renamed from: lambda$open$3$androidx-camera-camera2-internal-ProcessingCaptureSession, reason: not valid java name */
    /* synthetic */ Void m49x7b6fa0e1(Void r1) {
        onConfigured(this.mCaptureSession);
        return null;
    }

    private static void cancelRequests(List<CaptureConfig> list) {
        Iterator<CaptureConfig> it = list.iterator();
        while (it.hasNext()) {
            Iterator<CameraCaptureCallback> it2 = it.next().getCameraCaptureCallbacks().iterator();
            while (it2.hasNext()) {
                it2.next().onCaptureCancelled();
            }
        }
    }

    void issueTriggerRequest(CaptureConfig captureConfig) {
        boolean z;
        Logger.d(TAG, "issueTriggerRequest");
        CaptureRequestOptions build = CaptureRequestOptions.Builder.from(captureConfig.getImplementationOptions()).build();
        Iterator it = build.listOptions().iterator();
        while (it.hasNext()) {
            CaptureRequest.Key key = (CaptureRequest.Key) ((Config.Option) it.next()).getToken();
            if (key.equals(CaptureRequest.CONTROL_AF_TRIGGER) || key.equals(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER)) {
                z = true;
                break;
            }
        }
        z = false;
        if (!z) {
            cancelRequests(Arrays.asList(captureConfig));
        } else {
            this.mSessionProcessor.startTrigger(build, new AnonymousClass2(captureConfig));
        }
    }

    /* renamed from: androidx.camera.camera2.internal.ProcessingCaptureSession$2, reason: invalid class name */
    class AnonymousClass2 implements SessionProcessor.CaptureCallback {
        final /* synthetic */ CaptureConfig val$captureConfig;

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureCompleted(long j, int i, Map map) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureCompleted(this, j, i, map);
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureProcessStarted(int i) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureProcessStarted(this, i);
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureSequenceAborted(int i) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureSequenceAborted(this, i);
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureStarted(int i, long j) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureStarted(this, i, j);
        }

        AnonymousClass2(CaptureConfig captureConfig) {
            this.val$captureConfig = captureConfig;
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureFailed(int i) {
            Executor executor = ProcessingCaptureSession.this.mExecutor;
            final CaptureConfig captureConfig = this.val$captureConfig;
            executor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$2$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingCaptureSession.AnonymousClass2.lambda$onCaptureFailed$0(CaptureConfig.this);
                }
            });
        }

        static /* synthetic */ void lambda$onCaptureFailed$0(CaptureConfig captureConfig) {
            Iterator<CameraCaptureCallback> it = captureConfig.getCameraCaptureCallbacks().iterator();
            while (it.hasNext()) {
                it.next().onCaptureFailed(new CameraCaptureFailure(CameraCaptureFailure.Reason.ERROR));
            }
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceCompleted(int i) {
            Executor executor = ProcessingCaptureSession.this.mExecutor;
            final CaptureConfig captureConfig = this.val$captureConfig;
            executor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$2$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingCaptureSession.AnonymousClass2.lambda$onCaptureSequenceCompleted$1(CaptureConfig.this);
                }
            });
        }

        static /* synthetic */ void lambda$onCaptureSequenceCompleted$1(CaptureConfig captureConfig) {
            Iterator<CameraCaptureCallback> it = captureConfig.getCameraCaptureCallbacks().iterator();
            while (it.hasNext()) {
                it.next().onCaptureCompleted(new CameraCaptureResult.EmptyCameraCaptureResult());
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void issueCaptureRequests(List<CaptureConfig> list) {
        if (list.isEmpty()) {
            return;
        }
        Logger.d(TAG, "issueCaptureRequests (id=" + this.mInstanceId + ") + state =" + this.mProcessorState);
        int i = AnonymousClass4.$SwitchMap$androidx$camera$camera2$internal$ProcessingCaptureSession$ProcessorState[this.mProcessorState.ordinal()];
        if (i == 1 || i == 2) {
            this.mPendingCaptureConfigs = list;
            return;
        }
        if (i == 3) {
            for (CaptureConfig captureConfig : list) {
                if (captureConfig.getTemplateType() == 2) {
                    issueStillCaptureRequest(captureConfig);
                } else {
                    issueTriggerRequest(captureConfig);
                }
            }
            return;
        }
        if (i == 4 || i == 5) {
            Logger.d(TAG, "Run issueCaptureRequests in wrong state, state = " + this.mProcessorState);
            cancelRequests(list);
        }
    }

    /* renamed from: androidx.camera.camera2.internal.ProcessingCaptureSession$4, reason: invalid class name */
    static /* synthetic */ class AnonymousClass4 {
        static final /* synthetic */ int[] $SwitchMap$androidx$camera$camera2$internal$ProcessingCaptureSession$ProcessorState;

        static {
            int[] iArr = new int[ProcessorState.values().length];
            $SwitchMap$androidx$camera$camera2$internal$ProcessingCaptureSession$ProcessorState = iArr;
            try {
                iArr[ProcessorState.UNINITIALIZED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$androidx$camera$camera2$internal$ProcessingCaptureSession$ProcessorState[ProcessorState.SESSION_INITIALIZED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$androidx$camera$camera2$internal$ProcessingCaptureSession$ProcessorState[ProcessorState.ON_CAPTURE_SESSION_STARTED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$androidx$camera$camera2$internal$ProcessingCaptureSession$ProcessorState[ProcessorState.ON_CAPTURE_SESSION_ENDED.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$androidx$camera$camera2$internal$ProcessingCaptureSession$ProcessorState[ProcessorState.CLOSED.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
        }
    }

    void issueStillCaptureRequest(CaptureConfig captureConfig) {
        CaptureRequestOptions.Builder from = CaptureRequestOptions.Builder.from(captureConfig.getImplementationOptions());
        if (captureConfig.getImplementationOptions().containsOption(CaptureConfig.OPTION_ROTATION)) {
            from.setCaptureRequestOption(CaptureRequest.JPEG_ORIENTATION, (Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_ROTATION));
        }
        if (captureConfig.getImplementationOptions().containsOption(CaptureConfig.OPTION_JPEG_QUALITY)) {
            from.setCaptureRequestOption(CaptureRequest.JPEG_QUALITY, Byte.valueOf(((Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_JPEG_QUALITY)).byteValue()));
        }
        CaptureRequestOptions build = from.build();
        this.mStillCaptureOptions = build;
        updateParameters(this.mSessionOptions, build);
        this.mSessionProcessor.startCapture(new AnonymousClass3(captureConfig));
    }

    /* renamed from: androidx.camera.camera2.internal.ProcessingCaptureSession$3, reason: invalid class name */
    class AnonymousClass3 implements SessionProcessor.CaptureCallback {
        final /* synthetic */ CaptureConfig val$captureConfig;

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureCompleted(long j, int i, Map map) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureCompleted(this, j, i, map);
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureProcessStarted(int i) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureProcessStarted(this, i);
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureSequenceAborted(int i) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureSequenceAborted(this, i);
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public /* synthetic */ void onCaptureStarted(int i, long j) {
            SessionProcessor.CaptureCallback.CC.$default$onCaptureStarted(this, i, j);
        }

        AnonymousClass3(CaptureConfig captureConfig) {
            this.val$captureConfig = captureConfig;
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureFailed(int i) {
            Executor executor = ProcessingCaptureSession.this.mExecutor;
            final CaptureConfig captureConfig = this.val$captureConfig;
            executor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$3$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingCaptureSession.AnonymousClass3.lambda$onCaptureFailed$0(CaptureConfig.this);
                }
            });
        }

        static /* synthetic */ void lambda$onCaptureFailed$0(CaptureConfig captureConfig) {
            Iterator<CameraCaptureCallback> it = captureConfig.getCameraCaptureCallbacks().iterator();
            while (it.hasNext()) {
                it.next().onCaptureFailed(new CameraCaptureFailure(CameraCaptureFailure.Reason.ERROR));
            }
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceCompleted(int i) {
            Executor executor = ProcessingCaptureSession.this.mExecutor;
            final CaptureConfig captureConfig = this.val$captureConfig;
            executor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$3$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingCaptureSession.AnonymousClass3.lambda$onCaptureSequenceCompleted$1(CaptureConfig.this);
                }
            });
        }

        static /* synthetic */ void lambda$onCaptureSequenceCompleted$1(CaptureConfig captureConfig) {
            Iterator<CameraCaptureCallback> it = captureConfig.getCameraCaptureCallbacks().iterator();
            while (it.hasNext()) {
                it.next().onCaptureCompleted(new CameraCaptureResult.EmptyCameraCaptureResult());
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public ListenableFuture<Void> release(boolean z) {
        Preconditions.checkState(this.mProcessorState == ProcessorState.CLOSED, "release() can only be called in CLOSED state");
        Logger.d(TAG, "release (id=" + this.mInstanceId + ")");
        return this.mCaptureSession.release(z);
    }

    private static List<SessionProcessorSurface> getSessionProcessorSurfaceList(List<DeferrableSurface> list) {
        ArrayList arrayList = new ArrayList();
        for (DeferrableSurface deferrableSurface : list) {
            Preconditions.checkArgument(deferrableSurface instanceof SessionProcessorSurface, "Surface must be SessionProcessorSurface");
            arrayList.add((SessionProcessorSurface) deferrableSurface);
        }
        return arrayList;
    }

    void onConfigured(CaptureSession captureSession) {
        Preconditions.checkArgument(this.mProcessorState == ProcessorState.SESSION_INITIALIZED, "Invalid state state:" + this.mProcessorState);
        Camera2RequestProcessor camera2RequestProcessor = new Camera2RequestProcessor(captureSession, getSessionProcessorSurfaceList(this.mProcessorSessionConfig.getSurfaces()));
        this.mRequestProcessor = camera2RequestProcessor;
        this.mSessionProcessor.onCaptureSessionStart(camera2RequestProcessor);
        this.mProcessorState = ProcessorState.ON_CAPTURE_SESSION_STARTED;
        SessionConfig sessionConfig = this.mSessionConfig;
        if (sessionConfig != null) {
            setSessionConfig(sessionConfig);
        }
        if (this.mPendingCaptureConfigs != null) {
            issueCaptureRequests(this.mPendingCaptureConfigs);
            this.mPendingCaptureConfigs = null;
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public SessionConfig getSessionConfig() {
        return this.mSessionConfig;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public List<CaptureConfig> getCaptureConfigs() {
        return this.mPendingCaptureConfigs != null ? this.mPendingCaptureConfigs : Collections.emptyList();
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void cancelIssuedCaptureRequests() {
        Logger.d(TAG, "cancelIssuedCaptureRequests (id=" + this.mInstanceId + ")");
        if (this.mPendingCaptureConfigs != null) {
            Iterator<CaptureConfig> it = this.mPendingCaptureConfigs.iterator();
            while (it.hasNext()) {
                Iterator<CameraCaptureCallback> it2 = it.next().getCameraCaptureCallbacks().iterator();
                while (it2.hasNext()) {
                    it2.next().onCaptureCancelled();
                }
            }
            this.mPendingCaptureConfigs = null;
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void close() {
        Logger.d(TAG, "close (id=" + this.mInstanceId + ") state=" + this.mProcessorState);
        int i = AnonymousClass4.$SwitchMap$androidx$camera$camera2$internal$ProcessingCaptureSession$ProcessorState[this.mProcessorState.ordinal()];
        if (i != 2) {
            if (i == 3) {
                this.mSessionProcessor.onCaptureSessionEnd();
                Camera2RequestProcessor camera2RequestProcessor = this.mRequestProcessor;
                if (camera2RequestProcessor != null) {
                    camera2RequestProcessor.close();
                }
                this.mProcessorState = ProcessorState.ON_CAPTURE_SESSION_ENDED;
            } else if (i != 4) {
                if (i == 5) {
                    return;
                }
                this.mProcessorState = ProcessorState.CLOSED;
                this.mCaptureSession.close();
            }
        }
        this.mSessionProcessor.deInitSession();
        this.mProcessorState = ProcessorState.CLOSED;
        this.mCaptureSession.close();
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void setSessionConfig(SessionConfig sessionConfig) {
        Logger.d(TAG, "setSessionConfig (id=" + this.mInstanceId + ")");
        this.mSessionConfig = sessionConfig;
        if (sessionConfig == null) {
            return;
        }
        Camera2RequestProcessor camera2RequestProcessor = this.mRequestProcessor;
        if (camera2RequestProcessor != null) {
            camera2RequestProcessor.updateSessionConfig(sessionConfig);
        }
        if (this.mProcessorState == ProcessorState.ON_CAPTURE_SESSION_STARTED) {
            CaptureRequestOptions build = CaptureRequestOptions.Builder.from(sessionConfig.getImplementationOptions()).build();
            this.mSessionOptions = build;
            updateParameters(build, this.mStillCaptureOptions);
            this.mSessionProcessor.startRepeating(this.mSessionProcessorCaptureCallback);
        }
    }

    private void updateParameters(CaptureRequestOptions captureRequestOptions, CaptureRequestOptions captureRequestOptions2) {
        Camera2ImplConfig.Builder builder = new Camera2ImplConfig.Builder();
        builder.insertAllOptions(captureRequestOptions);
        builder.insertAllOptions(captureRequestOptions2);
        this.mSessionProcessor.setParameters(builder.build());
    }

    private static class SessionProcessorCaptureCallback implements SessionProcessor.CaptureCallback {
        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureCompleted(long j, int i, Map<CaptureResult.Key, Object> map) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureFailed(int i) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureProcessStarted(int i) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceAborted(int i) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceCompleted(int i) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureStarted(int i, long j) {
        }

        SessionProcessorCaptureCallback() {
        }
    }
}
