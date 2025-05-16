package androidx.camera.camera2.internal;

import android.content.Context;
import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.media.CamcorderProfile;
import android.media.MediaRecorder;
import android.util.Pair;
import android.util.Rational;
import android.util.Size;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.camera2.internal.compat.workaround.ExcludedSupportedSizesContainer;
import androidx.camera.camera2.internal.compat.workaround.ExtraSupportedSurfaceCombinationsContainer;
import androidx.camera.camera2.internal.compat.workaround.ResolutionCorrector;
import androidx.camera.camera2.internal.compat.workaround.TargetAspectRatio;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.Logger;
import androidx.camera.core.ResolutionSelector;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.SurfaceCombination;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.SurfaceSizeDefinition;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.utils.AspectRatioUtil;
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
final class SupportedSurfaceCombination {
    private static final String TAG = "SupportedSurfaceCombination";
    private final Size mActiveArraySize;
    private final CamcorderProfileHelper mCamcorderProfileHelper;
    private final String mCameraId;
    private final CameraCharacteristicsCompat mCharacteristics;
    private final DisplayInfoManager mDisplayInfoManager;
    private final ExcludedSupportedSizesContainer mExcludedSupportedSizesContainer;
    private final ExtraSupportedSurfaceCombinationsContainer mExtraSupportedSurfaceCombinationsContainer;
    private final int mHardwareLevel;
    private boolean mIsBurstCaptureSupported;
    private boolean mIsRawSupported;
    private final boolean mIsSensorLandscapeResolution;
    private final int mLensFacing;
    private final int mSensorOrientation;
    private final SupportedOutputSizesCollector mSupportedOutputSizesCollector;
    SurfaceSizeDefinition mSurfaceSizeDefinition;
    private final List<SurfaceCombination> mSurfaceCombinations = new ArrayList();
    private final Map<Integer, Size> mMaxSizeCache = new HashMap();
    private final Map<Integer, List<Size>> mExcludedSizeListCache = new HashMap();
    private Map<Integer, Size[]> mOutputSizesCache = new HashMap();
    private final ResolutionCorrector mResolutionCorrector = new ResolutionCorrector();

    private void checkCustomization() {
    }

