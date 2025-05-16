.class public Lcom/jianjin/camera/widget/CameraContainer;
.super Landroid/widget/FrameLayout;
.source "CameraContainer.java"

# interfaces
.implements Lcom/jianjin/camera/IActivityLifeCycle;
.implements Lcom/jianjin/camera/ICameraOperation;


# static fields
.field public static final RESET_MASK_DELAY:I = 0x3e8

.field private static final TAG:Ljava/lang/String; = "CameraContainer"


# instance fields
.field private final autoFocusCallback:Landroid/hardware/Camera$AutoFocusCallback;

.field private handler:Landroid/os/Handler;

.field private handlerThread:Landroid/os/HandlerThread;

.field private mActivity:Landroid/app/Activity;

.field private mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

.field private mContext:Landroid/content/Context;

.field private mFocusImageView:Lcom/jianjin/camera/widget/FocusImageView;

.field private mHandler:Landroid/os/Handler;

.field private mPictureCallback:Landroid/hardware/Camera$PictureCallback;

.field private mSensorController:Lcom/jianjin/camera/SensorController;

.field private mSoundPool:Landroid/media/SoundPool;

.field private mZoomSeekBar:Landroid/widget/SeekBar;

.field private mode:I

.field private final onSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private savePicCallback:Lcom/jianjin/camera/widget/ISavePicCallback;

.field private startDis:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, p1, v0}, Lcom/jianjin/camera/widget/CameraContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 59
    invoke-direct {p0, p1, p2, v0}, Lcom/jianjin/camera/widget/CameraContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 131
    new-instance p2, Lcom/jianjin/camera/UIHandler;

    invoke-direct {p2, p0}, Lcom/jianjin/camera/UIHandler;-><init>(Lcom/jianjin/camera/widget/CameraContainer;)V

    iput-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer;->handler:Landroid/os/Handler;

    .line 133
    new-instance p2, Lcom/jianjin/camera/widget/CameraContainer$4;

    invoke-direct {p2, p0}, Lcom/jianjin/camera/widget/CameraContainer$4;-><init>(Lcom/jianjin/camera/widget/CameraContainer;)V

    iput-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer;->mPictureCallback:Landroid/hardware/Camera$PictureCallback;

    .line 156
    new-instance p2, Lcom/jianjin/camera/widget/CameraContainer$5;

    invoke-direct {p2, p0}, Lcom/jianjin/camera/widget/CameraContainer$5;-><init>(Lcom/jianjin/camera/widget/CameraContainer;)V

    iput-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer;->onSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    const/4 p2, 0x0

    .line 310
    iput p2, p0, Lcom/jianjin/camera/widget/CameraContainer;->mode:I

    .line 388
    new-instance p2, Lcom/jianjin/camera/widget/CameraContainer$7;

    invoke-direct {p2, p0}, Lcom/jianjin/camera/widget/CameraContainer$7;-><init>(Lcom/jianjin/camera/widget/CameraContainer;)V

    iput-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer;->mHandler:Landroid/os/Handler;

    .line 432
    new-instance p2, Lcom/jianjin/camera/widget/CameraContainer$9;

    invoke-direct {p2, p0}, Lcom/jianjin/camera/widget/CameraContainer$9;-><init>(Lcom/jianjin/camera/widget/CameraContainer;)V

    iput-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer;->autoFocusCallback:Landroid/hardware/Camera$AutoFocusCallback;

    .line 64
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer;->mContext:Landroid/content/Context;

    .line 65
    invoke-direct {p0}, Lcom/jianjin/camera/widget/CameraContainer;->init()V

    return-void
.end method

