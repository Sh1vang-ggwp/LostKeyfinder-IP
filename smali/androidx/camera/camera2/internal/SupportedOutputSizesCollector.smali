.class final Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;
.super Ljava/lang/Object;
.source "SupportedOutputSizesCollector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/SupportedOutputSizesCollector$Api23Impl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SupportedOutputSizesCollector"


# instance fields
.field private final mActiveArraySize:Landroid/util/Size;

.field private final mCameraId:Ljava/lang/String;

.field private final mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

.field private final mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

.field private final mExcludedSizeListCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mExcludedSupportedSizesContainer:Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;

.field private final mHighResolutionOutputSizesCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end field

.field private final mIsBurstCaptureSupported:Z

.field private final mIsSensorLandscapeResolution:Z

.field private final mLensFacing:I

.field private final mMaxSizeCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end field

.field private final mOutputSizesCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end field

.field private final mResolutionCorrector:Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

.field private final mSensorOrientation:I


# direct methods
.method constructor <init>(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Landroidx/camera/camera2/internal/DisplayInfoManager;)V
    .locals 1

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mResolutionCorrector:Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mOutputSizesCache:Ljava/util/Map;

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mHighResolutionOutputSizesCache:Ljava/util/Map;

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mMaxSizeCache:Ljava/util/Map;

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mExcludedSizeListCache:Ljava/util/Map;

    .line 96
    iput-object p1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mCameraId:Ljava/lang/String;

    .line 97
    iput-object p2, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 98
    iput-object p3, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    .line 100
    new-instance p3, Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;

    invoke-direct {p3, p1}, Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;-><init>(Ljava/lang/String;)V

    iput-object p3, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mExcludedSupportedSizesContainer:Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;

    .line 102
    invoke-static {p2}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->isSensorLandscapeResolution(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result p1

    iput-boolean p1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mIsSensorLandscapeResolution:Z

    .line 103
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->isBurstCaptureSupported()Z

    move-result p1

    iput-boolean p1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mIsBurstCaptureSupported:Z

    .line 105
    sget-object p1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p2, p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Rect;

    if-eqz p1, :cond_0

    .line 106
    new-instance p3, Landroid/util/Size;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-direct {p3, v0, p1}, Landroid/util/Size;-><init>(II)V

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    iput-object p3, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mActiveArraySize:Landroid/util/Size;

    .line 108
    sget-object p1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p2, p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mSensorOrientation:I

    .line 109
    sget-object p1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p2, p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mLensFacing:I

    return-void
.end method

.method private canResolutionBeMovedToHead(Landroid/util/Size;)Z
    .locals 3

    .line 513
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;-><init>()V

    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mCameraId:Ljava/lang/String;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 514
    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;->get(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)I

    move-result v0

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    return v1

    :cond_0
    const/16 v0, 0x100

    .line 522
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->fetchMaxNormalOutputSize(I)Landroid/util/Size;

    move-result-object v0

    .line 523
    new-instance v1, Landroid/util/Rational;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 524
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    invoke-direct {v1, v2, v0}, Landroid/util/Rational;-><init>(II)V

    .line 525
    invoke-static {p1, v1}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result p1

    return p1

    .line 520
    :cond_1
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-static {p1, v0}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result p1

    return p1

    .line 518
    :cond_2
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-static {p1, v0}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result p1

    return p1
.end method

.method private collectResolutionCandidateList(Landroidx/camera/core/ResolutionSelector;IZ[Landroid/util/Size;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/ResolutionSelector;",
            "IZ[",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    if-nez p4, :cond_1

    if-nez p3, :cond_0

    .line 167
    invoke-virtual {p1}, Landroidx/camera/core/ResolutionSelector;->isHighResolutionEnabled()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 168
    :goto_0
    invoke-direct {p0, p2, p1}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->getAllOutputSizesByFormat(IZ)[Landroid/util/Size;

    move-result-object p4

    .line 173
    :cond_1
    new-instance p1, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {p1, v0}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {p4, p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 175
    invoke-static {p4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 177
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_2

    return-object p1

    .line 178
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Resolution candidate list is empty when collecting by the settings!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private doGetHighResolutionOutputSizesByFormat(I)[Landroid/util/Size;
    .locals 2

    .line 316
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 322
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 323
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    if-eqz v0, :cond_1

    .line 329
    invoke-static {v0, p1}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector$Api23Impl;->getHighResolutionOutputSizes(Landroid/hardware/camera2/params/StreamConfigurationMap;I)[Landroid/util/Size;

    move-result-object p1

    return-object p1

    .line 326
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can not retrieve SCALER_STREAM_CONFIGURATION_MAP"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private doGetOutputSizesByFormat(I)[Landroid/util/Size;
    .locals 3

    .line 296
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 297
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    if-eqz v0, :cond_1

    .line 304
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->toStreamConfigurationMapCompat(Landroid/hardware/camera2/params/StreamConfigurationMap;)Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 305
    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 307
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not get supported output size for the format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 300
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can not retrieve SCALER_STREAM_CONFIGURATION_MAP"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private excludeProblematicSizes(Ljava/util/List;I)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 434
    invoke-direct {p0, p2}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->fetchExcludedSizes(I)Ljava/util/List;

    move-result-object p2

    .line 435
    invoke-interface {p1, p2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    return-object p1
.end method

.method private fetchExcludedSizes(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 441
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mExcludedSizeListCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    .line 444
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mExcludedSupportedSizesContainer:Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;->get(I)Ljava/util/List;

    move-result-object v0

    .line 445
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mExcludedSizeListCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method private fetchMaxNormalOutputSize(I)Landroid/util/Size;
    .locals 2

    .line 532
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mMaxSizeCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    if-eqz v0, :cond_0

    return-object v0

    .line 536
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->getMaxNormalOutputSizeByFormat(I)Landroid/util/Size;

    move-result-object v0

    .line 537
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mMaxSizeCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private filterOutResolutionCandidateListBySettings(Ljava/util/List;Landroidx/camera/core/ResolutionSelector;I)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/ResolutionSelector;",
            "I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 195
    invoke-virtual {p2}, Landroidx/camera/core/ResolutionSelector;->getMaxResolution()Landroid/util/Size;

    move-result-object p2

    if-nez p2, :cond_0

    .line 202
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_1

    .line 204
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 205
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 206
    invoke-static {v1, p2}, Landroidx/camera/core/internal/utils/SizeUtil;->isLongerInAnyEdge(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 207
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    move-object p2, v0

    .line 212
    :goto_1
    invoke-direct {p0, p2, p3}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->excludeProblematicSizes(Ljava/util/List;I)Ljava/util/List;

    move-result-object p1

    .line 214
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_3

    return-object p1

    .line 215
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Resolution candidate list is empty after filtering out by the settings!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static flipSizeByRotation(Landroid/util/Size;III)Landroid/util/Size;
    .locals 0

    if-eqz p0, :cond_0

    .line 584
    invoke-static {p1, p2, p3}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->isRotationNeeded(III)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 585
    new-instance p1, Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p2

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result p0

    invoke-direct {p1, p2, p0}, Landroid/util/Size;-><init>(II)V

    move-object p0, p1

    :cond_0
    return-object p0
.end method

.method private getAllOutputSizesByFormat(IZ)[Landroid/util/Size;
    .locals 3

    .line 261
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mOutputSizesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/util/Size;

    if-nez v0, :cond_0

    .line 263
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->doGetOutputSizesByFormat(I)[Landroid/util/Size;

    move-result-object v0

    .line 264
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mOutputSizesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const/4 v1, 0x0

    if-eqz p2, :cond_1

    .line 271
    iget-boolean p2, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mIsBurstCaptureSupported:Z

    if-eqz p2, :cond_1

    .line 272
    iget-object p2, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mHighResolutionOutputSizesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, [Landroid/util/Size;

    if-nez v1, :cond_1

    .line 276
    iget-object p2, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mHighResolutionOutputSizesCache:Ljava/util/Map;

    .line 277
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 276
    invoke-interface {p2, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 278
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->doGetHighResolutionOutputSizesByFormat(I)[Landroid/util/Size;

    move-result-object v1

    .line 279
    iget-object p2, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mHighResolutionOutputSizesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    if-eqz v1, :cond_2

    .line 285
    array-length p1, v1

    array-length p2, v0

    add-int/2addr p1, p2

    invoke-static {v1, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/util/Size;

    const/4 p2, 0x0

    .line 287
    array-length v1, v1

    array-length v2, v0

    invoke-static {v0, p2, p1, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, p1

    :cond_2
    return-object v0
.end method

.method private getMaxNormalOutputSizeByFormat(I)Landroid/util/Size;
    .locals 1

    const/4 v0, 0x0

    .line 552
    invoke-direct {p0, p1, v0}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->getAllOutputSizesByFormat(IZ)[Landroid/util/Size;

    move-result-object p1

    .line 554
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Landroidx/camera/core/internal/utils/SizeUtil;->getMaxSize(Ljava/util/List;)Landroid/util/Size;

    move-result-object p1

    return-object p1
.end method

.method static getResolutionListGroupingAspectRatioKeys(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Rational;",
            ">;"
        }
    .end annotation

    .line 621
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 625
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 626
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 629
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 630
    new-instance v2, Landroid/util/Rational;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Rational;-><init>(II)V

    .line 631
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x0

    .line 637
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Rational;

    .line 638
    invoke-static {v1, v5}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v3, 0x1

    :cond_2
    if-nez v3, :cond_0

    .line 644
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private getTargetAspectRatioByResolutionSelector(Landroidx/camera/core/ResolutionSelector;)Landroid/util/Rational;
    .locals 3

    .line 349
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->getTargetAspectRatioFromQuirk()Landroid/util/Rational;

    move-result-object v0

    if-nez v0, :cond_4

    .line 352
    invoke-virtual {p1}, Landroidx/camera/core/ResolutionSelector;->getPreferredAspectRatio()I

    move-result p1

    if-eqz p1, :cond_2

    const/4 v1, 0x1

    if-eq p1, v1, :cond_0

    .line 363
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Undefined target aspect ratio: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "SupportedOutputSizesCollector"

    invoke-static {v1, p1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 359
    :cond_0
    iget-boolean p1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mIsSensorLandscapeResolution:Z

    if-eqz p1, :cond_1

    sget-object p1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    goto :goto_0

    .line 360
    :cond_1
    sget-object p1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_9_16:Landroid/util/Rational;

    :goto_0
    move-object v0, p1

    goto :goto_1

    .line 355
    :cond_2
    iget-boolean p1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mIsSensorLandscapeResolution:Z

    if-eqz p1, :cond_3

    sget-object p1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    goto :goto_0

    .line 356
    :cond_3
    sget-object p1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_3_4:Landroid/util/Rational;

    goto :goto_0

    :cond_4
    :goto_1
    return-object v0
.end method

.method private getTargetAspectRatioFromQuirk()Landroid/util/Rational;
    .locals 3

    .line 380
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;-><init>()V

    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mCameraId:Ljava/lang/String;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 381
    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;->get(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)I

    move-result v0

    if-eqz v0, :cond_3

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x100

    .line 390
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->fetchMaxNormalOutputSize(I)Landroid/util/Size;

    move-result-object v0

    .line 391
    new-instance v1, Landroid/util/Rational;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    invoke-direct {v1, v2, v0}, Landroid/util/Rational;-><init>(II)V

    move-object v0, v1

    goto :goto_0

    .line 387
    :cond_1
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mIsSensorLandscapeResolution:Z

    if-eqz v0, :cond_2

    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    goto :goto_0

    :cond_2
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_9_16:Landroid/util/Rational;

    goto :goto_0

    .line 384
    :cond_3
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mIsSensorLandscapeResolution:Z

    if-eqz v0, :cond_4

    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    goto :goto_0

    :cond_4
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_3_4:Landroid/util/Rational;

    :goto_0
    return-object v0
.end method

.method static getTargetSizeByResolutionSelector(Landroidx/camera/core/ResolutionSelector;III)Landroid/util/Size;
    .locals 2

    .line 403
    invoke-virtual {p0}, Landroidx/camera/core/ResolutionSelector;->getPreferredResolution()Landroid/util/Size;

    move-result-object v0

    .line 407
    invoke-virtual {p0}, Landroidx/camera/core/ResolutionSelector;->getSizeCoordinate()Landroidx/camera/core/impl/SizeCoordinate;

    move-result-object p0

    sget-object v1, Landroidx/camera/core/impl/SizeCoordinate;->ANDROID_VIEW:Landroidx/camera/core/impl/SizeCoordinate;

    if-ne p0, v1, :cond_0

    .line 408
    invoke-static {v0, p1, p3, p2}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->flipSizeByRotation(Landroid/util/Size;III)Landroid/util/Size;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method static groupSizesByAspectRatio(Ljava/util/List;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/Map<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 591
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 593
    invoke-static {p0}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->getResolutionListGroupingAspectRatioKeys(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 595
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Rational;

    .line 596
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 599
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 600
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Rational;

    .line 603
    invoke-static {v1, v3}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 604
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    return-object v0
.end method

.method private isBurstCaptureSupported()Z
    .locals 6

    .line 558
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 559
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 562
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, v0, v3

    const/4 v5, 0x6

    if-ne v4, v5, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private static isRotationNeeded(III)Z
    .locals 2

    .line 417
    invoke-static {p0}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 424
    :goto_0
    invoke-static {p0, p2, p1}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->getRelativeImageRotation(IIZ)I

    move-result p0

    const/16 p1, 0x5a

    if-eq p0, p1, :cond_1

    const/16 p1, 0x10e

    if-ne p0, p1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method static isSensorLandscapeResolution(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 1

    .line 701
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PIXEL_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 702
    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/Size;

    if-eqz p0, :cond_1

    .line 705
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    if-lt v0, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method static removeSupportedSizesByMiniBoundingSize(Ljava/util/List;Landroid/util/Size;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            ")V"
        }
    .end annotation

    if-eqz p0, :cond_4

    .line 665
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, -0x1

    .line 670
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    const/4 v0, 0x0

    const/4 v2, -0x1

    .line 673
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 674
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    .line 675
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v5

    if-lt v4, v5, :cond_2

    .line 676
    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    if-lt v3, v4, :cond_2

    if-ltz v2, :cond_1

    .line 680
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v2, v0, 0x1

    move v6, v2

    move v2, v0

    move v0, v6

    goto :goto_0

    :cond_2
    if-ltz v2, :cond_3

    .line 689
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 696
    :cond_3
    invoke-interface {p0, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    :cond_4
    :goto_1
    return-void
.end method

.method private sortResolutionCandidateListByResolutionSelector(Ljava/util/List;Landroidx/camera/core/ResolutionSelector;ILandroid/util/Size;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/ResolutionSelector;",
            "I",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 240
    invoke-direct {p0, p2}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->getTargetAspectRatioByResolutionSelector(Landroidx/camera/core/ResolutionSelector;)Landroid/util/Rational;

    move-result-object v0

    const-string v1, "ResolutionSelector should also have aspect ratio value."

    .line 241
    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    iget v1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mSensorOrientation:I

    iget v2, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mLensFacing:I

    invoke-static {p2, p3, v1, v2}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->getTargetSizeByResolutionSelector(Landroidx/camera/core/ResolutionSelector;III)Landroid/util/Size;

    move-result-object p2

    .line 246
    invoke-direct {p0, p1, v0, p4}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->sortResolutionCandidateListByTargetAspectRatioAndSize(Ljava/util/List;Landroid/util/Rational;Landroid/util/Size;)Ljava/util/List;

    move-result-object p1

    .line 251
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-direct {p0, p2}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->canResolutionBeMovedToHead(Landroid/util/Size;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 252
    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    const/4 p3, 0x0

    .line 253
    invoke-interface {p1, p3, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_0
    return-object p1
.end method

.method private sortResolutionCandidateListByTargetAspectRatioAndSize(Ljava/util/List;Landroid/util/Rational;Landroid/util/Size;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Rational;",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 470
    invoke-static {p1}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->groupSizesByAspectRatio(Ljava/util/List;)Ljava/util/Map;

    move-result-object p1

    if-eqz p3, :cond_0

    .line 475
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Rational;

    .line 476
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-static {v1, p3}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->removeSupportedSizesByMiniBoundingSize(Ljava/util/List;Landroid/util/Size;)V

    goto :goto_0

    .line 482
    :cond_0
    new-instance p3, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-direct {p3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 483
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mActiveArraySize:Landroid/util/Size;

    if-eqz v0, :cond_1

    new-instance v0, Landroid/util/Rational;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mActiveArraySize:Landroid/util/Size;

    .line 484
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mActiveArraySize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 485
    :goto_1
    new-instance v1, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;

    invoke-direct {v1, p2, v0}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;-><init>(Landroid/util/Rational;Landroid/util/Rational;)V

    invoke-static {p3, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 489
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 492
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Rational;

    .line 493
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 496
    invoke-interface {p2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 497
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    return-object p2
.end method


# virtual methods
.method getSupportedOutputSizes(Landroidx/camera/core/ResolutionSelector;ILandroid/util/Size;Z[Landroid/util/Size;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/ResolutionSelector;",
            "I",
            "Landroid/util/Size;",
            "Z[",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 127
    invoke-direct {p0, p1, p2, p4, p5}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->collectResolutionCandidateList(Landroidx/camera/core/ResolutionSelector;IZ[Landroid/util/Size;)Ljava/util/List;

    move-result-object p4

    .line 132
    invoke-direct {p0, p4, p1, p2}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->filterOutResolutionCandidateListBySettings(Ljava/util/List;Landroidx/camera/core/ResolutionSelector;I)Ljava/util/List;

    move-result-object p4

    .line 136
    iget-object p5, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    .line 138
    invoke-virtual {p5}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getMaxSizeDisplay()Landroid/view/Display;

    move-result-object p5

    invoke-virtual {p5}, Landroid/view/Display;->getRotation()I

    move-result p5

    .line 136
    invoke-direct {p0, p4, p1, p5, p3}, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->sortResolutionCandidateListByResolutionSelector(Ljava/util/List;Landroidx/camera/core/ResolutionSelector;ILandroid/util/Size;)Ljava/util/List;

    move-result-object p1

    .line 141
    iget-object p3, p0, Landroidx/camera/camera2/internal/SupportedOutputSizesCollector;->mResolutionCorrector:Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

    .line 142
    invoke-static {p2}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigType(I)Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    move-result-object p2

    .line 141
    invoke-virtual {p3, p2, p1}, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;->insertOrPrioritize(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
