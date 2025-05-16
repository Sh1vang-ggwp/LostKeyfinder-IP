package androidx.camera.camera2.internal.compat.quirk;

import android.os.Build;
import androidx.camera.core.impl.Quirk;
import java.util.Locale;

/* loaded from: classes.dex */
public class ZslDisablerQuirk implements Quirk {
    static boolean load() {
        return isSamsungFold4();
    }

    private static boolean isSamsungFold4() {
        return "samsung".equalsIgnoreCase(Build.BRAND) && Build.MODEL.toUpperCase(Locale.US).startsWith("SM-F936");
    }
}
