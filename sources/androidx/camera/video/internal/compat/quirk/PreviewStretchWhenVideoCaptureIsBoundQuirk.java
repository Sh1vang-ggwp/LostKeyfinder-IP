package androidx.camera.video.internal.compat.quirk;

import android.os.Build;
import androidx.camera.core.impl.Quirk;
import com.lenzetech.isearchingtwo.activity.util.RomUtil;

/* loaded from: classes.dex */
public class PreviewStretchWhenVideoCaptureIsBoundQuirk implements Quirk {
    static boolean load() {
        return isHuaweiP8Lite() || isSamsungJ3() || isSamsungJ7() || isSamsungJ1AceNeo() || isOppoA37F();
    }

    private static boolean isHuaweiP8Lite() {
        return "HUAWEI".equalsIgnoreCase(Build.MANUFACTURER) && "HUAWEI ALE-L04".equalsIgnoreCase(Build.MODEL);
    }

    private static boolean isSamsungJ3() {
        return "Samsung".equalsIgnoreCase(Build.MANUFACTURER) && "sm-j320f".equalsIgnoreCase(Build.MODEL);
    }

    private static boolean isSamsungJ7() {
        return "Samsung".equalsIgnoreCase(Build.MANUFACTURER) && "sm-j700f".equalsIgnoreCase(Build.MODEL);
    }

    private static boolean isSamsungJ1AceNeo() {
        return "Samsung".equalsIgnoreCase(Build.MANUFACTURER) && "sm-j111f".equalsIgnoreCase(Build.MODEL);
    }

    private static boolean isOppoA37F() {
        return RomUtil.ROM_OPPO.equalsIgnoreCase(Build.MANUFACTURER) && "A37F".equalsIgnoreCase(Build.MODEL);
    }
}