.method static synthetic access$000(Lcom/jianjin/camera/widget/CameraContainer;Landroid/graphics/Point;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/jianjin/camera/widget/CameraContainer;->onCameraFocus(Landroid/graphics/Point;)V

    return-void
.end method

.method static synthetic access$100(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/CameraPreview;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    return-object p0
.end method

.method static synthetic access$200(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/widget/SeekBar;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mZoomSeekBar:Landroid/widget/SeekBar;

    return-object p0
.end method

.method static synthetic access$300(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/Handler;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/HandlerThread;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/jianjin/camera/widget/CameraContainer;->handlerThread:Landroid/os/HandlerThread;

    return-object p0
.end method

.method static synthetic access$402(Lcom/jianjin/camera/widget/CameraContainer;Landroid/os/HandlerThread;)Landroid/os/HandlerThread;
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer;->handlerThread:Landroid/os/HandlerThread;

    return-object p1
.end method

.method static synthetic access$500(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/Handler;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/jianjin/camera/widget/CameraContainer;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$600(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/SensorController;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSensorController:Lcom/jianjin/camera/SensorController;

    return-object p0
.end method

.method static synthetic access$700(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/hardware/Camera$AutoFocusCallback;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/jianjin/camera/widget/CameraContainer;->autoFocusCallback:Landroid/hardware/Camera$AutoFocusCallback;

    return-object p0
.end method

.method static synthetic access$800(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/FocusImageView;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mFocusImageView:Lcom/jianjin/camera/widget/FocusImageView;

    return-object p0
.end method

.method private getSoundPool()Landroid/media/SoundPool;
    .locals 4

    .line 295
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSoundPool:Landroid/media/SoundPool;

    if-nez v0, :cond_0

    .line 296
    new-instance v0, Landroid/media/SoundPool;

    const/4 v1, 0x5

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSoundPool:Landroid/media/SoundPool;

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSoundPool:Landroid/media/SoundPool;

    return-object v0
.end method

.method private init()V
    .locals 2

    .line 69
    sget-boolean v0, Lcom/jianjin/camera/CustomCameraAgent;->isInit:Z

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mContext:Landroid/content/Context;

    sget v1, Lcom/jianjin/camera/R$layout;->custom_camera_container:I

    invoke-static {v0, v1, p0}, Lcom/jianjin/camera/widget/CameraContainer;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 74
    sget v0, Lcom/jianjin/camera/R$id;->camera_preview:I

    invoke-virtual {p0, v0}, Lcom/jianjin/camera/widget/CameraContainer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/jianjin/camera/widget/CameraPreview;

    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    .line 75
    sget v0, Lcom/jianjin/camera/R$id;->iv_focus:I

    invoke-virtual {p0, v0}, Lcom/jianjin/camera/widget/CameraContainer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/jianjin/camera/widget/FocusImageView;

    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mFocusImageView:Lcom/jianjin/camera/widget/FocusImageView;

    .line 76
    sget v0, Lcom/jianjin/camera/R$id;->seek_zoom:I

    invoke-virtual {p0, v0}, Lcom/jianjin/camera/widget/CameraContainer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mZoomSeekBar:Landroid/widget/SeekBar;

    .line 78
    invoke-static {}, Lcom/jianjin/camera/SensorController;->getInstance()Lcom/jianjin/camera/SensorController;

    move-result-object v0

    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSensorController:Lcom/jianjin/camera/SensorController;

    .line 80
    new-instance v1, Lcom/jianjin/camera/widget/CameraContainer$1;

    invoke-direct {v1, p0}, Lcom/jianjin/camera/widget/CameraContainer$1;-><init>(Lcom/jianjin/camera/widget/CameraContainer;)V

    invoke-virtual {v0, v1}, Lcom/jianjin/camera/SensorController;->setCameraFocusListener(Lcom/jianjin/camera/SensorController$CameraFocusListener;)V

    .line 89
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    new-instance v1, Lcom/jianjin/camera/widget/CameraContainer$2;

    invoke-direct {v1, p0}, Lcom/jianjin/camera/widget/CameraContainer$2;-><init>(Lcom/jianjin/camera/widget/CameraContainer;)V

    invoke-virtual {v0, v1}, Lcom/jianjin/camera/widget/CameraPreview;->setOnCameraPrepareListener(Lcom/jianjin/camera/widget/OnCameraPrepareListener;)V

    .line 112
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    new-instance v1, Lcom/jianjin/camera/widget/CameraContainer$3;

    invoke-direct {v1, p0}, Lcom/jianjin/camera/widget/CameraContainer$3;-><init>(Lcom/jianjin/camera/widget/CameraContainer;)V

    invoke-virtual {v0, v1}, Lcom/jianjin/camera/widget/CameraPreview;->setSwitchCameraCallBack(Lcom/jianjin/camera/widget/SwitchCameraCallback;)V

    .line 127
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraContainer;->mPictureCallback:Landroid/hardware/Camera$PictureCallback;

    invoke-virtual {v0, v1}, Lcom/jianjin/camera/widget/CameraPreview;->setPictureCallback(Landroid/hardware/Camera$PictureCallback;)V

    .line 128
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mZoomSeekBar:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraContainer;->onSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void

    .line 70
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "custom must be init in application"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private onCameraFocus(Landroid/graphics/Point;)V
    .locals 1

    const/4 v0, 0x0

    .line 402
    invoke-direct {p0, p1, v0}, Lcom/jianjin/camera/widget/CameraContainer;->onCameraFocus(Landroid/graphics/Point;Z)V

    return-void
.end method

.method private onCameraFocus(Landroid/graphics/Point;Z)V
    .locals 3

    if-eqz p2, :cond_0

    const-wide/16 v0, 0x12c

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    .line 415
    :goto_0
    iget-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/jianjin/camera/widget/CameraContainer$8;

    invoke-direct {v2, p0, p1}, Lcom/jianjin/camera/widget/CameraContainer$8;-><init>(Lcom/jianjin/camera/widget/CameraContainer;Landroid/graphics/Point;)V

    invoke-virtual {p2, v2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private spacing(Landroid/view/MotionEvent;)F
    .locals 4

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 v0, 0x0

    .line 382
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v1, v3

    .line 383
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v0, p1

    mul-float v1, v1, v1

    mul-float v0, v0, v0

    add-float/2addr v1, v0

    float-to-double v0, v1

    .line 384
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method


# virtual methods
.method public bindActivity(Landroid/app/Activity;)V
    .locals 1

    .line 288
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer;->mActivity:Landroid/app/Activity;

    .line 289
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    if-eqz v0, :cond_0

    .line 290
    invoke-virtual {v0, p1}, Lcom/jianjin/camera/widget/CameraPreview;->bindActivity(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method

.method public getActivity()Landroid/app/Activity;
    .locals 1

    .line 280
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getMaxZoom()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getSavePicCallback()Lcom/jianjin/camera/widget/ISavePicCallback;
    .locals 1

    .line 284
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->savePicCallback:Lcom/jianjin/camera/widget/ISavePicCallback;

    return-object v0
.end method

.method public getZoom()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onStart()V
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSensorController:Lcom/jianjin/camera/SensorController;

    invoke-virtual {v0}, Lcom/jianjin/camera/SensorController;->onStart()V

    .line 190
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraPreview;->onStart()V

    .line 194
    :cond_0
    invoke-direct {p0}, Lcom/jianjin/camera/widget/CameraContainer;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v0

    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSoundPool:Landroid/media/SoundPool;

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 199
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSensorController:Lcom/jianjin/camera/SensorController;

    invoke-virtual {v0}, Lcom/jianjin/camera/SensorController;->onStop()V

    .line 201
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    if-eqz v0, :cond_0

    .line 202
    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraPreview;->onStop()V

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    const/4 v0, 0x0

    .line 206
    iput-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSoundPool:Landroid/media/SoundPool;

    .line 207
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->handlerThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_1

    .line 208
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    :cond_1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 317
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_9

    if-eq v0, v2, :cond_7

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    goto/16 :goto_1

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mZoomSeekBar:Landroid/widget/SeekBar;

    if-nez v0, :cond_1

    return v2

    .line 326
    :cond_1
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraContainer;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 328
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mZoomSeekBar:Landroid/widget/SeekBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 330
    iput v2, p0, Lcom/jianjin/camera/widget/CameraContainer;->mode:I

    .line 332
    invoke-direct {p0, p1}, Lcom/jianjin/camera/widget/CameraContainer;->spacing(Landroid/view/MotionEvent;)F

    move-result p1

    iput p1, p0, Lcom/jianjin/camera/widget/CameraContainer;->startDis:F

    goto/16 :goto_1

    .line 335
    :cond_2
    iget v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mode:I

    if-ne v0, v2, :cond_a

    .line 337
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ge v0, v3, :cond_3

    return v2

    .line 338
    :cond_3
    invoke-direct {p0, p1}, Lcom/jianjin/camera/widget/CameraContainer;->spacing(Landroid/view/MotionEvent;)F

    move-result p1

    .line 340
    iget v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->startDis:F

    sub-float v0, p1, v0

    const/high16 v3, 0x41200000    # 10.0f

    div-float/2addr v0, v3

    float-to-int v0, v0

    if-ge v0, v2, :cond_4

    const/4 v3, -0x1

    if-gt v0, v3, :cond_a

    .line 342
    :cond_4
    iget-object v3, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-virtual {v3}, Lcom/jianjin/camera/widget/CameraPreview;->getZoom()I

    move-result v3

    add-int/2addr v3, v0

    .line 344
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraPreview;->getMaxZoom()I

    move-result v0

    if-le v3, v0, :cond_5

    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraPreview;->getMaxZoom()I

    move-result v3

    :cond_5
    if-gez v3, :cond_6

    goto :goto_0

    :cond_6
    move v1, v3

    .line 346
    :goto_0
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-virtual {v0, v1}, Lcom/jianjin/camera/widget/CameraPreview;->setZoom(I)V

    .line 347
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mZoomSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 349
    iput p1, p0, Lcom/jianjin/camera/widget/CameraContainer;->startDis:F

    goto :goto_1

    .line 355
    :cond_7
    iget v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mode:I

    if-eq v0, v2, :cond_8

    .line 357
    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-direct {v0, v1, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 358
    invoke-direct {p0, v0}, Lcom/jianjin/camera/widget/CameraContainer;->onCameraFocus(Landroid/graphics/Point;)V

    goto :goto_1

    .line 361
    :cond_8
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/jianjin/camera/widget/CameraContainer$6;

    invoke-direct {v0, p0}, Lcom/jianjin/camera/widget/CameraContainer$6;-><init>(Lcom/jianjin/camera/widget/CameraContainer;)V

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraContainer;->mZoomSeekBar:Landroid/widget/SeekBar;

    .line 367
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x7d0

    add-long/2addr v3, v5

    .line 361
    invoke-virtual {p1, v0, v1, v3, v4}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    goto :goto_1

    .line 320
    :cond_9
    iput v1, p0, Lcom/jianjin/camera/widget/CameraContainer;->mode:I

    :cond_a
    :goto_1
    return v2
.end method

.method public releaseCamera()V
    .locals 1

    .line 274
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    if-eqz v0, :cond_0

    .line 275
    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraPreview;->releaseCamera()V

    :cond_0
    return-void
.end method

.method public setZoom(I)V
    .locals 0

    return-void
.end method

.method public switchCamera()V
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraPreview;->switchCamera()V

    return-void
.end method

.method public switchFlashMode()V
    .locals 1

    .line 240
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraPreview;->switchFlashMode()V

    return-void
.end method

.method public takePicture(Lcom/jianjin/camera/widget/ISavePicCallback;)Z
    .locals 1

    .line 225
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer;->savePicCallback:Lcom/jianjin/camera/widget/ISavePicCallback;

    .line 227
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mCameraView:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-virtual {v0, p1}, Lcom/jianjin/camera/widget/CameraPreview;->takePicture(Lcom/jianjin/camera/widget/ISavePicCallback;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 229
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer;->mSensorController:Lcom/jianjin/camera/SensorController;

    invoke-virtual {v0}, Lcom/jianjin/camera/SensorController;->unlockFocus()V

    :cond_0
    return p1
.end method
