package com.jianjin.camera;

import com.jianjin.camera.widget.CameraManager;

/* loaded from: classes.dex */
public enum FlashLightStatus {
    LIGHT_ON,
    LIGHT_OFF;

    public FlashLightStatus next() {
        FlashLightStatus flashLightStatus = values()[(ordinal() + 1) % values().length];
        return CameraManager.mFlashLightNotSupport.contains(flashLightStatus.name()) ? next() : flashLightStatus;
    }

    public static FlashLightStatus valueOf(int i) {
        return values()[i];
    }
}
