.class public final Landroidx/camera/camera2/internal/compat/workaround/FlashAvailabilityChecker;
.super Ljava/lang/Object;
.source "FlashAvailabilityChecker.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FlashAvailability"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkFlashAvailabilityNormally(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 2

    .line 72
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->FLASH_INFO_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 73
    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    if-nez p0, :cond_0

    const-string v0, "FlashAvailability"

    const-string v1, "Characteristics did not contain key FLASH_INFO_AVAILABLE. Flash is not available."

    .line 75
    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p0, :cond_1

    .line 78
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static checkFlashAvailabilityWithPossibleBufferUnderflow(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 0

    .line 64
    :try_start_0
    invoke-static {p0}, Landroidx/camera/camera2/internal/compat/workaround/FlashAvailabilityChecker;->checkFlashAvailabilityNormally(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result p0
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isFlashAvailable(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 2

    .line 50
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/FlashAvailabilityBufferUnderflowQuirk;

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Device has quirk "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-class v1, Landroidx/camera/camera2/internal/compat/quirk/FlashAvailabilityBufferUnderflowQuirk;

    const-string v1, "FlashAvailabilityBufferUnderflowQuirk"

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ". Checking for flash availability safely..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FlashAvailability"

    .line 51
    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    invoke-static {p0}, Landroidx/camera/camera2/internal/compat/workaround/FlashAvailabilityChecker;->checkFlashAvailabilityWithPossibleBufferUnderflow(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result p0

    return p0

    .line 56
    :cond_0
    invoke-static {p0}, Landroidx/camera/camera2/internal/compat/workaround/FlashAvailabilityChecker;->checkFlashAvailabilityNormally(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result p0

    return p0
.end method
