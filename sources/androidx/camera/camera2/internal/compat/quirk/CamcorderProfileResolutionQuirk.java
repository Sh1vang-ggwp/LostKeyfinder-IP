package androidx.camera.camera2.internal.compat.quirk;

import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.util.Size;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Quirk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class CamcorderProfileResolutionQuirk implements Quirk {
    private static final String TAG = "CamcorderProfileResolutionQuirk";
    private final List<Size> mSupportedResolutions;

    static boolean load(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        Integer num = (Integer) cameraCharacteristicsCompat.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
        return num != null && num.intValue() == 2;
    }

    public CamcorderProfileResolutionQuirk(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        Size[] sizeArr;
        List<Size> emptyList;
        StreamConfigurationMap streamConfigurationMap = (StreamConfigurationMap) cameraCharacteristicsCompat.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
        if (streamConfigurationMap != null) {
            sizeArr = StreamConfigurationMapCompat.toStreamConfigurationMapCompat(streamConfigurationMap).getOutputSizes(34);
        } else {
            Logger.e(TAG, "StreamConfigurationMap is null");
            sizeArr = null;
        }
        if (sizeArr != null) {
            emptyList = Arrays.asList((Size[]) sizeArr.clone());
        } else {
            emptyList = Collections.emptyList();
        }
        this.mSupportedResolutions = emptyList;
        Logger.d(TAG, "mSupportedResolutions = " + emptyList);
    }

    public List<Size> getSupportedResolutions() {
        return new ArrayList(this.mSupportedResolutions);
    }
}
