package androidx.camera.core.impl;

import android.hardware.camera2.CaptureResult;
import androidx.camera.core.CameraInfo;
import java.util.Map;

/* loaded from: classes.dex */
public interface SessionProcessor {

    /* renamed from: androidx.camera.core.impl.SessionProcessor$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static int $default$startTrigger(SessionProcessor _this, Config config, CaptureCallback captureCallback) {
            return -1;
        }
    }

    public interface CaptureCallback {

        /* renamed from: androidx.camera.core.impl.SessionProcessor$CaptureCallback$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static void $default$onCaptureCompleted(CaptureCallback _this, long j, int i, Map map) {
            }

            public static void $default$onCaptureFailed(CaptureCallback _this, int i) {
            }

            public static void $default$onCaptureProcessStarted(CaptureCallback _this, int i) {
            }

            public static void $default$onCaptureSequenceAborted(CaptureCallback _this, int i) {
            }

            public static void $default$onCaptureSequenceCompleted(CaptureCallback _this, int i) {
            }

            public static void $default$onCaptureStarted(CaptureCallback _this, int i, long j) {
            }
        }

        void onCaptureCompleted(long j, int i, Map<CaptureResult.Key, Object> map);

        void onCaptureFailed(int i);

        void onCaptureProcessStarted(int i);

        void onCaptureSequenceAborted(int i);

        void onCaptureSequenceCompleted(int i);

        void onCaptureStarted(int i, long j);
    }

    void abortCapture(int i);

    void deInitSession();

    SessionConfig initSession(CameraInfo cameraInfo, OutputSurface outputSurface, OutputSurface outputSurface2, OutputSurface outputSurface3);

    void onCaptureSessionEnd();

    void onCaptureSessionStart(RequestProcessor requestProcessor);

    void setParameters(Config config);

    int startCapture(CaptureCallback captureCallback);

    int startRepeating(CaptureCallback captureCallback);

    int startTrigger(Config config, CaptureCallback captureCallback);

    void stopRepeating();
}
