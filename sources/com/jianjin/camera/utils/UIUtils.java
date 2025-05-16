package com.jianjin.camera.utils;

import android.util.DisplayMetrics;
import com.jianjin.camera.CustomCameraAgent;

/* loaded from: classes.dex */
public class UIUtils {
    public static int screenHeight;
    public static int screenWidth;

    public static void init() {
        DisplayMetrics displayMetrics = CustomCameraAgent.mContext.getResources().getDisplayMetrics();
        screenWidth = displayMetrics.widthPixels;
        screenHeight = displayMetrics.heightPixels;
    }

    public static void setWidthAndHeight(int i, int i2) {
        screenWidth = i;
        screenHeight = i2;
    }
}