    SupportedSurfaceCombination(Context context, String str, CameraManagerCompat cameraManagerCompat, CamcorderProfileHelper camcorderProfileHelper) throws CameraUnavailableException {
        this.mIsRawSupported = false;
        this.mIsBurstCaptureSupported = false;
        String str2 = (String) Preconditions.checkNotNull(str);
        this.mCameraId = str2;
        this.mCamcorderProfileHelper = (CamcorderProfileHelper) Preconditions.checkNotNull(camcorderProfileHelper);
        this.mExcludedSupportedSizesContainer = new ExcludedSupportedSizesContainer(str);
        this.mExtraSupportedSurfaceCombinationsContainer = new ExtraSupportedSurfaceCombinationsContainer();
        this.mDisplayInfoManager = DisplayInfoManager.getInstance(context);
        try {
            CameraCharacteristicsCompat cameraCharacteristicsCompat = cameraManagerCompat.getCameraCharacteristicsCompat(str2);
            this.mCharacteristics = cameraCharacteristicsCompat;
            Integer num = (Integer) cameraCharacteristicsCompat.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
            this.mHardwareLevel = num != null ? num.intValue() : 2;
            this.mIsSensorLandscapeResolution = SupportedOutputSizesCollector.isSensorLandscapeResolution(cameraCharacteristicsCompat);
            int[] iArr = (int[]) cameraCharacteristicsCompat.get(CameraCharacteristics.REQUEST_AVAILABLE_CAPABILITIES);
            if (iArr != null) {
                for (int i : iArr) {
                    if (i == 3) {
                        this.mIsRawSupported = true;
                    } else if (i == 6) {
                        this.mIsBurstCaptureSupported = true;
                    }
                }
            }
            Rect rect = (Rect) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE);
            this.mActiveArraySize = rect != null ? new Size(rect.width(), rect.height()) : null;
            this.mSensorOrientation = ((Integer) this.mCharacteristics.get(CameraCharacteristics.SENSOR_ORIENTATION)).intValue();
            this.mLensFacing = ((Integer) this.mCharacteristics.get(CameraCharacteristics.LENS_FACING)).intValue();
            generateSupportedCombinationList();
            generateSurfaceSizeDefinition();
            checkCustomization();
            this.mSupportedOutputSizesCollector = new SupportedOutputSizesCollector(this.mCameraId, this.mCharacteristics, this.mDisplayInfoManager);
        } catch (CameraAccessExceptionCompat e) {
            throw CameraUnavailableExceptionHelper.createFrom(e);
        }
    }

    String getCameraId() {
        return this.mCameraId;
    }

    boolean isRawSupported() {
        return this.mIsRawSupported;
    }

    boolean isBurstCaptureSupported() {
        return this.mIsBurstCaptureSupported;
    }

    boolean checkSupported(List<SurfaceConfig> list) {
        Iterator<SurfaceCombination> it = this.mSurfaceCombinations.iterator();
        boolean z = false;
        while (it.hasNext() && !(z = it.next().isSupported(list))) {
        }
        return z;
    }

    SurfaceConfig transformSurfaceConfig(int i, Size size) {
        return SurfaceConfig.transformSurfaceConfig(i, size, this.mSurfaceSizeDefinition);
    }

    Map<UseCaseConfig<?>, Size> getSuggestedResolutions(List<AttachedSurfaceInfo> list, List<UseCaseConfig<?>> list2) {
        refreshPreviewSize();
        ArrayList arrayList = new ArrayList();
        Iterator<AttachedSurfaceInfo> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().getSurfaceConfig());
        }
        Iterator<UseCaseConfig<?>> it2 = list2.iterator();
        while (it2.hasNext()) {
            arrayList.add(SurfaceConfig.transformSurfaceConfig(it2.next().getInputFormat(), new Size(640, 480), this.mSurfaceSizeDefinition));
        }
        if (!checkSupported(arrayList)) {
            throw new IllegalArgumentException("No supported surface combination is found for camera device - Id : " + this.mCameraId + ".  May be attempting to bind too many use cases. Existing surfaces: " + list + " New configs: " + list2);
        }
        List<Integer> useCasesPriorityOrder = getUseCasesPriorityOrder(list2);
        ArrayList arrayList2 = new ArrayList();
        Iterator<Integer> it3 = useCasesPriorityOrder.iterator();
        while (it3.hasNext()) {
            arrayList2.add(getSupportedOutputSizes(list2.get(it3.next().intValue())));
        }
        HashMap hashMap = null;
        Iterator<List<Size>> it4 = getAllPossibleSizeArrangements(arrayList2).iterator();
        while (true) {
            if (!it4.hasNext()) {
                break;
            }
            List<Size> next = it4.next();
            ArrayList arrayList3 = new ArrayList();
            Iterator<AttachedSurfaceInfo> it5 = list.iterator();
            while (it5.hasNext()) {
                arrayList3.add(it5.next().getSurfaceConfig());
            }
            for (int i = 0; i < next.size(); i++) {
                arrayList3.add(SurfaceConfig.transformSurfaceConfig(list2.get(useCasesPriorityOrder.get(i).intValue()).getInputFormat(), next.get(i), this.mSurfaceSizeDefinition));
            }
            if (checkSupported(arrayList3)) {
                hashMap = new HashMap();
                for (UseCaseConfig<?> useCaseConfig : list2) {
                    hashMap.put(useCaseConfig, next.get(useCasesPriorityOrder.indexOf(Integer.valueOf(list2.indexOf(useCaseConfig)))));
                }
            }
        }
        if (hashMap != null) {
            return hashMap;
        }
        throw new IllegalArgumentException("No supported surface combination is found for camera device - Id : " + this.mCameraId + " and Hardware level: " + this.mHardwareLevel + ". May be the specified resolution is too large and not supported. Existing surfaces: " + list + " New configs: " + list2);
    }

    private Rational getTargetAspectRatio(ImageOutputConfig imageOutputConfig, List<Size> list) {
        Rational rational;
        int i = new TargetAspectRatio().get(this.mCameraId, this.mCharacteristics);
        if (i == 0) {
            rational = this.mIsSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_4_3 : AspectRatioUtil.ASPECT_RATIO_3_4;
        } else if (i == 1) {
            rational = this.mIsSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_16_9 : AspectRatioUtil.ASPECT_RATIO_9_16;
        } else {
            if (i == 2) {
                Size fetchMaxSize = fetchMaxSize(256);
                return new Rational(fetchMaxSize.getWidth(), fetchMaxSize.getHeight());
            }
            if (i != 3) {
                return null;
            }
            if (imageOutputConfig.hasTargetAspectRatio()) {
                int targetAspectRatio = imageOutputConfig.getTargetAspectRatio();
                if (targetAspectRatio == 0) {
                    rational = this.mIsSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_4_3 : AspectRatioUtil.ASPECT_RATIO_3_4;
                } else if (targetAspectRatio == 1) {
                    rational = this.mIsSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_16_9 : AspectRatioUtil.ASPECT_RATIO_9_16;
                } else {
                    Logger.e(TAG, "Undefined target aspect ratio: " + targetAspectRatio);
                    return null;
                }
            } else {
                Size targetSize = getTargetSize(imageOutputConfig);
                if (targetSize != null) {
                    return getAspectRatioGroupKeyOfTargetSize(targetSize, list);
                }
                return null;
            }
        }
        return rational;
    }

    private Size fetchMaxSize(int i) {
        Size size = this.mMaxSizeCache.get(Integer.valueOf(i));
        if (size != null) {
            return size;
        }
        Size maxOutputSizeByFormat = getMaxOutputSizeByFormat(i);
        this.mMaxSizeCache.put(Integer.valueOf(i), maxOutputSizeByFormat);
        return maxOutputSizeByFormat;
    }

    private List<Integer> getUseCasesPriorityOrder(List<UseCaseConfig<?>> list) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        Iterator<UseCaseConfig<?>> it = list.iterator();
        while (it.hasNext()) {
            int surfaceOccupancyPriority = it.next().getSurfaceOccupancyPriority(0);
            if (!arrayList2.contains(Integer.valueOf(surfaceOccupancyPriority))) {
                arrayList2.add(Integer.valueOf(surfaceOccupancyPriority));
            }
        }
        Collections.sort(arrayList2);
        Collections.reverse(arrayList2);
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            int intValue = ((Integer) it2.next()).intValue();
            for (UseCaseConfig<?> useCaseConfig : list) {
                if (intValue == useCaseConfig.getSurfaceOccupancyPriority(0)) {
                    arrayList.add(Integer.valueOf(list.indexOf(useCaseConfig)));
                }
            }
        }
        return arrayList;
    }

    List<Size> getSupportedOutputSizes(UseCaseConfig<?> useCaseConfig) {
        int inputFormat = useCaseConfig.getInputFormat();
        ImageOutputConfig imageOutputConfig = (ImageOutputConfig) useCaseConfig;
        ResolutionSelector resolutionSelector = imageOutputConfig.getResolutionSelector(null);
        if (resolutionSelector != null) {
            Size defaultResolution = imageOutputConfig.getDefaultResolution(null);
            if (resolutionSelector.getPreferredResolution() != null) {
                defaultResolution = SupportedOutputSizesCollector.getTargetSizeByResolutionSelector(resolutionSelector, this.mDisplayInfoManager.getMaxSizeDisplay().getRotation(), this.mSensorOrientation, this.mLensFacing);
            }
            return this.mSupportedOutputSizesCollector.getSupportedOutputSizes(resolutionSelector, inputFormat, defaultResolution, useCaseConfig.isHigResolutionDisabled(false), getCustomizedSupportSizesFromConfig(inputFormat, imageOutputConfig));
        }
        Size[] customizedSupportSizesFromConfig = getCustomizedSupportSizesFromConfig(inputFormat, imageOutputConfig);
        if (customizedSupportSizesFromConfig == null) {
            customizedSupportSizesFromConfig = getAllOutputSizesByFormat(inputFormat);
        }
        Size[] excludeProblematicSizesAndSort = excludeProblematicSizesAndSort(customizedSupportSizesFromConfig, inputFormat);
        ArrayList arrayList = new ArrayList();
        Size maxResolution = imageOutputConfig.getMaxResolution(null);
        Size maxOutputSizeByFormat = getMaxOutputSizeByFormat(inputFormat);
        if (maxResolution == null || SizeUtil.getArea(maxOutputSizeByFormat) < SizeUtil.getArea(maxResolution)) {
            maxResolution = maxOutputSizeByFormat;
        }
        Arrays.sort(excludeProblematicSizesAndSort, new CompareSizesByArea(true));
        Size targetSize = getTargetSize(imageOutputConfig);
        Size size = SizeUtil.RESOLUTION_VGA;
        int area = SizeUtil.getArea(SizeUtil.RESOLUTION_VGA);
        if (SizeUtil.getArea(maxResolution) < area) {
            size = SizeUtil.RESOLUTION_ZERO;
        } else if (targetSize != null && SizeUtil.getArea(targetSize) < area) {
            size = targetSize;
        }
        for (Size size2 : excludeProblematicSizesAndSort) {
            if (SizeUtil.getArea(size2) <= SizeUtil.getArea(maxResolution) && SizeUtil.getArea(size2) >= SizeUtil.getArea(size) && !arrayList.contains(size2)) {
                arrayList.add(size2);
            }
        }
        if (arrayList.isEmpty()) {
            throw new IllegalArgumentException("Can not get supported output size under supported maximum for the format: " + inputFormat);
        }
        Rational targetAspectRatio = getTargetAspectRatio(imageOutputConfig, arrayList);
        if (targetSize == null) {
            targetSize = imageOutputConfig.getDefaultResolution(null);
        }
        ArrayList arrayList2 = new ArrayList();
        new HashMap();
        if (targetAspectRatio == null) {
            arrayList2.addAll(arrayList);
            if (targetSize != null) {
                SupportedOutputSizesCollector.removeSupportedSizesByMiniBoundingSize(arrayList2, targetSize);
            }
        } else {
            Map<Rational, List<Size>> groupSizesByAspectRatio = SupportedOutputSizesCollector.groupSizesByAspectRatio(arrayList);
            if (targetSize != null) {
                Iterator<Rational> it = groupSizesByAspectRatio.keySet().iterator();
                while (it.hasNext()) {
                    SupportedOutputSizesCollector.removeSupportedSizesByMiniBoundingSize(groupSizesByAspectRatio.get(it.next()), targetSize);
                }
            }
            ArrayList arrayList3 = new ArrayList(groupSizesByAspectRatio.keySet());
            Collections.sort(arrayList3, new AspectRatioUtil.CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace(targetAspectRatio, this.mActiveArraySize != null ? new Rational(this.mActiveArraySize.getWidth(), this.mActiveArraySize.getHeight()) : null));
            Iterator it2 = arrayList3.iterator();
            while (it2.hasNext()) {
                for (Size size3 : groupSizesByAspectRatio.get((Rational) it2.next())) {
                    if (!arrayList2.contains(size3)) {
                        arrayList2.add(size3);
                    }
                }
            }
        }
        return this.mResolutionCorrector.insertOrPrioritize(SurfaceConfig.getConfigType(useCaseConfig.getInputFormat()), arrayList2);
    }

    private Size getTargetSize(ImageOutputConfig imageOutputConfig) {
        return SupportedOutputSizesCollector.flipSizeByRotation(imageOutputConfig.getTargetResolution(null), imageOutputConfig.getTargetRotation(0), this.mLensFacing, this.mSensorOrientation);
    }

    private Rational getAspectRatioGroupKeyOfTargetSize(Size size, List<Size> list) {
        if (size == null) {
            return null;
        }
        for (Rational rational : SupportedOutputSizesCollector.getResolutionListGroupingAspectRatioKeys(list)) {
            if (AspectRatioUtil.hasMatchingAspectRatio(size, rational)) {
                return rational;
            }
        }
        return new Rational(size.getWidth(), size.getHeight());
    }

    private List<List<Size>> getAllPossibleSizeArrangements(List<List<Size>> list) {
        Iterator<List<Size>> it = list.iterator();
        int i = 1;
        while (it.hasNext()) {
            i *= it.next().size();
        }
        if (i == 0) {
            throw new IllegalArgumentException("Failed to find supported resolutions.");
        }
        ArrayList arrayList = new ArrayList();
        for (int i2 = 0; i2 < i; i2++) {
            arrayList.add(new ArrayList());
        }
        int size = i / list.get(0).size();
        int i3 = i;
        for (int i4 = 0; i4 < list.size(); i4++) {
            List<Size> list2 = list.get(i4);
            for (int i5 = 0; i5 < i; i5++) {
                ((List) arrayList.get(i5)).add(list2.get((i5 % i3) / size));
            }
            if (i4 < list.size() - 1) {
                i3 = size;
                size /= list.get(i4 + 1).size();
            }
        }
        return arrayList;
    }

    private Size[] excludeProblematicSizesAndSort(Size[] sizeArr, int i) {
        List<Size> fetchExcludedSizes = fetchExcludedSizes(i);
        ArrayList arrayList = new ArrayList(Arrays.asList(sizeArr));
        arrayList.removeAll(fetchExcludedSizes);
        Size[] sizeArr2 = (Size[]) arrayList.toArray(new Size[0]);
        Arrays.sort(sizeArr2, new CompareSizesByArea(true));
        return sizeArr2;
    }

    private Size[] getCustomizedSupportSizesFromConfig(int i, ImageOutputConfig imageOutputConfig) {
        List<Pair<Integer, Size[]>> supportedResolutions = imageOutputConfig.getSupportedResolutions(null);
        if (supportedResolutions == null) {
            return null;
        }
        for (Pair<Integer, Size[]> pair : supportedResolutions) {
            if (((Integer) pair.first).intValue() == i) {
                return (Size[]) pair.second;
            }
        }
        return null;
    }

    private Size[] getAllOutputSizesByFormat(int i) {
        Size[] sizeArr = this.mOutputSizesCache.get(Integer.valueOf(i));
        if (sizeArr != null) {
            return sizeArr;
        }
        Size[] doGetAllOutputSizesByFormat = doGetAllOutputSizesByFormat(i);
        this.mOutputSizesCache.put(Integer.valueOf(i), doGetAllOutputSizesByFormat);
        return doGetAllOutputSizesByFormat;
    }

    private Size[] doGetAllOutputSizesByFormat(int i) {
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

    Size getMaxOutputSizeByFormat(int i) {
        return (Size) Collections.max(Arrays.asList(getAllOutputSizesByFormat(i)), new CompareSizesByArea());
    }

    private void generateSupportedCombinationList() {
        this.mSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.generateSupportedCombinationList(this.mHardwareLevel, this.mIsRawSupported, this.mIsBurstCaptureSupported));
        this.mSurfaceCombinations.addAll(this.mExtraSupportedSurfaceCombinationsContainer.get(this.mCameraId, this.mHardwareLevel));
    }

    private void generateSurfaceSizeDefinition() {
        this.mSurfaceSizeDefinition = SurfaceSizeDefinition.create(new Size(640, 480), this.mDisplayInfoManager.getPreviewSize(), getRecordSize());
    }

    private void refreshPreviewSize() {
        this.mDisplayInfoManager.refresh();
        if (this.mSurfaceSizeDefinition == null) {
            generateSurfaceSizeDefinition();
        } else {
            this.mSurfaceSizeDefinition = SurfaceSizeDefinition.create(this.mSurfaceSizeDefinition.getAnalysisSize(), this.mDisplayInfoManager.getPreviewSize(), this.mSurfaceSizeDefinition.getRecordSize());
        }
    }

    private Size getRecordSize() {
        try {
            int parseInt = Integer.parseInt(this.mCameraId);
            CamcorderProfile camcorderProfile = this.mCamcorderProfileHelper.hasProfile(parseInt, 1) ? this.mCamcorderProfileHelper.get(parseInt, 1) : null;
            if (camcorderProfile != null) {
                return new Size(camcorderProfile.videoFrameWidth, camcorderProfile.videoFrameHeight);
            }
            return getRecordSizeByHasProfile(parseInt);
        } catch (NumberFormatException unused) {
            return getRecordSizeFromStreamConfigurationMap();
        }
    }

    private Size getRecordSizeFromStreamConfigurationMap() {
        StreamConfigurationMap streamConfigurationMap = (StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
        if (streamConfigurationMap == null) {
            throw new IllegalArgumentException("Can not retrieve SCALER_STREAM_CONFIGURATION_MAP");
        }
        Size[] outputSizes = StreamConfigurationMapCompat.toStreamConfigurationMapCompat(streamConfigurationMap).getOutputSizes(MediaRecorder.class);
        if (outputSizes == null) {
            return SizeUtil.RESOLUTION_480P;
        }
        Arrays.sort(outputSizes, new CompareSizesByArea(true));
        for (Size size : outputSizes) {
            if (size.getWidth() <= SizeUtil.RESOLUTION_1080P.getWidth() && size.getHeight() <= SizeUtil.RESOLUTION_1080P.getHeight()) {
                return size;
            }
        }
        return SizeUtil.RESOLUTION_480P;
    }

    private Size getRecordSizeByHasProfile(int i) {
        CamcorderProfile camcorderProfile;
        Size size = SizeUtil.RESOLUTION_480P;
        if (this.mCamcorderProfileHelper.hasProfile(i, 10)) {
            camcorderProfile = this.mCamcorderProfileHelper.get(i, 10);
        } else if (this.mCamcorderProfileHelper.hasProfile(i, 8)) {
            camcorderProfile = this.mCamcorderProfileHelper.get(i, 8);
        } else if (this.mCamcorderProfileHelper.hasProfile(i, 12)) {
            camcorderProfile = this.mCamcorderProfileHelper.get(i, 12);
        } else if (this.mCamcorderProfileHelper.hasProfile(i, 6)) {
            camcorderProfile = this.mCamcorderProfileHelper.get(i, 6);
        } else if (this.mCamcorderProfileHelper.hasProfile(i, 5)) {
            camcorderProfile = this.mCamcorderProfileHelper.get(i, 5);
        } else {
            camcorderProfile = this.mCamcorderProfileHelper.hasProfile(i, 4) ? this.mCamcorderProfileHelper.get(i, 4) : null;
        }
        return camcorderProfile != null ? new Size(camcorderProfile.videoFrameWidth, camcorderProfile.videoFrameHeight) : size;
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
}
