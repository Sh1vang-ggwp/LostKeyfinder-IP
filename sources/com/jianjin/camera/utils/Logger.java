package com.jianjin.camera.utils;

import android.text.TextUtils;
import android.util.Log;
import com.jianjin.camera.BuildConfig;
import com.jianjin.camera.CustomCameraAgent;

/* loaded from: classes.dex */
public class Logger {
    public static void debug(String str, String str2) {
        if (CustomCameraAgent.isShowLog) {
            if (TextUtils.isEmpty(str)) {
                str = BuildConfig.APPLICATION_ID;
            }
            Log.d(str, str2);
        }
    }

    public static void info(String str, String str2) {
        if (CustomCameraAgent.isShowLog) {
            if (TextUtils.isEmpty(str)) {
                str = BuildConfig.APPLICATION_ID;
            }
            Log.i(str, str2);
        }
    }

    public static void warning(String str, String str2) {
        if (CustomCameraAgent.isShowLog) {
            if (TextUtils.isEmpty(str)) {
                str = BuildConfig.APPLICATION_ID;
            }
            Log.w(str, str2);
        }
    }

    public static void error(String str, String str2) {
        if (CustomCameraAgent.isShowLog) {
            if (TextUtils.isEmpty(str)) {
                str = BuildConfig.APPLICATION_ID;
            }
            Log.e(str, str2);
        }
    }
}
