package com.lenzetech.isearchingtwo.Utils;

import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import java.util.List;

/* loaded from: classes.dex */
public class MyClickMode {
    public static ClickMODE nowMode = ClickMODE.Normal;

    public static boolean isApplicationInBackground(Context context) {
        ComponentName componentName;
        List<ActivityManager.RunningTaskInfo> runningTasks = ((ActivityManager) context.getSystemService("activity")).getRunningTasks(1);
        return (runningTasks == null || runningTasks.isEmpty() || (componentName = runningTasks.get(0).topActivity) == null || componentName.getPackageName().equals(context.getPackageName())) ? false : true;
    }
}
