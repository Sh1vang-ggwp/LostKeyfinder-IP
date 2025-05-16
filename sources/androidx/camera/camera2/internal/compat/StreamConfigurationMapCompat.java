package androidx.camera.camera2.internal.compat;

import android.hardware.camera2.params.StreamConfigurationMap;
import android.os.Build;
import android.util.Size;

/* loaded from: classes.dex */
public class StreamConfigurationMapCompat {
    private final StreamConfigurationMapCompatImpl mImpl;

    interface StreamConfigurationMapCompatImpl {
        Size[] getOutputSizes(int i);

        <T> Size[] getOutputSizes(Class<T> cls);
    }

    private StreamConfigurationMapCompat(StreamConfigurationMap streamConfigurationMap) {
        if (Build.VERSION.SDK_INT >= 23) {
            this.mImpl = new StreamConfigurationMapCompatApi23Impl(streamConfigurationMap);
        } else {
            this.mImpl = new StreamConfigurationMapCompatBaseImpl(streamConfigurationMap);
        }
    }

    public static StreamConfigurationMapCompat toStreamConfigurationMapCompat(StreamConfigurationMap streamConfigurationMap) {
        return new StreamConfigurationMapCompat(streamConfigurationMap);
    }

    public Size[] getOutputSizes(int i) {
        return this.mImpl.getOutputSizes(i);
    }

    public <T> Size[] getOutputSizes(Class<T> cls) {
        return this.mImpl.getOutputSizes(cls);
    }
}
