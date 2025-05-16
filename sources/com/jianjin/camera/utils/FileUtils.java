package com.jianjin.camera.utils;

import android.os.Environment;
import com.jianjin.camera.CustomCameraAgent;
import java.io.File;

/* loaded from: classes.dex */
public class FileUtils {
    public static String getPhotoPathForLockWallPaper() {
        File file = new File(Environment.getExternalStorageDirectory().getAbsolutePath() + File.separator + CustomCameraAgent.picFileName);
        if (!file.getParentFile().exists()) {
            mkdir(file.getParentFile());
        }
        if (!file.exists()) {
            mkdir(file);
        }
        return Environment.getExternalStorageDirectory().getAbsolutePath() + File.separator + CustomCameraAgent.picFileName;
    }

    public static boolean mkdir(File file) {
        while (!file.getParentFile().exists()) {
            mkdir(file.getParentFile());
        }
        return file.mkdir();
    }
}
