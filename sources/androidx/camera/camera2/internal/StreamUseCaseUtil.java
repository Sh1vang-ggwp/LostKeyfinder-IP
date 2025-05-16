package androidx.camera.camera2.internal;

import android.os.Build;
import androidx.camera.core.impl.ImageAnalysisConfig;
import androidx.camera.core.impl.ImageCaptureConfig;
import androidx.camera.core.impl.PreviewConfig;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseConfig;
import java.util.Collection;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class StreamUseCaseUtil {
    private StreamUseCaseUtil() {
    }

    public static long getStreamUseCaseFromUseCaseConfigs(Collection<UseCaseConfig<?>> collection, Collection<SessionConfig> collection2) {
        if (Build.VERSION.SDK_INT < 33) {
            return -1L;
        }
        if (collection.isEmpty()) {
            return 0L;
        }
        Iterator<SessionConfig> it = collection2.iterator();
        while (it.hasNext()) {
            if (it.next().getTemplateType() == 5) {
                return 0L;
            }
        }
        boolean z = false;
        boolean z2 = false;
        for (UseCaseConfig<?> useCaseConfig : collection) {
            if (useCaseConfig instanceof ImageAnalysisConfig) {
                return 0L;
            }
            if (useCaseConfig instanceof PreviewConfig) {
                z2 = true;
            } else if (useCaseConfig instanceof ImageCaptureConfig) {
                z = true;
            }
        }
        if (z) {
            return 2L;
        }
        return !z2 ? 0L : 1L;
    }
}
