package com.jianjin.camera;

/* loaded from: classes.dex */
public enum CameraDirection {
    CAMERA_BACK,
    CAMERA_FRONT;

    public CameraDirection next() {
        int ordinal = ordinal();
        return values()[(ordinal + 1) % values().length];
    }

    public static CameraDirection valueOf(int i) {
        return values()[i];
    }
}
