package com.lenzetech.isearchingtwo.AudioToolsUtils;

import android.app.Activity;
import android.app.AppOpsManager;
import android.content.Context;
import android.os.Build;
import android.util.Log;
import androidx.core.app.ActivityCompat;
import java.util.ArrayList;

/* loaded from: classes.dex */
public class PermissionUtil {
    private static final String TAG = "PermissionUtil";

    public static int requestPermissions(Context context, String[] strArr, int i) {
        if (Build.VERSION.SDK_INT >= 23) {
            ArrayList arrayList = new ArrayList();
            for (int i2 = 0; i2 < strArr.length; i2++) {
                if (ActivityCompat.checkSelfPermission(context, strArr[i2]) != 0) {
                    arrayList.add(strArr[i2]);
                }
            }
            if (arrayList.size() > 0) {
                ActivityCompat.requestPermissions((Activity) context, (String[]) arrayList.toArray(new String[arrayList.size()]), i);
                return arrayList.size();
            }
        }
        return 0;
    }

    public static boolean isHasSystemAlertWindow(Context context) {
        return ActivityCompat.checkSelfPermission(context, "android.permission.SYSTEM_ALERT_WINDOW") == 0;
    }

    public static void requestSDCardWrite(Context context) {
        if (Build.VERSION.SDK_INT < 23 || isHasSDCardWritePermission(context)) {
            return;
        }
        ActivityCompat.requestPermissions((Activity) context, PermissionManager.PERMISSION_SD_WRITE, 101);
    }

    public static boolean isHasSDCardWritePermission(Context context) {
        return ActivityCompat.checkSelfPermission(context, "android.permission.WRITE_EXTERNAL_STORAGE") == 0;
    }

    public static void requestLocationPermission(Context context) {
        if (Build.VERSION.SDK_INT < 23 || isHasLocationPermission(context)) {
            return;
        }
        ActivityCompat.requestPermissions((Activity) context, PermissionManager.PERMISSION_LOCATION, 102);
    }

    public static boolean isHasLocationPermission(Context context) {
        return ActivityCompat.checkSelfPermission(context, "android.permission.ACCESS_COARSE_LOCATION") == 0;
    }

    public static boolean isHasCameraPermission(Context context) {
        return ActivityCompat.checkSelfPermission(context, "android.permission.CAMERA") == 0;
    }

    public static void requestCameraPermission(Context context) {
        if (Build.VERSION.SDK_INT < 23 || isHasCameraPermission(context)) {
            return;
        }
        Log.d(TAG, "requestCameraPermission: ----->true");
        try {
            ActivityCompat.requestPermissions((Activity) context, PermissionManager.PERMISSION_CAMERA, 103);
        } catch (Exception unused) {
        }
    }

    public static void requestRecordPermission(Context context) {
        if (Build.VERSION.SDK_INT < 23 || isHasRecordPermission(context)) {
            return;
        }
        ActivityCompat.requestPermissions((Activity) context, PermissionManager.PERMISSION_RECORD, 104);
    }

    public static boolean isHasRecordPermission(Context context) {
        return ActivityCompat.checkSelfPermission(context, "android.permission.RECORD_AUDIO") == 0;
    }

    public static boolean isHasReadPhonePermission(Context context) {
        return ActivityCompat.checkSelfPermission(context, "android.permission.READ_PHONE_STATE") == 0;
    }

    public static void requestReadPhonePermission(Context context) {
        if (Build.VERSION.SDK_INT < 23 || isHasReadPhonePermission(context)) {
            return;
        }
        ActivityCompat.requestPermissions((Activity) context, PermissionManager.PERMISSION_READ_PHONE, 105);
    }

    public static boolean isNotificationEnabled(Context context) {
        if (Build.VERSION.SDK_INT < 19) {
            return true;
        }
        try {
            AppOpsManager appOpsManager = (AppOpsManager) context.getSystemService("appops");
            Class<?> cls = Class.forName(AppOpsManager.class.getName());
            return ((Integer) cls.getMethod("checkOpNoThrow", Integer.TYPE, Integer.TYPE, String.class).invoke(appOpsManager, Integer.valueOf(((Integer) cls.getDeclaredField("OP_POST_NOTIFICATION").get(Integer.class)).intValue()), Integer.valueOf(context.getApplicationInfo().uid), context.getApplicationContext().getPackageName())).intValue() == 0;
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }
}
