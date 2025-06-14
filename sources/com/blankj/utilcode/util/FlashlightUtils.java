package com.blankj.utilcode.util;

import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.util.Log;
import java.io.IOException;

/* loaded from: classes.dex */
public final class FlashlightUtils {
    private static Camera mCamera;
    private static SurfaceTexture mSurfaceTexture;

    private FlashlightUtils() {
        throw new UnsupportedOperationException("u can't instantiate me...");
    }

    public static boolean isFlashlightEnable() {
        return Utils.getApp().getPackageManager().hasSystemFeature("android.hardware.camera.flash");
    }

    public static boolean isFlashlightOn() {
        if (init()) {
            return "torch".equals(mCamera.getParameters().getFlashMode());
        }
        return false;
    }

    public static void setFlashlightStatus(boolean z) {
        if (init()) {
            Camera.Parameters parameters = mCamera.getParameters();
            if (z) {
                if ("torch".equals(parameters.getFlashMode())) {
                    return;
                }
                try {
                    mCamera.setPreviewTexture(mSurfaceTexture);
                    mCamera.startPreview();
                    parameters.setFlashMode("torch");
                    mCamera.setParameters(parameters);
                    return;
                } catch (IOException e) {
                    Log.e("FlashlightUtils", "setFlashlightStatusOn: ", e);
                    return;
                }
            }
            if ("off".equals(parameters.getFlashMode())) {
                return;
            }
            parameters.setFlashMode("off");
            mCamera.setParameters(parameters);
        }
    }

    public static void destroy() {
        Camera camera = mCamera;
        if (camera == null) {
            return;
        }
        camera.release();
        mSurfaceTexture = null;
        mCamera = null;
    }

    private static boolean init() {
        if (mCamera == null) {
            try {
                mCamera = Camera.open(0);
                mSurfaceTexture = new SurfaceTexture(0);
            } catch (Throwable th) {
                Log.e("FlashlightUtils", "init failed: ", th);
                return false;
            }
        }
        if (mCamera != null) {
            return true;
        }
        Log.e("FlashlightUtils", "init failed.");
        return false;
    }
}
