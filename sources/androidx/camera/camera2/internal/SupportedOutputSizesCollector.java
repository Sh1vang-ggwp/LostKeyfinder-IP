package androidx.camera.camera2.internal;

import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.os.Build;
import android.util.Rational;
import android.util.Size;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.camera2.internal.compat.workaround.ExcludedSupportedSizesContainer;
import androidx.camera.camera2.internal.compat.workaround.ResolutionCorrector;
import androidx.camera.camera2.internal.compat.workaround.TargetAspectRatio;
import androidx.camera.core.Logger;
import androidx.camera.core.ResolutionSelector;
import androidx.camera.core.impl.SizeCoordinate;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.utils.AspectRatioUtil;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
final class SupportedOutputSizesCollector {
    private static final String TAG = "SupportedOutputSizesCollector";
    private final Size mActiveArraySize;
    private final String mCameraId;
    private final CameraCharacteristicsCompat mCharacteristics;
    private final DisplayInfoManager mDisplayInfoManager;
    private final ExcludedSupportedSizesContainer mExcludedSupportedSizesContainer;
    private final boolean mIsSensorLandscapeResolution;
    private final int mLensFacing;
    private final int mSensorOrientation;
    private final ResolutionCorrector mResolutionCorrector = new ResolutionCorrector();
    private final Map<Integer, Size[]> mOutputSizesCache = new HashMap();
    private final Map<Integer, Size[]> mHighResolutionOutputSizesCache = new HashMap();
    private final Map<Integer, Size> mMaxSizeCache = new HashMap();
    private final Map<Integer, List<Size>> mExcludedSizeListCache = new HashMap();
    private final boolean mIsBurstCaptureSupported = isBurstCaptureSupported();

