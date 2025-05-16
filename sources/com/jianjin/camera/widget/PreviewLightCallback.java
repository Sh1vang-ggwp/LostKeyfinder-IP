package com.jianjin.camera.widget;

import android.hardware.Camera;
import com.jianjin.camera.utils.Logger;

/* loaded from: classes.dex */
public class PreviewLightCallback implements Camera.PreviewCallback {
    private static final String TAG = "PreviewLightCallback";
    private CameraManager cameraManager;
    private OnCameraLightCallback onCameraLightCallback;
    private long lastRecordTime = System.currentTimeMillis();
    private int darkIndex = 0;
    private long[] darkList = {255, 255, 255, 255};
    private int waitScanTime = 300;
    private int darkValue = 60;

    public interface OnCameraLightCallback {
        void cameraLight(boolean z);
    }

    public PreviewLightCallback(CameraManager cameraManager, OnCameraLightCallback onCameraLightCallback) {
        this.cameraManager = cameraManager;
        this.onCameraLightCallback = onCameraLightCallback;
    }

    @Override // android.hardware.Camera.PreviewCallback
    public void onPreviewFrame(byte[] bArr, Camera camera) {
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.lastRecordTime < this.waitScanTime) {
            return;
        }
        this.lastRecordTime = currentTimeMillis;
        long j = 0;
        long j2 = camera.getParameters().getPreviewSize().width * camera.getParameters().getPreviewSize().height;
        if (Math.abs(bArr.length - (j2 * 1.5f)) < 1.0E-5f) {
            for (int i = 0; i < j2; i += 10) {
                j += bArr[i] & 255;
            }
            long j3 = j / (j2 / 10);
            long[] jArr = this.darkList;
            int length = jArr.length;
            int i2 = this.darkIndex % length;
            this.darkIndex = i2;
            jArr[i2] = j3;
            boolean z = true;
            this.darkIndex = i2 + 1;
            for (int i3 = 0; i3 < length; i3++) {
                if (this.darkList[i3] > this.darkValue) {
                    z = false;
                }
            }
            Logger.debug(TAG, "摄像头环境亮度为 ： " + j3);
            OnCameraLightCallback onCameraLightCallback = this.onCameraLightCallback;
            if (onCameraLightCallback != null) {
                onCameraLightCallback.cameraLight(z);
            }
        }
    }
}
