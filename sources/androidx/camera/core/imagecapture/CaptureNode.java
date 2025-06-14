package androidx.camera.core.imagecapture;

import android.util.Size;
import android.view.Surface;
import androidx.camera.camera2.internal.ZslControlImpl$$ExternalSyntheticLambda2;
import androidx.camera.core.ForwardingImageProxy;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.MetadataImageReader;
import androidx.camera.core.SafeCloseImageReaderProxy;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.processing.Edge;
import androidx.camera.core.processing.Node;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Objects;
import java.util.Set;

/* loaded from: classes.dex */
class CaptureNode implements Node<In, Out> {
    static final int MAX_IMAGES = 4;
    private In mInputEdge;
    private Out mOutputEdge;
    SafeCloseImageReaderProxy mSafeCloseImageReaderProxy;
    private final Set<Integer> mPendingStageIds = new HashSet();
    private final Set<ImageProxy> mPendingImages = new HashSet();
    private ProcessingRequest mCurrentRequest = null;

    CaptureNode() {
    }

    @Override // androidx.camera.core.processing.Node
    public Out transform(In in) {
        Preconditions.checkState(this.mInputEdge == null && this.mSafeCloseImageReaderProxy == null, "CaptureNode does not support recreation yet.");
        this.mInputEdge = in;
        Size size = in.getSize();
        MetadataImageReader metadataImageReader = new MetadataImageReader(size.getWidth(), size.getHeight(), in.getFormat(), 4);
        this.mSafeCloseImageReaderProxy = new SafeCloseImageReaderProxy(metadataImageReader);
        in.setCameraCaptureCallback(metadataImageReader.getCameraCaptureCallback());
        Surface surface = metadataImageReader.getSurface();
        Objects.requireNonNull(surface);
        in.setSurface(surface);
        metadataImageReader.setOnImageAvailableListener(new ImageReaderProxy.OnImageAvailableListener() { // from class: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy) {
                CaptureNode.this.m126lambda$transform$0$androidxcameracoreimagecaptureCaptureNode(imageReaderProxy);
            }
        }, CameraXExecutors.mainThreadExecutor());
        in.getRequestEdge().setListener(new Consumer() { // from class: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda1
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                CaptureNode.this.onRequestAvailable((ProcessingRequest) obj);
            }
        });
        Out of = Out.of(in.getFormat());
        this.mOutputEdge = of;
        return of;
    }

    /* renamed from: lambda$transform$0$androidx-camera-core-imagecapture-CaptureNode, reason: not valid java name */
    /* synthetic */ void m126lambda$transform$0$androidxcameracoreimagecaptureCaptureNode(ImageReaderProxy imageReaderProxy) {
        ImageProxy acquireNextImage = imageReaderProxy.acquireNextImage();
        Objects.requireNonNull(acquireNextImage);
        onImageProxyAvailable(acquireNextImage);
    }

    void onImageProxyAvailable(ImageProxy imageProxy) {
        Threads.checkMainThread();
        if (this.mCurrentRequest == null) {
            this.mPendingImages.add(imageProxy);
        } else {
            matchAndPropagateImage(imageProxy);
        }
    }

    private void matchAndPropagateImage(ImageProxy imageProxy) {
        Object tag = imageProxy.getImageInfo().getTagBundle().getTag(this.mCurrentRequest.getTagBundleKey());
        Objects.requireNonNull(tag);
        int intValue = ((Integer) tag).intValue();
        Preconditions.checkState(this.mPendingStageIds.contains(Integer.valueOf(intValue)), "Received an unexpected stage id" + intValue);
        this.mPendingStageIds.remove(Integer.valueOf(intValue));
        if (this.mPendingStageIds.isEmpty()) {
            this.mCurrentRequest.onImageCaptured();
            this.mCurrentRequest = null;
        }
        Out out = this.mOutputEdge;
        Objects.requireNonNull(out);
        out.getImageEdge().accept(imageProxy);
    }

    void onRequestAvailable(ProcessingRequest processingRequest) {
        Threads.checkMainThread();
        boolean z = true;
        Preconditions.checkState(getCapacity() > 0, "Too many acquire images. Close image to be able to process next.");
        if (this.mCurrentRequest != null && !this.mPendingStageIds.isEmpty()) {
            z = false;
        }
        Preconditions.checkState(z, "The previous request is not complete");
        this.mCurrentRequest = processingRequest;
        this.mPendingStageIds.addAll(processingRequest.getStageIds());
        Out out = this.mOutputEdge;
        Objects.requireNonNull(out);
        out.getRequestEdge().accept(processingRequest);
        Iterator<ImageProxy> it = this.mPendingImages.iterator();
        while (it.hasNext()) {
            matchAndPropagateImage(it.next());
        }
        this.mPendingImages.clear();
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
        Threads.checkMainThread();
        In in = this.mInputEdge;
        Objects.requireNonNull(in);
        SafeCloseImageReaderProxy safeCloseImageReaderProxy = this.mSafeCloseImageReaderProxy;
        Objects.requireNonNull(safeCloseImageReaderProxy);
        releaseInputResources(in, safeCloseImageReaderProxy);
    }

    private void releaseInputResources(In in, SafeCloseImageReaderProxy safeCloseImageReaderProxy) {
        in.getSurface().close();
        ListenableFuture<Void> terminationFuture = in.getSurface().getTerminationFuture();
        Objects.requireNonNull(safeCloseImageReaderProxy);
        terminationFuture.addListener(new ZslControlImpl$$ExternalSyntheticLambda2(safeCloseImageReaderProxy), CameraXExecutors.mainThreadExecutor());
    }

    In getInputEdge() {
        In in = this.mInputEdge;
        Objects.requireNonNull(in);
        return in;
    }

    public int getCapacity() {
        Threads.checkMainThread();
        Preconditions.checkState(this.mSafeCloseImageReaderProxy != null, "The ImageReader is not initialized.");
        return this.mSafeCloseImageReaderProxy.getCapacity();
    }

    public void setOnImageCloseListener(ForwardingImageProxy.OnImageCloseListener onImageCloseListener) {
        Threads.checkMainThread();
        Preconditions.checkState(this.mSafeCloseImageReaderProxy != null, "The ImageReader is not initialized.");
        this.mSafeCloseImageReaderProxy.setOnImageCloseListener(onImageCloseListener);
    }

    static abstract class In {
        private CameraCaptureCallback mCameraCaptureCallback;
        private DeferrableSurface mSurface;

        abstract int getFormat();

        abstract Edge<ProcessingRequest> getRequestEdge();

        abstract Size getSize();

        In() {
        }

        DeferrableSurface getSurface() {
            return this.mSurface;
        }

        void setSurface(Surface surface) {
            Preconditions.checkState(this.mSurface == null, "The surface is already set.");
            this.mSurface = new ImmediateSurface(surface);
        }

        CameraCaptureCallback getCameraCaptureCallback() {
            return this.mCameraCaptureCallback;
        }

        void setCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            this.mCameraCaptureCallback = cameraCaptureCallback;
        }

        static In of(Size size, int i) {
            return new AutoValue_CaptureNode_In(size, i, new Edge());
        }
    }

    static abstract class Out {
        abstract int getFormat();

        abstract Edge<ImageProxy> getImageEdge();

        abstract Edge<ProcessingRequest> getRequestEdge();

        Out() {
        }

        static Out of(int i) {
            return new AutoValue_CaptureNode_Out(new Edge(), new Edge(), i);
        }
    }
}