    SupportedOutputSizesCollector(String str, CameraCharacteristicsCompat cameraCharacteristicsCompat, DisplayInfoManager displayInfoManager) {
        this.mCameraId = str;
        this.mCharacteristics = cameraCharacteristicsCompat;
        this.mDisplayInfoManager = displayInfoManager;
        this.mExcludedSupportedSizesContainer = new ExcludedSupportedSizesContainer(str);
        this.mIsSensorLandscapeResolution = isSensorLandscapeResolution(cameraCharacteristicsCompat);
        Rect rect = (Rect) cameraCharacteristicsCompat.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE);
        this.mActiveArraySize = rect != null ? new Size(rect.width(), rect.height()) : null;
        this.mSensorOrientation = ((Integer) cameraCharacteristicsCompat.get(CameraCharacteristics.SENSOR_ORIENTATION)).intValue();
        this.mLensFacing = ((Integer) cameraCharacteristicsCompat.get(CameraCharacteristics.LENS_FACING)).intValue();
    }

    List<Size> getSupportedOutputSizes(ResolutionSelector resolutionSelector, int i, Size size, boolean z, Size[] sizeArr) {
        return this.mResolutionCorrector.insertOrPrioritize(SurfaceConfig.getConfigType(i), sortResolutionCandidateListByResolutionSelector(filterOutResolutionCandidateListBySettings(collectResolutionCandidateList(resolutionSelector, i, z, sizeArr), resolutionSelector, i), resolutionSelector, this.mDisplayInfoManager.getMaxSizeDisplay().getRotation(), size));
    }

    private List<Size> collectResolutionCandidateList(ResolutionSelector resolutionSelector, int i, boolean z, Size[] sizeArr) {
        if (sizeArr == null) {
            sizeArr = getAllOutputSizesByFormat(i, !z && resolutionSelector.isHighResolutionEnabled());
        }
        Arrays.sort(sizeArr, new CompareSizesByArea(true));
        List<Size> asList = Arrays.asList(sizeArr);
        if (asList.isEmpty()) {
            throw new IllegalArgumentException("Resolution candidate list is empty when collecting by the settings!");
        }
        return asList;
    }

    private List<Size> filterOutResolutionCandidateListBySettings(List<Size> list, ResolutionSelector resolutionSelector, int i) {
        ArrayList arrayList;
        Size maxResolution = resolutionSelector.getMaxResolution();
        if (maxResolution == null) {
            arrayList = new ArrayList(list);
        } else {
            ArrayList arrayList2 = new ArrayList();
            for (Size size : list) {
                if (!SizeUtil.isLongerInAnyEdge(size, maxResolution)) {
                    arrayList2.add(size);
                }
            }
            arrayList = arrayList2;
        }
        List<Size> excludeProblematicSizes = excludeProblematicSizes(arrayList, i);
        if (excludeProblematicSizes.isEmpty()) {
            throw new IllegalArgumentException("Resolution candidate list is empty after filtering out by the settings!");
        }
        return excludeProblematicSizes;
    }

    private List<Size> sortResolutionCandidateListByResolutionSelector(List<Size> list, ResolutionSelector resolutionSelector, int i, Size size) {
        Rational targetAspectRatioByResolutionSelector = getTargetAspectRatioByResolutionSelector(resolutionSelector);
        Preconditions.checkNotNull(targetAspectRatioByResolutionSelector, "ResolutionSelector should also have aspect ratio value.");
        Size targetSizeByResolutionSelector = getTargetSizeByResolutionSelector(resolutionSelector, i, this.mSensorOrientation, this.mLensFacing);
        List<Size> sortResolutionCandidateListByTargetAspectRatioAndSize = sortResolutionCandidateListByTargetAspectRatioAndSize(list, targetAspectRatioByResolutionSelector, size);
        if (sortResolutionCandidateListByTargetAspectRatioAndSize.contains(targetSizeByResolutionSelector) && canResolutionBeMovedToHead(targetSizeByResolutionSelector)) {
            sortResolutionCandidateListByTargetAspectRatioAndSize.remove(targetSizeByResolutionSelector);
            sortResolutionCandidateListByTargetAspectRatioAndSize.add(0, targetSizeByResolutionSelector);
        }
        return sortResolutionCandidateListByTargetAspectRatioAndSize;
    }

    private Size[] getAllOutputSizesByFormat(int i, boolean z) {
        Size[] sizeArr = this.mOutputSizesCache.get(Integer.valueOf(i));
        if (sizeArr == null) {
            sizeArr = doGetOutputSizesByFormat(i);
            this.mOutputSizesCache.put(Integer.valueOf(i), sizeArr);
        }
        Size[] sizeArr2 = null;
        if (z && this.mIsBurstCaptureSupported && (sizeArr2 = this.mHighResolutionOutputSizesCache.get(Integer.valueOf(i))) == null && !this.mHighResolutionOutputSizesCache.containsKey(Integer.valueOf(i))) {
            sizeArr2 = doGetHighResolutionOutputSizesByFormat(i);
            this.mHighResolutionOutputSizesCache.put(Integer.valueOf(i), sizeArr2);
        }
        if (sizeArr2 == null) {
            return sizeArr;
        }
        Size[] sizeArr3 = (Size[]) Arrays.copyOf(sizeArr2, sizeArr2.length + sizeArr.length);
        System.arraycopy(sizeArr, 0, sizeArr3, sizeArr2.length, sizeArr.length);
        return sizeArr3;
    }

    private Size[] doGetOutputSizesByFormat(int i) {
        StreamConfigurationMap streamConfigurationMap = (StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
        if (streamConfigurationMap == null) {
            throw new IllegalArgumentException("Can not retrieve SCALER_STREAM_CONFIGURATION_MAP");
        }
        Size[] outputSizes = StreamConfigurationMapCompat.toStreamConfigurationMapCompat(streamConfigurationMap).getOutputSizes(i);
        if (outputSizes != null) {
            return outputSizes;
        }
        throw new IllegalArgumentException("Can not get supported output size for the format: " + i);
    }

    private Size[] doGetHighResolutionOutputSizesByFormat(int i) {
        if (Build.VERSION.SDK_INT < 23) {
            return null;
        }
        StreamConfigurationMap streamConfigurationMap = (StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
        if (streamConfigurationMap == null) {
            throw new IllegalArgumentException("Can not retrieve SCALER_STREAM_CONFIGURATION_MAP");
        }
        return Api23Impl.getHighResolutionOutputSizes(streamConfigurationMap, i);
    }

    private Rational getTargetAspectRatioByResolutionSelector(ResolutionSelector resolutionSelector) {
        Rational rational;
        Rational targetAspectRatioFromQuirk = getTargetAspectRatioFromQuirk();
        if (targetAspectRatioFromQuirk != null) {
            return targetAspectRatioFromQuirk;
        }
        int preferredAspectRatio = resolutionSelector.getPreferredAspectRatio();
        if (preferredAspectRatio == 0) {
            rational = this.mIsSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_4_3 : AspectRatioUtil.ASPECT_RATIO_3_4;
        } else if (preferredAspectRatio == 1) {
            rational = this.mIsSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_16_9 : AspectRatioUtil.ASPECT_RATIO_9_16;
        } else {
            Logger.e(TAG, "Undefined target aspect ratio: " + preferredAspectRatio);
            return targetAspectRatioFromQuirk;
        }
        return rational;
    }

    private Rational getTargetAspectRatioFromQuirk() {
        int i = new TargetAspectRatio().get(this.mCameraId, this.mCharacteristics);
        if (i == 0) {
            return this.mIsSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_4_3 : AspectRatioUtil.ASPECT_RATIO_3_4;
        }
        if (i == 1) {
            return this.mIsSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_16_9 : AspectRatioUtil.ASPECT_RATIO_9_16;
        }
        if (i != 2) {
            return null;
        }
        Size fetchMaxNormalOutputSize = fetchMaxNormalOutputSize(256);
        return new Rational(fetchMaxNormalOutputSize.getWidth(), fetchMaxNormalOutputSize.getHeight());
    }

    static Size getTargetSizeByResolutionSelector(ResolutionSelector resolutionSelector, int i, int i2, int i3) {
        Size preferredResolution = resolutionSelector.getPreferredResolution();
        return resolutionSelector.getSizeCoordinate() == SizeCoordinate.ANDROID_VIEW ? flipSizeByRotation(preferredResolution, i, i3, i2) : preferredResolution;
    }

    private static boolean isRotationNeeded(int i, int i2, int i3) {
        int relativeImageRotation = CameraOrientationUtil.getRelativeImageRotation(CameraOrientationUtil.surfaceRotationToDegrees(i), i3, 1 == i2);
        return relativeImageRotation == 90 || relativeImageRotation == 270;
    }

    private List<Size> excludeProblematicSizes(List<Size> list, int i) {
        list.removeAll(fetchExcludedSizes(i));
        return list;
    }

    private List<Size> fetchExcludedSizes(int i) {
        List<Size> list = this.mExcludedSizeListCache.get(Integer.valueOf(i));
        if (list != null) {
            return list;
        }
        List<Size> list2 = this.mExcludedSupportedSizesContainer.get(i);
        this.mExcludedSizeListCache.put(Integer.valueOf(i), list2);
        return list2;
    }

    private List<Size> sortResolutionCandidateListByTargetAspectRatioAndSize(List<Size> list, Rational rational, Size size) {
        Map<Rational, List<Size>> groupSizesByAspectRatio = groupSizesByAspectRatio(list);
        if (size != null) {
            Iterator<Rational> it = groupSizesByAspectRatio.keySet().iterator();
            while (it.hasNext()) {
                removeSupportedSizesByMiniBoundingSize(groupSizesByAspectRatio.get(it.next()), size);
            }
        }
        ArrayList arrayList = new ArrayList(groupSizesByAspectRatio.keySet());
        Collections.sort(arrayList, new AspectRatioUtil.CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace(rational, this.mActiveArraySize != null ? new Rational(this.mActiveArraySize.getWidth(), this.mActiveArraySize.getHeight()) : null));
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            for (Size size2 : groupSizesByAspectRatio.get((Rational) it2.next())) {
                if (!arrayList2.contains(size2)) {
                    arrayList2.add(size2);
                }
            }
        }
        return arrayList2;
    }

    private boolean canResolutionBeMovedToHead(Size size) {
        int i = new TargetAspectRatio().get(this.mCameraId, this.mCharacteristics);
        if (i == 0) {
            return AspectRatioUtil.hasMatchingAspectRatio(size, AspectRatioUtil.ASPECT_RATIO_4_3);
        }
        if (i == 1) {
            return AspectRatioUtil.hasMatchingAspectRatio(size, AspectRatioUtil.ASPECT_RATIO_16_9);
        }
        if (i != 2) {
            return true;
        }
        Size fetchMaxNormalOutputSize = fetchMaxNormalOutputSize(256);
        return AspectRatioUtil.hasMatchingAspectRatio(size, new Rational(fetchMaxNormalOutputSize.getWidth(), fetchMaxNormalOutputSize.getHeight()));
    }

    private Size fetchMaxNormalOutputSize(int i) {
        Size size = this.mMaxSizeCache.get(Integer.valueOf(i));
        if (size != null) {
            return size;
        }
        Size maxNormalOutputSizeByFormat = getMaxNormalOutputSizeByFormat(i);
        this.mMaxSizeCache.put(Integer.valueOf(i), maxNormalOutputSizeByFormat);
        return maxNormalOutputSizeByFormat;
    }

    private Size getMaxNormalOutputSizeByFormat(int i) {
        return SizeUtil.getMaxSize(Arrays.asList(getAllOutputSizesByFormat(i, false)));
    }

    private boolean isBurstCaptureSupported() {
        int[] iArr = (int[]) this.mCharacteristics.get(CameraCharacteristics.REQUEST_AVAILABLE_CAPABILITIES);
        if (iArr != null) {
            for (int i : iArr) {
                if (i == 6) {
                    return true;
                }
            }
        }
        return false;
    }

    static Size flipSizeByRotation(Size size, int i, int i2, int i3) {
        return (size == null || !isRotationNeeded(i, i2, i3)) ? size : new Size(size.getHeight(), size.getWidth());
    }

    static Map<Rational, List<Size>> groupSizesByAspectRatio(List<Size> list) {
        HashMap hashMap = new HashMap();
        Iterator<Rational> it = getResolutionListGroupingAspectRatioKeys(list).iterator();
        while (it.hasNext()) {
            hashMap.put(it.next(), new ArrayList());
        }
        for (Size size : list) {
            for (Rational rational : hashMap.keySet()) {
                if (AspectRatioUtil.hasMatchingAspectRatio(size, rational)) {
                    ((List) hashMap.get(rational)).add(size);
                }
            }
        }
        return hashMap;
    }

    static List<Rational> getResolutionListGroupingAspectRatioKeys(List<Size> list) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(AspectRatioUtil.ASPECT_RATIO_4_3);
        arrayList.add(AspectRatioUtil.ASPECT_RATIO_16_9);
        for (Size size : list) {
            Rational rational = new Rational(size.getWidth(), size.getHeight());
            if (!arrayList.contains(rational)) {
                boolean z = false;
                Iterator it = arrayList.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    if (AspectRatioUtil.hasMatchingAspectRatio(size, (Rational) it.next())) {
                        z = true;
                        break;
                    }
                }
                if (!z) {
                    arrayList.add(rational);
                }
            }
        }
        return arrayList;
    }

    static void removeSupportedSizesByMiniBoundingSize(List<Size> list, Size size) {
        if (list == null || list.isEmpty()) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        int i = -1;
        for (int i2 = 0; i2 < list.size(); i2++) {
            Size size2 = list.get(i2);
            if (size2.getWidth() < size.getWidth() || size2.getHeight() < size.getHeight()) {
                if (i >= 0) {
                    arrayList.remove(list.get(i));
                }
                list.removeAll(arrayList);
            } else {
                if (i >= 0) {
                    arrayList.add(list.get(i));
                }
                i = i2;
            }
        }
        list.removeAll(arrayList);
    }

    static boolean isSensorLandscapeResolution(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        Size size = (Size) cameraCharacteristicsCompat.get(CameraCharacteristics.SENSOR_INFO_PIXEL_ARRAY_SIZE);
        return size == null || size.getWidth() >= size.getHeight();
    }

    private static class Api23Impl {
        private Api23Impl() {
        }

        static Size[] getHighResolutionOutputSizes(StreamConfigurationMap streamConfigurationMap, int i) {
            return streamConfigurationMap.getHighResolutionOutputSizes(i);
        }
    }
}
