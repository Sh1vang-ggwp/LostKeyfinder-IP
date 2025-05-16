package androidx.camera.core.processing;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Objects;

/* loaded from: classes.dex */
public class SurfaceEdge {
    private SurfaceOutputImpl mConsumerToNotify;
    private final Rect mCropRect;
    private final int mFormat;
    private final boolean mHasEmbeddedTransform;
    private final boolean mMirroring;
    private final Runnable mOnInvalidated;
    private SurfaceRequest mProviderSurfaceRequest;
    private int mRotationDegrees;
    private final Matrix mSensorToBufferTransform;
    private final Size mSize;
    private final int mTargets;
    private boolean mHasConsumer = false;
    private final SettableSurface mSettableSurface = new SettableSurface();

    public SurfaceEdge(int i, Size size, int i2, Matrix matrix, boolean z, Rect rect, int i3, boolean z2, Runnable runnable) {
        this.mTargets = i;
        this.mSize = size;
        this.mFormat = i2;
        this.mSensorToBufferTransform = matrix;
        this.mHasEmbeddedTransform = z;
        this.mCropRect = rect;
        this.mRotationDegrees = i3;
        this.mMirroring = z2;
        this.mOnInvalidated = runnable;
    }

    public DeferrableSurface getDeferrableSurface() {
        return this.mSettableSurface;
    }

    public void setProvider(DeferrableSurface deferrableSurface) throws DeferrableSurface.SurfaceClosedException {
        Threads.checkMainThread();
        this.mSettableSurface.setProvider(deferrableSurface);
    }

    public SurfaceRequest createSurfaceRequest(CameraInternal cameraInternal) {
        return createSurfaceRequest(cameraInternal, null);
    }

    public SurfaceRequest createSurfaceRequest(CameraInternal cameraInternal, Range<Integer> range) {
        Threads.checkMainThread();
        SurfaceRequest surfaceRequest = new SurfaceRequest(getSize(), cameraInternal, range, new SurfaceEdge$$ExternalSyntheticLambda2(this));
        try {
            setProvider(surfaceRequest.getDeferrableSurface());
            this.mProviderSurfaceRequest = surfaceRequest;
            notifyTransformationInfoUpdate();
            return surfaceRequest;
        } catch (DeferrableSurface.SurfaceClosedException e) {
            throw new AssertionError("Surface is somehow already closed", e);
        }
    }

