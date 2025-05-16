package com.blankj.utilcode.util;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Environment;
import android.os.Process;
import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.lang.Thread;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;

/* loaded from: classes.dex */
public final class CrashUtils {
    private static final Thread.UncaughtExceptionHandler DEFAULT_UNCAUGHT_EXCEPTION_HANDLER;
    private static final String FILE_SEP = System.getProperty("file.separator");
    private static final Format FORMAT = new SimpleDateFormat("MM-dd HH-mm-ss");
    private static final Thread.UncaughtExceptionHandler UNCAUGHT_EXCEPTION_HANDLER;
    private static String defaultDir;
    private static String dir;
    private static OnCrashListener sOnCrashListener;
    private static int versionCode;
    private static String versionName;

    public interface OnCrashListener {
        void onCrash(String str, Throwable th);
    }

    static {
        try {
            PackageInfo packageInfo = Utils.getApp().getPackageManager().getPackageInfo(Utils.getApp().getPackageName(), 0);
            if (packageInfo != null) {
                versionName = packageInfo.versionName;
                versionCode = packageInfo.versionCode;
            }
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        DEFAULT_UNCAUGHT_EXCEPTION_HANDLER = Thread.getDefaultUncaughtExceptionHandler();
        UNCAUGHT_EXCEPTION_HANDLER = new Thread.UncaughtExceptionHandler() { // from class: com.blankj.utilcode.util.CrashUtils.1
            @Override // java.lang.Thread.UncaughtExceptionHandler
            public void uncaughtException(Thread thread, Throwable th) {
                if (th == null) {
                    if (CrashUtils.DEFAULT_UNCAUGHT_EXCEPTION_HANDLER != null) {
                        CrashUtils.DEFAULT_UNCAUGHT_EXCEPTION_HANDLER.uncaughtException(thread, null);
                        return;
                    } else {
                        Process.killProcess(Process.myPid());
                        System.exit(1);
                        return;
                    }
                }
                String format = CrashUtils.FORMAT.format(new Date(System.currentTimeMillis()));
                StringBuilder sb = new StringBuilder();
                sb.append("************* Log Head ****************\nTime Of Crash      : " + format + "\nDevice Manufacturer: " + Build.MANUFACTURER + "\nDevice Model       : " + Build.MODEL + "\nAndroid Version    : " + Build.VERSION.RELEASE + "\nAndroid SDK        : " + Build.VERSION.SDK_INT + "\nApp VersionName    : " + CrashUtils.versionName + "\nApp VersionCode    : " + CrashUtils.versionCode + "\n************* Log Head ****************\n\n");
                sb.append(ThrowableUtils.getFullStackTrace(th));
                String sb2 = sb.toString();
                StringBuilder sb3 = new StringBuilder();
                sb3.append(CrashUtils.dir == null ? CrashUtils.defaultDir : CrashUtils.dir);
                sb3.append(format);
                sb3.append(".txt");
                String sb4 = sb3.toString();
                if (CrashUtils.createOrExistsFile(sb4)) {
                    CrashUtils.input2File(sb2, sb4);
                } else {
                    Log.e("CrashUtils", "create " + sb4 + " failed!");
                }
                if (CrashUtils.sOnCrashListener != null) {
                    CrashUtils.sOnCrashListener.onCrash(sb2, th);
                }
                if (CrashUtils.DEFAULT_UNCAUGHT_EXCEPTION_HANDLER != null) {
                    CrashUtils.DEFAULT_UNCAUGHT_EXCEPTION_HANDLER.uncaughtException(thread, th);
                }
            }
        };
    }

    private CrashUtils() {
        throw new UnsupportedOperationException("u can't instantiate me...");
    }

    public static void init() {
        init("");
    }

    public static void init(File file) {
        Objects.requireNonNull(file, "Argument 'crashDir' of type File (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it");
        init(file.getAbsolutePath(), (OnCrashListener) null);
    }

    public static void init(String str) {
        init(str, (OnCrashListener) null);
    }

    public static void init(OnCrashListener onCrashListener) {
        init("", onCrashListener);
    }

    public static void init(File file, OnCrashListener onCrashListener) {
        Objects.requireNonNull(file, "Argument 'crashDir' of type File (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it");
        init(file.getAbsolutePath(), onCrashListener);
    }

    public static void init(String str, OnCrashListener onCrashListener) {
        if (isSpace(str)) {
            dir = null;
        } else {
            String str2 = FILE_SEP;
            if (!str.endsWith(str2)) {
                str = str + str2;
            }
            dir = str;
        }
        if ("mounted".equals(Environment.getExternalStorageState()) && Utils.getApp().getExternalCacheDir() != null) {
            StringBuilder sb = new StringBuilder();
            sb.append(Utils.getApp().getExternalCacheDir());
            String str3 = FILE_SEP;
            sb.append(str3);
            sb.append("crash");
            sb.append(str3);
            defaultDir = sb.toString();
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(Utils.getApp().getCacheDir());
            String str4 = FILE_SEP;
            sb2.append(str4);
            sb2.append("crash");
            sb2.append(str4);
            defaultDir = sb2.toString();
        }
        sOnCrashListener = onCrashListener;
        Thread.setDefaultUncaughtExceptionHandler(UNCAUGHT_EXCEPTION_HANDLER);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void input2File(final String str, final String str2) {
        try {
            if (((Boolean) Executors.newSingleThreadExecutor().submit(new Callable<Boolean>() { // from class: com.blankj.utilcode.util.CrashUtils.2
                /* JADX WARN: Can't rename method to resolve collision */
                /* JADX WARN: Removed duplicated region for block: B:27:0x0041 A[EXC_TOP_SPLITTER, SYNTHETIC] */
                @Override // java.util.concurrent.Callable
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct code enable 'Show inconsistent code' option in preferences
                */
                public java.lang.Boolean call() {
                    /*
                        r6 = this;
                        r0 = 0
                        java.io.BufferedWriter r1 = new java.io.BufferedWriter     // Catch: java.lang.Throwable -> L22 java.io.IOException -> L27
                        java.io.FileWriter r2 = new java.io.FileWriter     // Catch: java.lang.Throwable -> L22 java.io.IOException -> L27
                        java.lang.String r3 = r1     // Catch: java.lang.Throwable -> L22 java.io.IOException -> L27
                        r4 = 1
                        r2.<init>(r3, r4)     // Catch: java.lang.Throwable -> L22 java.io.IOException -> L27
                        r1.<init>(r2)     // Catch: java.lang.Throwable -> L22 java.io.IOException -> L27
                        java.lang.String r0 = r2     // Catch: java.io.IOException -> L20 java.lang.Throwable -> L3e
                        r1.write(r0)     // Catch: java.io.IOException -> L20 java.lang.Throwable -> L3e
                        java.lang.Boolean r0 = java.lang.Boolean.valueOf(r4)     // Catch: java.io.IOException -> L20 java.lang.Throwable -> L3e
                        r1.close()     // Catch: java.io.IOException -> L1b
                        goto L1f
                    L1b:
                        r1 = move-exception
                        r1.printStackTrace()
                    L1f:
                        return r0
                    L20:
                        r0 = move-exception
                        goto L2b
                    L22:
                        r1 = move-exception
                        r5 = r1
                        r1 = r0
                        r0 = r5
                        goto L3f
                    L27:
                        r1 = move-exception
                        r5 = r1
                        r1 = r0
                        r0 = r5
                    L2b:
                        r0.printStackTrace()     // Catch: java.lang.Throwable -> L3e
                        r0 = 0
                        java.lang.Boolean r0 = java.lang.Boolean.valueOf(r0)     // Catch: java.lang.Throwable -> L3e
                        if (r1 == 0) goto L3d
                        r1.close()     // Catch: java.io.IOException -> L39
                        goto L3d
                    L39:
                        r1 = move-exception
                        r1.printStackTrace()
                    L3d:
                        return r0
                    L3e:
                        r0 = move-exception
                    L3f:
                        if (r1 == 0) goto L49
                        r1.close()     // Catch: java.io.IOException -> L45
                        goto L49
                    L45:
                        r1 = move-exception
                        r1.printStackTrace()
                    L49:
                        throw r0
                    */
                    throw new UnsupportedOperationException("Method not decompiled: com.blankj.utilcode.util.CrashUtils.AnonymousClass2.call():java.lang.Boolean");
                }
            }).get()).booleanValue()) {
                return;
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e2) {
            e2.printStackTrace();
        }
        Log.e("CrashUtils", "write crash info to " + str2 + " failed!");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean createOrExistsFile(String str) {
        File file = new File(str);
        if (file.exists()) {
            return file.isFile();
        }
        if (!createOrExistsDir(file.getParentFile())) {
            return false;
        }
        try {
            return file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static boolean createOrExistsDir(File file) {
        return file != null && (!file.exists() ? !file.mkdirs() : !file.isDirectory());
    }

    private static boolean isSpace(String str) {
        if (str == null) {
            return true;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isWhitespace(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }
}
