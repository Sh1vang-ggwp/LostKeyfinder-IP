.class public Lcom/jianjin/camera/widget/CameraPreview;
.super Landroid/view/SurfaceView;
.source "CameraPreview.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/jianjin/camera/ICameraOperation;
.implements Lcom/jianjin/camera/IActivityLifeCycle;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private callback:Landroid/hardware/Camera$PictureCallback;

.field private mActivity:Landroid/app/Activity;

.field private mCamera:Landroid/hardware/Camera;

.field private mCameraId:Lcom/jianjin/camera/CameraDirection;

.field private mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

.field private mContext:Landroid/content/Context;

.field private mDisplayOrientation:I

.field private mLayoutOrientation:I

.field private mOrientation:I

.field private mOrientationListener:Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;

.field private mParameters:Landroid/hardware/Camera$Parameters;

.field private mSensorController:Lcom/jianjin/camera/SensorController;

.field private mSwitchCameraCallBack:Lcom/jianjin/camera/widget/SwitchCameraCallback;

.field private mZoom:I

.field private onCameraPrepareListener:Lcom/jianjin/camera/widget/OnCameraPrepareListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    const-class v0, Landroid/view/SurfaceView;

    const-string v0, "SurfaceView"

    sput-object v0, Lcom/jianjin/camera/widget/CameraPreview;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 59
    invoke-direct {p0, p1, v0}, Lcom/jianjin/camera/widget/CameraPreview;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, p1, p2, v0}, Lcom/jianjin/camera/widget/CameraPreview;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 67
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 55
    iput p2, p0, Lcom/jianjin/camera/widget/CameraPreview;->mOrientation:I

    .line 68
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mContext:Landroid/content/Context;

    .line 69
    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraManager;->getInstance(Landroid/content/Context;)Lcom/jianjin/camera/widget/CameraManager;

    move-result-object p1

    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    .line 70
    invoke-virtual {p1}, Lcom/jianjin/camera/widget/CameraManager;->getCameraDirection()Lcom/jianjin/camera/CameraDirection;

    move-result-object p1

    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraId:Lcom/jianjin/camera/CameraDirection;

    const/4 p1, 0x1

    .line 72
    invoke-virtual {p0, p1}, Lcom/jianjin/camera/widget/CameraPreview;->setFocusable(Z)V

    .line 73
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraPreview;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 75
    invoke-static {}, Lcom/jianjin/camera/SensorController;->getInstance()Lcom/jianjin/camera/SensorController;

    move-result-object p1

    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mSensorController:Lcom/jianjin/camera/SensorController;

    .line 77
    new-instance p1, Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;

    iget-object p2, p0, Lcom/jianjin/camera/widget/CameraPreview;->mContext:Landroid/content/Context;

    invoke-direct {p1, p0, p2}, Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;-><init>(Lcom/jianjin/camera/widget/CameraPreview;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mOrientationListener:Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;

    .line 78
    invoke-virtual {p1}, Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;->enable()V

    return-void
.end method

.method static synthetic access$000(Lcom/jianjin/camera/widget/CameraPreview;)I
    .locals 0

    .line 33
    iget p0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mOrientation:I

    return p0
.end method

.method static synthetic access$002(Lcom/jianjin/camera/widget/CameraPreview;I)I
    .locals 0

    .line 33
    iput p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mOrientation:I

    return p1
.end method

.method private adjustView(Landroid/hardware/Camera$Size;)V
    .locals 2

    .line 131
    sget v0, Lcom/jianjin/camera/utils/UIUtils;->screenWidth:I

    .line 132
    iget v1, p1, Landroid/hardware/Camera$Size;->width:I

    mul-int v1, v1, v0

    iget p1, p1, Landroid/hardware/Camera$Size;->height:I

    div-int/2addr v1, p1

    .line 135
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraPreview;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 136
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 137
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 138
    invoke-virtual {p0, p1}, Lcom/jianjin/camera/widget/CameraPreview;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private determineDisplayOrientation()V
    .locals 5

    .line 186
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_5

    .line 190
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 191
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraId:Lcom/jianjin/camera/CameraDirection;

    invoke-virtual {v1}, Lcom/jianjin/camera/CameraDirection;->ordinal()I

    move-result v1

    invoke-static {v1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 194
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_3

    if-eq v1, v2, :cond_2

    const/4 v4, 0x2

    if-eq v1, v4, :cond_1

    const/4 v4, 0x3

    if-eq v1, v4, :cond_0

    goto :goto_0

    :cond_0
    const/16 v3, 0x10e

    goto :goto_0

    :cond_1
    const/16 v3, 0xb4

    goto :goto_0

    :cond_2
    const/16 v3, 0x5a

    .line 219
    :cond_3
    :goto_0
    iget v1, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v1, v2, :cond_4

    .line 222
    iget v1, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v1, v3

    rem-int/lit16 v1, v1, 0x168

    rsub-int v1, v1, 0x168

    .line 223
    rem-int/lit16 v1, v1, 0x168

    goto :goto_1

    .line 225
    :cond_4
    iget v1, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v1, v3

    add-int/lit16 v1, v1, 0x168

    rem-int/lit16 v1, v1, 0x168

    .line 228
    :goto_1
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v0, v3

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    iput v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mDisplayOrientation:I

    .line 229
    iput v3, p0, Lcom/jianjin/camera/widget/CameraPreview;->mLayoutOrientation:I

    .line 231
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 233
    sget-object v0, Lcom/jianjin/camera/widget/CameraPreview;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "displayOrientation:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 187
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "please bind activity"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private focus(Landroid/hardware/Camera$AutoFocusCallback;)Z
    .locals 1

    .line 585
    :try_start_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    .line 587
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p1, 0x0

    return p1
.end method

.method private setUpCamera(Lcom/jianjin/camera/CameraDirection;Z)V
    .locals 2

    .line 442
    invoke-virtual {p1}, Lcom/jianjin/camera/CameraDirection;->ordinal()I

    move-result v0

    .line 444
    :try_start_0
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    invoke-virtual {v1, v0}, Lcom/jianjin/camera/widget/CameraManager;->openCamera(I)Landroid/hardware/Camera;

    move-result-object v0

    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    .line 446
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mSensorController:Lcom/jianjin/camera/SensorController;

    invoke-virtual {v0}, Lcom/jianjin/camera/SensorController;->restFocus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 448
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 450
    :goto_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    .line 452
    :try_start_1
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraPreview;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 453
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraPreview;->initCamera()V

    .line 455
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    invoke-virtual {v0, p1}, Lcom/jianjin/camera/widget/CameraManager;->setCameraDirection(Lcom/jianjin/camera/CameraDirection;)V

    .line 457
    sget-object v0, Lcom/jianjin/camera/CameraDirection;->CAMERA_FRONT:Lcom/jianjin/camera/CameraDirection;

    if-ne p1, v0, :cond_0

    .line 458
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mSensorController:Lcom/jianjin/camera/SensorController;

    invoke-virtual {p1}, Lcom/jianjin/camera/SensorController;->lockFocus()V

    goto :goto_1

    .line 460
    :cond_0
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mSensorController:Lcom/jianjin/camera/SensorController;

    invoke-virtual {p1}, Lcom/jianjin/camera/SensorController;->unlockFocus()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 463
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 469
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mSwitchCameraCallBack:Lcom/jianjin/camera/widget/SwitchCameraCallback;

    if-eqz p1, :cond_2

    .line 470
    invoke-interface {p1, p2}, Lcom/jianjin/camera/widget/SwitchCameraCallback;->switchCamera(Z)V

    :cond_2
    return-void
.end method

.method private startOrientationChangeListener()V
    .locals 2

    .line 412
    new-instance v0, Lcom/jianjin/camera/widget/CameraPreview$1;

    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraPreview;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/jianjin/camera/widget/CameraPreview$1;-><init>(Lcom/jianjin/camera/widget/CameraPreview;Landroid/content/Context;)V

    .line 433
    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    return-void
.end method

.method private turnLight(Lcom/jianjin/camera/FlashLightStatus;)V
    .locals 5

    .line 145
    sget-object v0, Lcom/jianjin/camera/widget/CameraManager;->mFlashLightNotSupport:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    invoke-virtual {p1}, Lcom/jianjin/camera/FlashLightStatus;->next()Lcom/jianjin/camera/FlashLightStatus;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/jianjin/camera/widget/CameraPreview;->turnLight(Lcom/jianjin/camera/FlashLightStatus;)V

    return-void

    .line 150
    :cond_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    .line 151
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 154
    :cond_1
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 155
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v1

    .line 157
    sget-object v2, Lcom/jianjin/camera/widget/CameraPreview$2;->$SwitchMap$com$jianjin$camera$FlashLightStatus:[I

    invoke-virtual {p1}, Lcom/jianjin/camera/FlashLightStatus;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x1

    const-string v4, "off"

    if-eq v2, v3, :cond_4

    const/4 v3, 0x2

    if-eq v2, v3, :cond_2

    goto :goto_0

    :cond_2
    const-string v2, "torch"

    .line 168
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 169
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_0

    .line 172
    :cond_3
    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 173
    invoke-virtual {v0, v4}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_0

    .line 165
    :cond_4
    invoke-virtual {v0, v4}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 177
    :cond_5
    :goto_0
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 178
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    invoke-virtual {v0, p1}, Lcom/jianjin/camera/widget/CameraManager;->setFlashLightStatus(Lcom/jianjin/camera/FlashLightStatus;)V

    :cond_6
    :goto_1
    return-void
.end method


# virtual methods
.method public bindActivity(Landroid/app/Activity;)V
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method public getCameraId()Lcom/jianjin/camera/CameraDirection;
    .locals 1

    .line 405
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraId:Lcom/jianjin/camera/CameraDirection;

    return-object v0
.end method

.method public getMaxZoom()I
    .locals 3

    .line 363
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    .line 364
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 365
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v2

    if-nez v2, :cond_1

    return v1

    .line 366
    :cond_1
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v1

    const/16 v2, 0x28

    if-le v1, v2, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v2

    :goto_0
    return v2
.end method

.method public getPicRotation()I
    .locals 2

    .line 475
    iget v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mDisplayOrientation:I

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mOrientationListener:Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;

    .line 476
    invoke-virtual {v1}, Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;->getRememberedNormalOrientation()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mLayoutOrientation:I

    add-int/2addr v0, v1

    rem-int/lit16 v0, v0, 0x168

    return v0
.end method

.method public getZoom()I
    .locals 1

    .line 392
    iget v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mZoom:I

    return v0
.end method

.method public initCamera()V
    .locals 5

    .line 86
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mParameters:Landroid/hardware/Camera$Parameters;

    const/16 v1, 0x100

    .line 87
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setPictureFormat(I)V

    .line 89
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v0

    const-string v1, "auto"

    .line 93
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 97
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 99
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 103
    :goto_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Lcom/jianjin/camera/widget/CameraManager;->setFitPreSize(Landroid/hardware/Camera;)V

    .line 105
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 108
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    iget-object v2, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    iget v3, v0, Landroid/hardware/Camera$Size;->width:I

    int-to-float v3, v3

    iget v4, v0, Landroid/hardware/Camera$Size;->height:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/jianjin/camera/widget/CameraManager;->setFitPicSize(Landroid/hardware/Camera;F)V

    .line 109
    sget-object v1, Lcom/jianjin/camera/widget/CameraPreview;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "adpterSize Preview-->width:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "  height:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPictureSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "adpterSize Picture-->width:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v0, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-direct {p0, v0}, Lcom/jianjin/camera/widget/CameraPreview;->adjustView(Landroid/hardware/Camera$Size;)V

    .line 118
    invoke-direct {p0}, Lcom/jianjin/camera/widget/CameraPreview;->determineDisplayOrientation()V

    .line 120
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 121
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraManager;->getFlashLightStatus()Lcom/jianjin/camera/FlashLightStatus;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jianjin/camera/widget/CameraPreview;->turnLight(Lcom/jianjin/camera/FlashLightStatus;)V

    return-void
.end method

.method protected onFocus(Landroid/graphics/Point;Landroid/hardware/Camera$AutoFocusCallback;)Z
    .locals 8

    .line 536
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 542
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 549
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt v2, v3, :cond_6

    .line 551
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxNumFocusAreas()I

    move-result v2

    if-gtz v2, :cond_1

    .line 552
    invoke-direct {p0, p2}, Lcom/jianjin/camera/widget/CameraPreview;->focus(Landroid/hardware/Camera$AutoFocusCallback;)Z

    move-result p1

    return p1

    .line 555
    :cond_1
    sget-object v2, Lcom/jianjin/camera/widget/CameraPreview;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onCameraFocus:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p1, Landroid/graphics/Point;->x:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p1, Landroid/graphics/Point;->y:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 557
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 558
    iget v3, p1, Landroid/graphics/Point;->x:I

    add-int/lit16 v3, v3, -0x12c

    .line 559
    iget v4, p1, Landroid/graphics/Point;->y:I

    add-int/lit16 v4, v4, -0x12c

    .line 560
    iget v5, p1, Landroid/graphics/Point;->x:I

    add-int/lit16 v5, v5, 0x12c

    .line 561
    iget p1, p1, Landroid/graphics/Point;->y:I

    add-int/lit16 p1, p1, 0x12c

    const/16 v6, -0x3e8

    if-ge v3, v6, :cond_2

    const/16 v3, -0x3e8

    :cond_2
    if-ge v4, v6, :cond_3

    const/16 v4, -0x3e8

    :cond_3
    const/16 v6, 0x3e8

    if-le v5, v6, :cond_4

    const/16 v5, 0x3e8

    :cond_4
    if-le p1, v6, :cond_5

    const/16 p1, 0x3e8

    .line 566
    :cond_5
    new-instance v6, Landroid/hardware/Camera$Area;

    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7, v3, v4, v5, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    const/16 p1, 0x64

    invoke-direct {v6, v7, p1}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 568
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    .line 572
    :try_start_1
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 574
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return v1

    .line 580
    :cond_6
    :goto_0
    invoke-direct {p0, p2}, Lcom/jianjin/camera/widget/CameraPreview;->focus(Landroid/hardware/Camera$AutoFocusCallback;)Z

    move-result p1

    return p1

    :catch_1
    move-exception p1

    .line 544
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return v1
.end method

.method public onStart()V
    .locals 2

    .line 291
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mOrientationListener:Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;

    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;->enable()V

    .line 292
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 293
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    invoke-virtual {v1, v0}, Lcom/jianjin/camera/widget/CameraManager;->setPreviewLight(Landroid/hardware/Camera;)V

    .line 294
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 303
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mOrientationListener:Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;

    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;->disable()V

    .line 305
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 306
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 307
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 308
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    :cond_0
    return-void
.end method

.method public releaseCamera()V
    .locals 2

    .line 400
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Lcom/jianjin/camera/widget/CameraManager;->releaseCamera(Landroid/hardware/Camera;)V

    const/4 v0, 0x0

    .line 401
    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    return-void
.end method

.method public setOnCameraPrepareListener(Lcom/jianjin/camera/widget/OnCameraPrepareListener;)V
    .locals 0

    .line 238
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->onCameraPrepareListener:Lcom/jianjin/camera/widget/OnCameraPrepareListener;

    return-void
.end method

.method public setPictureCallback(Landroid/hardware/Camera$PictureCallback;)V
    .locals 0

    .line 242
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->callback:Landroid/hardware/Camera$PictureCallback;

    return-void
.end method

.method public setSwitchCameraCallBack(Lcom/jianjin/camera/widget/SwitchCameraCallback;)V
    .locals 0

    .line 246
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mSwitchCameraCallBack:Lcom/jianjin/camera/widget/SwitchCameraCallback;

    return-void
.end method

.method public setZoom(I)V
    .locals 2

    .line 379
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 381
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 382
    :cond_0
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 383
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 384
    iput p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mZoom:I

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 252
    sget-object p1, Lcom/jianjin/camera/widget/CameraPreview;->TAG:Ljava/lang/String;

    const-string v0, "surfaceCreated"

    invoke-static {p1, v0}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-nez p1, :cond_1

    .line 257
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraId:Lcom/jianjin/camera/CameraDirection;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/jianjin/camera/widget/CameraPreview;->setUpCamera(Lcom/jianjin/camera/CameraDirection;Z)V

    .line 258
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->onCameraPrepareListener:Lcom/jianjin/camera/widget/OnCameraPrepareListener;

    if-eqz p1, :cond_0

    .line 259
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraId:Lcom/jianjin/camera/CameraDirection;

    invoke-interface {p1, v0}, Lcom/jianjin/camera/widget/OnCameraPrepareListener;->onPrepare(Lcom/jianjin/camera/CameraDirection;)V

    .line 261
    :cond_0
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-eqz p1, :cond_1

    .line 262
    invoke-direct {p0}, Lcom/jianjin/camera/widget/CameraPreview;->startOrientationChangeListener()V

    :cond_1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 275
    :try_start_0
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraPreview;->releaseCamera()V

    if-eqz p1, :cond_0

    .line 279
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 280
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Surface;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 285
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public switchCamera()V
    .locals 2

    .line 317
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraId:Lcom/jianjin/camera/CameraDirection;

    invoke-virtual {v0}, Lcom/jianjin/camera/CameraDirection;->next()Lcom/jianjin/camera/CameraDirection;

    move-result-object v0

    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraId:Lcom/jianjin/camera/CameraDirection;

    .line 318
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraPreview;->releaseCamera()V

    .line 320
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraId:Lcom/jianjin/camera/CameraDirection;

    sget-object v1, Lcom/jianjin/camera/CameraDirection;->CAMERA_BACK:Lcom/jianjin/camera/CameraDirection;

    if-ne v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/jianjin/camera/widget/CameraPreview;->setUpCamera(Lcom/jianjin/camera/CameraDirection;Z)V

    return-void
.end method

.method public switchFlashMode()V
    .locals 1

    .line 355
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCameraManager:Lcom/jianjin/camera/widget/CameraManager;

    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraManager;->getFlashLightStatus()Lcom/jianjin/camera/FlashLightStatus;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jianjin/camera/FlashLightStatus;->next()Lcom/jianjin/camera/FlashLightStatus;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jianjin/camera/widget/CameraPreview;->turnLight(Lcom/jianjin/camera/FlashLightStatus;)V

    return-void
.end method

.method public takePicture(Lcom/jianjin/camera/widget/ISavePicCallback;)Z
    .locals 2

    .line 329
    :try_start_0
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mSensorController:Lcom/jianjin/camera/SensorController;

    invoke-virtual {p1}, Lcom/jianjin/camera/SensorController;->lockFocus()V

    .line 330
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mCamera:Landroid/hardware/Camera;

    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraPreview;->callback:Landroid/hardware/Camera$PictureCallback;

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v1, v0}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    .line 331
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview;->mOrientationListener:Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;

    invoke-virtual {p1}, Lcom/jianjin/camera/widget/CameraPreview$CameraOrientationListener;->rememberOrientation()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    .line 335
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 336
    sget-object p1, Lcom/jianjin/camera/widget/CameraPreview;->TAG:Ljava/lang/String;

    const-string v0, "photo fail after Photo Clicked"

    invoke-static {p1, v0}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1
.end method
