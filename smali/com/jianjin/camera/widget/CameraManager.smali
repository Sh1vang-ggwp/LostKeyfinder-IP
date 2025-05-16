.class public Lcom/jianjin/camera/widget/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# static fields
.field private static final ALLOW_PIC_LEN:I = 0x7d0

.field private static final TAG:Ljava/lang/String; = "CameraManager"

.field public static mFlashLightNotSupport:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/jianjin/camera/FlashLightStatus;",
            ">;"
        }
    .end annotation
.end field

.field private static mInstance:Lcom/jianjin/camera/widget/CameraManager;


# instance fields
.field private cameraDireHint:[Ljava/lang/String;

.field private flashHint:[Ljava/lang/String;

.field private mCameraDirection:Lcom/jianjin/camera/CameraDirection;

.field private mContext:Landroid/content/Context;

.field private mFlashLightStatus:Lcom/jianjin/camera/FlashLightStatus;

.field private mTvCameraDirection:Landroid/widget/TextView;

.field private mTvFlashLight:Landroid/widget/TextView;

.field private previewLightCallback:Lcom/jianjin/camera/widget/PreviewLightCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/jianjin/camera/widget/CameraManager;->mFlashLightNotSupport:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraManager;->mContext:Landroid/content/Context;

    .line 60
    sget-object p1, Lcom/jianjin/camera/FlashLightStatus;->LIGHT_OFF:Lcom/jianjin/camera/FlashLightStatus;

    invoke-virtual {p1}, Lcom/jianjin/camera/FlashLightStatus;->ordinal()I

    move-result p1

    invoke-static {p1}, Lcom/jianjin/camera/FlashLightStatus;->valueOf(I)Lcom/jianjin/camera/FlashLightStatus;

    move-result-object p1

    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraManager;->mFlashLightStatus:Lcom/jianjin/camera/FlashLightStatus;

    .line 62
    sget-object p1, Lcom/jianjin/camera/CameraDirection;->CAMERA_BACK:Lcom/jianjin/camera/CameraDirection;

    invoke-virtual {p1}, Lcom/jianjin/camera/CameraDirection;->ordinal()I

    move-result p1

    invoke-static {p1}, Lcom/jianjin/camera/CameraDirection;->valueOf(I)Lcom/jianjin/camera/CameraDirection;

    move-result-object p1

    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraManager;->mCameraDirection:Lcom/jianjin/camera/CameraDirection;

    return-void
.end method

.method static synthetic access$000(Lcom/jianjin/camera/widget/CameraManager;)Landroid/widget/TextView;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvFlashLight:Landroid/widget/TextView;

    return-object p0
.end method

.method private checkCameraHardware(Landroid/content/Context;)Z
    .locals 1

    .line 177
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "android.hardware.camera"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private findBestResolution(Landroid/hardware/Camera;DI)Landroid/hardware/Camera$Size;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 311
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p1

    if-nez p4, :cond_0

    .line 312
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object p2

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object p2

    .line 314
    :goto_0
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 315
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :goto_1
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Camera$Size;

    .line 316
    iget v1, v0, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x78

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 317
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 319
    :cond_1
    sget-object p4, Lcom/jianjin/camera/widget/CameraManager;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Supported picture resolutions: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p4, p3}, Lcom/jianjin/camera/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getPictureSize()Landroid/hardware/Camera$Size;

    move-result-object p1

    .line 322
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "default picture resolution "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p1, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "x"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p4, p1}, Lcom/jianjin/camera/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 328
    new-instance p2, Lcom/jianjin/camera/widget/CameraManager$2;

    invoke-direct {p2, p0}, Lcom/jianjin/camera/widget/CameraManager$2;-><init>(Lcom/jianjin/camera/widget/CameraManager;)V

    invoke-static {p1, p2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 p2, 0x0

    .line 343
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/Camera$Size;

    return-object p1
.end method

.method private findFitPicResolution(Landroid/hardware/Camera;F)Landroid/hardware/Camera$Size;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 354
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p1

    .line 355
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object p1

    .line 358
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/Camera$Size;

    .line 359
    iget v3, v2, Landroid/hardware/Camera$Size;->width:I

    int-to-float v3, v3

    iget v4, v2, Landroid/hardware/Camera$Size;->height:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    cmpl-float v3, v3, p2

    if-nez v3, :cond_0

    iget v3, v2, Landroid/hardware/Camera$Size;->width:I

    const/16 v4, 0x7d0

    if-gt v3, v4, :cond_0

    iget v3, v2, Landroid/hardware/Camera$Size;->height:I

    if-gt v3, v4, :cond_0

    if-nez v1, :cond_1

    goto :goto_1

    .line 362
    :cond_1
    iget v3, v2, Landroid/hardware/Camera$Size;->width:I

    iget v4, v1, Landroid/hardware/Camera$Size;->width:I

    if-le v3, v4, :cond_0

    :goto_1
    move-object v1, v2

    goto :goto_0

    :cond_2
    if-nez v1, :cond_3

    const/4 p2, 0x0

    .line 368
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/Camera$Size;

    return-object p1

    :cond_3
    return-object v1
.end method

.method private findFitPreResolution(Landroid/hardware/Camera;)Landroid/hardware/Camera$Size;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 380
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p1

    .line 381
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object p1

    .line 384
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/Camera$Size;

    .line 385
    iget v3, v2, Landroid/hardware/Camera$Size;->width:I

    const/16 v4, 0x7d0

    if-gt v3, v4, :cond_0

    if-nez v1, :cond_1

    goto :goto_1

    .line 388
    :cond_1
    iget v3, v2, Landroid/hardware/Camera$Size;->width:I

    iget v4, v1, Landroid/hardware/Camera$Size;->width:I

    if-le v3, v4, :cond_0

    :goto_1
    move-object v1, v2

    goto :goto_0

    :cond_2
    if-nez v1, :cond_3

    const/4 v0, 0x0

    .line 394
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/Camera$Size;

    return-object p1

    :cond_3
    return-object v1
.end method

.method private getCameraId(I)I
    .locals 4

    .line 159
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v0

    .line 160
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 162
    invoke-static {v2, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 163
    iget v3, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v3, p1, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/jianjin/camera/widget/CameraManager;
    .locals 2

    .line 46
    sget-object v0, Lcom/jianjin/camera/widget/CameraManager;->mInstance:Lcom/jianjin/camera/widget/CameraManager;

    if-nez v0, :cond_1

    .line 47
    const-class v0, Lcom/jianjin/camera/widget/CameraManager;

    monitor-enter v0

    .line 48
    :try_start_0
    sget-object v1, Lcom/jianjin/camera/widget/CameraManager;->mInstance:Lcom/jianjin/camera/widget/CameraManager;

    if-nez v1, :cond_0

    .line 49
    new-instance v1, Lcom/jianjin/camera/widget/CameraManager;

    invoke-direct {v1, p0}, Lcom/jianjin/camera/widget/CameraManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/jianjin/camera/widget/CameraManager;->mInstance:Lcom/jianjin/camera/widget/CameraManager;

    .line 51
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 53
    :cond_1
    :goto_0
    sget-object p0, Lcom/jianjin/camera/widget/CameraManager;->mInstance:Lcom/jianjin/camera/widget/CameraManager;

    return-object p0
.end method

.method private setDisplay(Landroid/hardware/Camera;)V
    .locals 3

    .line 404
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x5a

    const/16 v2, 0xe

    if-lt v0, v2, :cond_0

    .line 405
    invoke-virtual {p1, v1}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto :goto_0

    .line 406
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x8

    if-lt v0, v2, :cond_1

    .line 407
    invoke-direct {p0, p1, v1}, Lcom/jianjin/camera/widget/CameraManager;->setDisplayOrientation(Landroid/hardware/Camera;I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private setDisplayOrientation(Landroid/hardware/Camera;I)V
    .locals 6

    .line 420
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setDisplayOrientation"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz v0, :cond_0

    new-array v1, v2, [Ljava/lang/Object;

    .line 423
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v1, v5

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 426
    :catch_0
    sget-object p1, Lcom/jianjin/camera/widget/CameraManager;->TAG:Ljava/lang/String;

    const-string p2, "\u56fe\u50cf\u51fa\u9519"

    invoke-static {p1, p2}, Lcom/jianjin/camera/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method

.method private setUpPicSize(Landroid/hardware/Camera;)V
    .locals 4

    .line 232
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    const/4 v3, 0x1

    .line 235
    :try_start_0
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/jianjin/camera/widget/CameraManager;->findBestResolution(Landroid/hardware/Camera;DI)Landroid/hardware/Camera$Size;

    move-result-object v1

    .line 236
    iget v2, v1, Landroid/hardware/Camera$Size;->width:I

    iget v3, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v2, v3}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 237
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 239
    sget-object p1, Lcom/jianjin/camera/widget/CameraManager;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setUpPicSize:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "*"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 241
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private setUpPreviewSize(Landroid/hardware/Camera;)V
    .locals 4

    .line 251
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    const/4 v3, 0x0

    .line 254
    :try_start_0
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/jianjin/camera/widget/CameraManager;->findBestResolution(Landroid/hardware/Camera;DI)Landroid/hardware/Camera$Size;

    move-result-object v1

    .line 255
    iget v2, v1, Landroid/hardware/Camera$Size;->width:I

    iget v3, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 256
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 258
    sget-object p1, Lcom/jianjin/camera/widget/CameraManager;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setUpPreviewSize:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "*"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 260
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method


# virtual methods
.method public bindOptionMenuView(Landroid/widget/TextView;Landroid/widget/TextView;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvFlashLight:Landroid/widget/TextView;

    .line 75
    iput-object p2, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvCameraDirection:Landroid/widget/TextView;

    .line 76
    iput-object p3, p0, Lcom/jianjin/camera/widget/CameraManager;->flashHint:[Ljava/lang/String;

    .line 77
    iput-object p4, p0, Lcom/jianjin/camera/widget/CameraManager;->cameraDireHint:[Ljava/lang/String;

    .line 80
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraManager;->getFlashLightStatus()Lcom/jianjin/camera/FlashLightStatus;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/jianjin/camera/widget/CameraManager;->setFlashLightStatus(Lcom/jianjin/camera/FlashLightStatus;)V

    .line 81
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraManager;->getCameraDirection()Lcom/jianjin/camera/CameraDirection;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/jianjin/camera/widget/CameraManager;->setCameraDirection(Lcom/jianjin/camera/CameraDirection;)V

    return-void
.end method

.method getCameraDirection()Lcom/jianjin/camera/CameraDirection;
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mCameraDirection:Lcom/jianjin/camera/CameraDirection;

    return-object v0
.end method

.method getFlashLightStatus()Lcom/jianjin/camera/FlashLightStatus;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mFlashLightStatus:Lcom/jianjin/camera/FlashLightStatus;

    return-object v0
.end method

.method openCamera(I)Landroid/hardware/Camera;
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/jianjin/camera/widget/CameraManager;->checkCameraHardware(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    invoke-direct {p0, p1}, Lcom/jianjin/camera/widget/CameraManager;->getCameraId(I)I

    move-result v0

    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    .line 136
    invoke-virtual {p0, v0}, Lcom/jianjin/camera/widget/CameraManager;->setPreviewLight(Landroid/hardware/Camera;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 138
    :goto_0
    sget-object v1, Lcom/jianjin/camera/widget/CameraManager;->mFlashLightNotSupport:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    if-eqz v0, :cond_1

    .line 140
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v1

    if-nez p1, :cond_1

    if-eqz v1, :cond_1

    const-string p1, "on"

    .line 148
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 149
    sget-object p1, Lcom/jianjin/camera/widget/CameraManager;->mFlashLightNotSupport:Ljava/util/List;

    sget-object v1, Lcom/jianjin/camera/FlashLightStatus;->LIGHT_ON:Lcom/jianjin/camera/FlashLightStatus;

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    :cond_1
    sget-object p1, Lcom/jianjin/camera/widget/CameraManager;->TAG:Ljava/lang/String;

    const-string v1, "\u76f8\u673a\u521d\u59cb\u5316open"

    invoke-static {p1, v1}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method releaseCamera(Landroid/hardware/Camera;)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 215
    :try_start_0
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 216
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 217
    invoke-virtual {p1}, Landroid/hardware/Camera;->stopPreview()V

    .line 218
    invoke-virtual {p1}, Landroid/hardware/Camera;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 221
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method setCameraDirection(Lcom/jianjin/camera/CameraDirection;)V
    .locals 3

    .line 90
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraManager;->mCameraDirection:Lcom/jianjin/camera/CameraDirection;

    .line 91
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvCameraDirection:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    .line 92
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraManager;->cameraDireHint:[Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 93
    invoke-virtual {p1}, Lcom/jianjin/camera/CameraDirection;->ordinal()I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvCameraDirection:Landroid/widget/TextView;

    sget-object v1, Lcom/jianjin/camera/CameraDirection;->CAMERA_FRONT:Lcom/jianjin/camera/CameraDirection;

    const/4 v2, 0x0

    if-ne p1, v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 100
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvFlashLight:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    .line 101
    sget-object v1, Lcom/jianjin/camera/CameraDirection;->CAMERA_BACK:Lcom/jianjin/camera/CameraDirection;

    if-ne p1, v1, :cond_2

    goto :goto_1

    :cond_2
    const/16 v2, 0x8

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_3
    return-void
.end method

.method setFitPicSize(Landroid/hardware/Camera;F)V
    .locals 3

    .line 269
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 272
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/jianjin/camera/widget/CameraManager;->findFitPicResolution(Landroid/hardware/Camera;F)Landroid/hardware/Camera$Size;

    move-result-object p2

    .line 273
    iget v1, p2, Landroid/hardware/Camera$Size;->width:I

    iget v2, p2, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 274
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 276
    sget-object p1, Lcom/jianjin/camera/widget/CameraManager;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setFitPicSize:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p2, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p2, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 278
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method setFitPreSize(Landroid/hardware/Camera;)V
    .locals 4

    .line 288
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 291
    :try_start_0
    invoke-direct {p0, p1}, Lcom/jianjin/camera/widget/CameraManager;->findFitPreResolution(Landroid/hardware/Camera;)Landroid/hardware/Camera$Size;

    move-result-object v1

    .line 292
    iget v2, v1, Landroid/hardware/Camera$Size;->width:I

    iget v3, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 293
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 295
    sget-object p1, Lcom/jianjin/camera/widget/CameraManager;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFitPreSize:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "*"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 297
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method setFlashLightStatus(Lcom/jianjin/camera/FlashLightStatus;)V
    .locals 3

    .line 111
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraManager;->mFlashLightStatus:Lcom/jianjin/camera/FlashLightStatus;

    .line 112
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvFlashLight:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    .line 113
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraManager;->flashHint:[Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 114
    invoke-virtual {p1}, Lcom/jianjin/camera/FlashLightStatus;->ordinal()I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    :cond_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvFlashLight:Landroid/widget/TextView;

    sget-object v1, Lcom/jianjin/camera/FlashLightStatus;->LIGHT_ON:Lcom/jianjin/camera/FlashLightStatus;

    if-ne p1, v1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    :cond_2
    return-void
.end method

.method setPreviewLight(Landroid/hardware/Camera;)V
    .locals 2

    .line 186
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvFlashLight:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->previewLightCallback:Lcom/jianjin/camera/widget/PreviewLightCallback;

    if-nez v0, :cond_0

    .line 188
    new-instance v0, Lcom/jianjin/camera/widget/CameraManager$1;

    invoke-direct {v0, p0}, Lcom/jianjin/camera/widget/CameraManager$1;-><init>(Lcom/jianjin/camera/widget/CameraManager;)V

    .line 205
    new-instance v1, Lcom/jianjin/camera/widget/PreviewLightCallback;

    invoke-direct {v1, p0, v0}, Lcom/jianjin/camera/widget/PreviewLightCallback;-><init>(Lcom/jianjin/camera/widget/CameraManager;Lcom/jianjin/camera/widget/PreviewLightCallback$OnCameraLightCallback;)V

    iput-object v1, p0, Lcom/jianjin/camera/widget/CameraManager;->previewLightCallback:Lcom/jianjin/camera/widget/PreviewLightCallback;

    .line 208
    :cond_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->previewLightCallback:Lcom/jianjin/camera/widget/PreviewLightCallback;

    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    return-void
.end method

.method public unbindView()V
    .locals 1

    const/4 v0, 0x0

    .line 85
    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvFlashLight:Landroid/widget/TextView;

    .line 86
    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraManager;->mTvCameraDirection:Landroid/widget/TextView;

    return-void
.end method
