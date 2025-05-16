package androidx.camera.camera2.internal.compat.quirk;

import android.os.Build;
import androidx.camera.core.impl.Quirk;

/* loaded from: classes.dex */
public class CaptureSessionOnClosedNotCalledQuirk implements Quirk {
    static boolean load() {
        return Build.VERSION.SDK_INT < 23;
    }
}
