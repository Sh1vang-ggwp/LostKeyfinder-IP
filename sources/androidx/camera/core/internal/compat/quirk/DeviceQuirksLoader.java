package androidx.camera.core.internal.compat.quirk;

import androidx.camera.core.impl.Quirk;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class DeviceQuirksLoader {
    private DeviceQuirksLoader() {
    }

    static List<Quirk> loadQuirks() {
        ArrayList arrayList = new ArrayList();
        if (ImageCaptureRotationOptionQuirk.load()) {
            arrayList.add(new ImageCaptureRotationOptionQuirk());
        }
        if (SurfaceOrderQuirk.load()) {
            arrayList.add(new SurfaceOrderQuirk());
        }
        if (CaptureFailedRetryQuirk.load()) {
            arrayList.add(new CaptureFailedRetryQuirk());
        }
        if (LowMemoryQuirk.load()) {
            arrayList.add(new LowMemoryQuirk());
        }
        return arrayList;
    }
}
