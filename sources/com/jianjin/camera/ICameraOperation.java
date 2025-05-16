package com.jianjin.camera;

import com.jianjin.camera.widget.ISavePicCallback;

/* loaded from: classes.dex */
public interface ICameraOperation {
    int getMaxZoom();

    int getZoom();

    void releaseCamera();

    void setZoom(int i);

    void switchCamera();

    void switchFlashMode();

    boolean takePicture(ISavePicCallback iSavePicCallback);
}
