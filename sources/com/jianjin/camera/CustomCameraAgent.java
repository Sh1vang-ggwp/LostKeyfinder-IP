package com.jianjin.camera;

import android.app.Application;
import android.content.Context;
import com.jianjin.camera.utils.UIUtils;

/* loaded from: classes.dex */
public class CustomCameraAgent {
    public static boolean isInit = false;
    public static boolean isShowLog = false;
    public static Context mContext = null;
    public static String picFileName = "photos";

    public static void setPicFileName(String str) {
    }

    public static void init(Application application) {
        mContext = application;
        UIUtils.init();
        isInit = true;
    }

    public static void openLog() {
        isShowLog = true;
    }

    public static void setCameraWidthAndHeight(int i, int i2) {
        UIUtils.setWidthAndHeight(i, i2);
    }
}
