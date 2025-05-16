package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCaptureSession;
import androidx.camera.core.impl.CameraCaptureCallback;
import java.util.Objects;

/* loaded from: classes.dex */
final class CaptureCallbackContainer extends CameraCaptureCallback {
    private final CameraCaptureSession.CaptureCallback mCaptureCallback;

    private CaptureCallbackContainer(CameraCaptureSession.CaptureCallback captureCallback) {
        Objects.requireNonNull(captureCallback, "captureCallback is null");
        this.mCaptureCallback = captureCallback;
    }

    static CaptureCallbackContainer create(CameraCaptureSession.CaptureCallback captureCallback) {
        return new CaptureCallbackContainer(captureCallback);
    }

    CameraCaptureSession.CaptureCallback getCaptureCallback() {
        return this.mCaptureCallback;
    }
}
