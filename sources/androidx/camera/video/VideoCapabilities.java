package androidx.camera.video;

import android.util.Size;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CamcorderProfileProvider;
import androidx.camera.core.impl.CamcorderProfileProxy;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.video.Quality;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.VideoQualityQuirk;
import androidx.core.util.Preconditions;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes.dex */
public final class VideoCapabilities {
    private static final String TAG = "VideoCapabilities";
    private final CamcorderProfileProxy mHighestProfile;
    private final CamcorderProfileProxy mLowestProfile;
    private final Map<Quality, CamcorderProfileProxy> mSupportedProfileMap = new LinkedHashMap();
    private final TreeMap<Size, Quality> mAreaSortedSizeToQualityMap = new TreeMap<>(new CompareSizesByArea());

    VideoCapabilities(CameraInfoInternal cameraInfoInternal) {
        CamcorderProfileProvider camcorderProfileProvider = cameraInfoInternal.getCamcorderProfileProvider();
        for (Quality quality : Quality.getSortedQualities()) {
            Preconditions.checkState(quality instanceof Quality.ConstantQuality, "Currently only support ConstantQuality");
            int value = ((Quality.ConstantQuality) quality).getValue();
            if (camcorderProfileProvider.hasProfile(value) && isDeviceValidQuality(cameraInfoInternal, quality)) {
                CamcorderProfileProxy camcorderProfileProxy = (CamcorderProfileProxy) Preconditions.checkNotNull(camcorderProfileProvider.get(value));
                Size size = new Size(camcorderProfileProxy.getVideoFrameWidth(), camcorderProfileProxy.getVideoFrameHeight());
                Logger.d(TAG, "profile = " + camcorderProfileProxy);
                this.mSupportedProfileMap.put(quality, camcorderProfileProxy);
                this.mAreaSortedSizeToQualityMap.put(size, quality);
            }
        }
        if (this.mSupportedProfileMap.isEmpty()) {
            Logger.e(TAG, "No supported CamcorderProfile");
            this.mLowestProfile = null;
            this.mHighestProfile = null;
        } else {
            ArrayDeque arrayDeque = new ArrayDeque(this.mSupportedProfileMap.values());
            this.mHighestProfile = (CamcorderProfileProxy) arrayDeque.peekFirst();
            this.mLowestProfile = (CamcorderProfileProxy) arrayDeque.peekLast();
        }
    }

    public static VideoCapabilities from(CameraInfo cameraInfo) {
        return new VideoCapabilities((CameraInfoInternal) cameraInfo);
    }

    public List<Quality> getSupportedQualities() {
        return new ArrayList(this.mSupportedProfileMap.keySet());
    }

    public boolean isQualitySupported(Quality quality) {
        checkQualityConstantsOrThrow(quality);
        return getProfile(quality) != null;
    }

    public CamcorderProfileProxy getProfile(Quality quality) {
        checkQualityConstantsOrThrow(quality);
        if (quality == Quality.HIGHEST) {
            return this.mHighestProfile;
        }
        if (quality == Quality.LOWEST) {
            return this.mLowestProfile;
        }
        return this.mSupportedProfileMap.get(quality);
    }

    public CamcorderProfileProxy findHighestSupportedCamcorderProfileFor(Size size) {
        Quality findHighestSupportedQualityFor = findHighestSupportedQualityFor(size);
        Logger.d(TAG, "Using supported quality of " + findHighestSupportedQualityFor + " for size " + size);
        if (findHighestSupportedQualityFor == Quality.NONE) {
            return null;
        }
        CamcorderProfileProxy profile = getProfile(findHighestSupportedQualityFor);
        if (profile != null) {
            return profile;
        }
        throw new AssertionError("Camera advertised available quality but did not produce CamcorderProfile for advertised quality.");
    }

    public Quality findHighestSupportedQualityFor(Size size) {
        Map.Entry<Size, Quality> ceilingEntry = this.mAreaSortedSizeToQualityMap.ceilingEntry(size);
        if (ceilingEntry != null) {
            return ceilingEntry.getValue();
        }
        Map.Entry<Size, Quality> floorEntry = this.mAreaSortedSizeToQualityMap.floorEntry(size);
        if (floorEntry != null) {
            return floorEntry.getValue();
        }
        return Quality.NONE;
    }

    private static void checkQualityConstantsOrThrow(Quality quality) {
        Preconditions.checkArgument(Quality.containsQuality(quality), "Unknown quality: " + quality);
    }

    private boolean isDeviceValidQuality(CameraInfoInternal cameraInfoInternal, Quality quality) {
        for (VideoQualityQuirk videoQualityQuirk : DeviceQuirks.getAll(VideoQualityQuirk.class)) {
            if (videoQualityQuirk != null && videoQualityQuirk.isProblematicVideoQuality(cameraInfoInternal, quality) && !videoQualityQuirk.workaroundBySurfaceProcessing()) {
                return false;
            }
        }
        return true;
    }
}