    public ListenableFuture<SurfaceOutput> createSurfaceOutputFuture(final Size size, final Rect rect, final int i, final boolean z) {
        Threads.checkMainThread();
        Preconditions.checkState(!this.mHasConsumer, "Consumer can only be linked once.");
        this.mHasConsumer = true;
        return Futures.transformAsync(this.mSettableSurface.getSurface(), new AsyncFunction() { // from class: androidx.camera.core.processing.SurfaceEdge$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                return SurfaceEdge.this.m157x97d38ffa(size, rect, i, z, (Surface) obj);
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    /* renamed from: lambda$createSurfaceOutputFuture$0$androidx-camera-core-processing-SurfaceEdge, reason: not valid java name */
    /* synthetic */ ListenableFuture m157x97d38ffa(Size size, Rect rect, int i, boolean z, Surface surface) throws Exception {
        Preconditions.checkNotNull(surface);
        try {
            this.mSettableSurface.incrementUseCount();
            SurfaceOutputImpl surfaceOutputImpl = new SurfaceOutputImpl(surface, getTargets(), this.mFormat, getSize(), size, rect, i, z);
            ListenableFuture<Void> closeFuture = surfaceOutputImpl.getCloseFuture();
            final SettableSurface settableSurface = this.mSettableSurface;
            Objects.requireNonNull(settableSurface);
            closeFuture.addListener(new Runnable() { // from class: androidx.camera.core.processing.SurfaceEdge$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    SurfaceEdge.SettableSurface.this.decrementUseCount();
                }
            }, CameraXExecutors.directExecutor());
            this.mConsumerToNotify = surfaceOutputImpl;
            return Futures.immediateFuture(surfaceOutputImpl);
        } catch (DeferrableSurface.SurfaceClosedException e) {
            return Futures.immediateFailedFuture(e);
        }
    }

    public void invalidate() {
        close();
        this.mOnInvalidated.run();
    }

    public final void close() {
        this.mSettableSurface.close();
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.processing.SurfaceEdge$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceEdge.this.m156lambda$close$1$androidxcameracoreprocessingSurfaceEdge();
            }
        });
    }

    /* renamed from: lambda$close$1$androidx-camera-core-processing-SurfaceEdge, reason: not valid java name */
    /* synthetic */ void m156lambda$close$1$androidxcameracoreprocessingSurfaceEdge() {
        SurfaceOutputImpl surfaceOutputImpl = this.mConsumerToNotify;
        if (surfaceOutputImpl != null) {
            surfaceOutputImpl.requestClose();
            this.mConsumerToNotify = null;
        }
    }

    public int getTargets() {
        return this.mTargets;
    }

    public Size getSize() {
        return this.mSize;
    }

    public int getFormat() {
        return this.mFormat;
    }

    public Matrix getSensorToBufferTransform() {
        return this.mSensorToBufferTransform;
    }

    public boolean hasEmbeddedTransform() {
        return this.mHasEmbeddedTransform;
    }

    public Rect getCropRect() {
        return this.mCropRect;
    }

    public int getRotationDegrees() {
        return this.mRotationDegrees;
    }

    public void setRotationDegrees(int i) {
        Threads.checkMainThread();
        if (this.mRotationDegrees == i) {
            return;
        }
        this.mRotationDegrees = i;
        notifyTransformationInfoUpdate();
    }

    private void notifyTransformationInfoUpdate() {
        SurfaceRequest surfaceRequest = this.mProviderSurfaceRequest;
        if (surfaceRequest != null) {
            surfaceRequest.updateTransformationInfo(SurfaceRequest.TransformationInfo.of(this.mCropRect, this.mRotationDegrees, -1, hasEmbeddedTransform()));
        }
    }

    public boolean getMirroring() {
        return this.mMirroring;
    }

    static class SettableSurface extends DeferrableSurface {
        CallbackToFutureAdapter.Completer<Surface> mCompleter;
        final ListenableFuture<Surface> mSurfaceFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.processing.SurfaceEdge$SettableSurface$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return SurfaceEdge.SettableSurface.this.m158xcee66962(completer);
            }
        });
        private boolean mHasProvider = false;

        SettableSurface() {
        }

        /* renamed from: lambda$new$0$androidx-camera-core-processing-SurfaceEdge$SettableSurface, reason: not valid java name */
        /* synthetic */ Object m158xcee66962(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mCompleter = completer;
            return "SettableFuture hashCode: " + hashCode();
        }

        @Override // androidx.camera.core.impl.DeferrableSurface
        protected ListenableFuture<Surface> provideSurface() {
            return this.mSurfaceFuture;
        }

        public void setProvider(final DeferrableSurface deferrableSurface) throws DeferrableSurface.SurfaceClosedException {
            Threads.checkMainThread();
            Preconditions.checkState(!this.mHasProvider, "Provider can only be set once.");
            this.mHasProvider = true;
            Futures.propagate(deferrableSurface.getSurface(), this.mCompleter);
            deferrableSurface.incrementUseCount();
            getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.core.processing.SurfaceEdge$SettableSurface$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    SurfaceEdge.SettableSurface.lambda$setProvider$1(DeferrableSurface.this);
                }
            }, CameraXExecutors.directExecutor());
        }

        static /* synthetic */ void lambda$setProvider$1(DeferrableSurface deferrableSurface) {
            deferrableSurface.decrementUseCount();
            deferrableSurface.close();
        }
    }
}
