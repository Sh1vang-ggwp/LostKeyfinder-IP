package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.imagecapture.TakePictureRequest;
import androidx.camera.core.impl.utils.Threads;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Objects;

/* loaded from: classes.dex */
class RequestWithCallback implements TakePictureCallback {
    private CallbackToFutureAdapter.Completer<Void> mCaptureCompleter;
    private ListenableFuture<Void> mCaptureRequestFuture;
    private CallbackToFutureAdapter.Completer<Void> mCompleteCompleter;
    private final TakePictureRequest.RetryControl mRetryControl;
    private final TakePictureRequest mTakePictureRequest;
    private boolean mIsAborted = false;
    private final ListenableFuture<Void> mCaptureFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.imagecapture.RequestWithCallback$$ExternalSyntheticLambda0
        @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
        public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
            return RequestWithCallback.this.m129xfdcdcb4d(completer);
        }
    });
    private final ListenableFuture<Void> mCompleteFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.imagecapture.RequestWithCallback$$ExternalSyntheticLambda1
        @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
        public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
            return RequestWithCallback.this.m130x2722208e(completer);
        }
    });

    RequestWithCallback(TakePictureRequest takePictureRequest, TakePictureRequest.RetryControl retryControl) {
        this.mTakePictureRequest = takePictureRequest;
        this.mRetryControl = retryControl;
    }

    /* renamed from: lambda$new$0$androidx-camera-core-imagecapture-RequestWithCallback, reason: not valid java name */
    /* synthetic */ Object m129xfdcdcb4d(CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mCaptureCompleter = completer;
        return "CaptureCompleteFuture";
    }

    /* renamed from: lambda$new$1$androidx-camera-core-imagecapture-RequestWithCallback, reason: not valid java name */
    /* synthetic */ Object m130x2722208e(CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mCompleteCompleter = completer;
        return "RequestCompleteFuture";
    }

    public void setCaptureRequestFuture(ListenableFuture<Void> listenableFuture) {
        Threads.checkMainThread();
        Preconditions.checkState(this.mCaptureRequestFuture == null, "CaptureRequestFuture can only be set once.");
        this.mCaptureRequestFuture = listenableFuture;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureCallback
    public void onImageCaptured() {
        Threads.checkMainThread();
        if (this.mIsAborted) {
            return;
        }
        this.mCaptureCompleter.set(null);
    }

    @Override // androidx.camera.core.imagecapture.TakePictureCallback
    public void onFinalResult(ImageCapture.OutputFileResults outputFileResults) {
        Threads.checkMainThread();
        if (this.mIsAborted) {
            return;
        }
        checkOnImageCaptured();
        markComplete();
        this.mTakePictureRequest.onResult(outputFileResults);
    }

    @Override // androidx.camera.core.imagecapture.TakePictureCallback
    public void onFinalResult(ImageProxy imageProxy) {
        Threads.checkMainThread();
        if (this.mIsAborted) {
            return;
        }
        checkOnImageCaptured();
        markComplete();
        this.mTakePictureRequest.onResult(imageProxy);
    }

    @Override // androidx.camera.core.imagecapture.TakePictureCallback
    public void onProcessFailure(ImageCaptureException imageCaptureException) {
        Threads.checkMainThread();
        if (this.mIsAborted) {
            return;
        }
        checkOnImageCaptured();
        markComplete();
        onFailure(imageCaptureException);
    }

    @Override // androidx.camera.core.imagecapture.TakePictureCallback
    public boolean isAborted() {
        return this.mIsAborted;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureCallback
    public void onCaptureFailure(ImageCaptureException imageCaptureException) {
        Threads.checkMainThread();
        if (this.mIsAborted) {
            return;
        }
        if (this.mTakePictureRequest.decrementRetryCounter()) {
            this.mRetryControl.retryRequest(this.mTakePictureRequest);
        } else {
            onFailure(imageCaptureException);
        }
        markComplete();
        this.mCaptureCompleter.set(null);
    }

    void abortAndSendErrorToApp(ImageCaptureException imageCaptureException) {
        Threads.checkMainThread();
        if (this.mCompleteFuture.isDone()) {
            return;
        }
        abort();
        onFailure(imageCaptureException);
    }

    void abortSilentlyAndRetry() {
        Threads.checkMainThread();
        if (this.mCompleteFuture.isDone()) {
            return;
        }
        abort();
        this.mRetryControl.retryRequest(this.mTakePictureRequest);
    }

    private void abort() {
        Threads.checkMainThread();
        this.mIsAborted = true;
        ListenableFuture<Void> listenableFuture = this.mCaptureRequestFuture;
        Objects.requireNonNull(listenableFuture);
        listenableFuture.cancel(true);
        this.mCaptureCompleter.set(null);
        this.mCompleteCompleter.set(null);
    }

    ListenableFuture<Void> getCaptureFuture() {
        Threads.checkMainThread();
        return this.mCaptureFuture;
    }

    ListenableFuture<Void> getCompleteFuture() {
        Threads.checkMainThread();
        return this.mCompleteFuture;
    }

    private void checkOnImageCaptured() {
        Preconditions.checkState(this.mCaptureFuture.isDone(), "onImageCaptured() must be called before onFinalResult()");
    }

    private void markComplete() {
        Preconditions.checkState(!this.mCompleteFuture.isDone(), "The callback can only complete once.");
        this.mCompleteCompleter.set(null);
    }

    private void onFailure(ImageCaptureException imageCaptureException) {
        Threads.checkMainThread();
        this.mTakePictureRequest.onError(imageCaptureException);
    }
}
