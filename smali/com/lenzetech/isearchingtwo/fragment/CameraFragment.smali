.class public Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;
.super Landroidx/fragment/app/Fragment;
.source "CameraFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field static final CAMERA_REQUEST_CODE:I = 0x64

.field static cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;


# instance fields
.field private REQUEST_PICTURE:I

.field private camera:Landroidx/camera/core/Camera;

.field private cameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

.field private cameraProviderFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/lifecycle/ProcessCameraProvider;",
            ">;"
        }
    .end annotation
.end field

.field private flash:Landroid/widget/CheckBox;

.field private imageCapture:Landroidx/camera/core/ImageCapture;

.field private iv_pic:Landroid/widget/ImageView;

.field private lensFacing:I

.field private mContentView:Landroid/view/View;

.field private mSwitch:Landroid/widget/TextView;

.field private mTakePictureBtn:Landroid/widget/ImageView;

.field private picture:Landroid/widget/ImageView;

.field private preview:Landroidx/camera/core/Preview;

.field private pv:Landroidx/camera/view/PreviewView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 104
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/4 v0, 0x2

    .line 63
    iput v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->REQUEST_PICTURE:I

    const/4 v0, 0x1

    .line 75
    iput v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->lensFacing:I

    .line 105
    sput-object p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)Landroid/widget/ImageView;
    .locals 0

    .line 54
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->picture:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)Landroidx/camera/core/Camera;
    .locals 0

    .line 54
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->camera:Landroidx/camera/core/Camera;

    return-object p0
.end method

.method static synthetic access$200(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)I
    .locals 0

    .line 54
    iget p0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->REQUEST_PICTURE:I

    return p0
.end method

.method private checkPermission()V
    .locals 5

    .line 308
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.CAMERA"

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    const-string v3, "android.permission.WRITE_EXTERNAL_STORAGE"

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    .line 309
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v3}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    .line 310
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_2

    .line 311
    :cond_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, v1}, Landroidx/core/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    const/16 v4, 0x64

    if-eqz v0, :cond_1

    .line 312
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    filled-new-array {v1, v3, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_0

    .line 316
    :cond_1
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    filled-new-array {v1, v3, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;
    .locals 1

    .line 95
    sget-object v0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    if-eqz v0, :cond_0

    return-object v0

    .line 98
    :cond_0
    new-instance v0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;-><init>()V

    return-object v0
.end method

.method private initView()V
    .locals 2

    .line 162
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f08005c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->flash:Landroid/widget/CheckBox;

    .line 163
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f080057

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->picture:Landroid/widget/ImageView;

    .line 164
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f08005a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mSwitch:Landroid/widget/TextView;

    .line 165
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f080058

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mTakePictureBtn:Landroid/widget/ImageView;

    .line 166
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f0800f3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/camera/view/PreviewView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->pv:Landroidx/camera/view/PreviewView;

    .line 167
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f0800b5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->iv_pic:Landroid/widget/ImageView;

    return-void
.end method

.method private setListener()V
    .locals 2

    .line 246
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mTakePictureBtn:Landroid/widget/ImageView;

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$2;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$2;-><init>(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 276
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mSwitch:Landroid/widget/TextView;

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$$ExternalSyntheticLambda0;-><init>(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->flash:Landroid/widget/CheckBox;

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$3;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$3;-><init>(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 295
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->picture:Landroid/widget/ImageView;

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$4;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$4;-><init>(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public InitCameraView()V
    .locals 3

    .line 121
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->initView()V

    .line 122
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->setListener()V

    .line 123
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getInstance(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->cameraProviderFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 125
    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$$ExternalSyntheticLambda1;-><init>(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)V

    .line 156
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 125
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method synthetic lambda$InitCameraView$0$com-lenzetech-isearchingtwo-fragment-CameraFragment()V
    .locals 6

    .line 128
    :try_start_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->cameraProviderFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/lifecycle/ProcessCameraProvider;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->cameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    .line 131
    new-instance v0, Landroidx/camera/core/Preview$Builder;

    invoke-direct {v0}, Landroidx/camera/core/Preview$Builder;-><init>()V

    invoke-virtual {v0}, Landroidx/camera/core/Preview$Builder;->build()Landroidx/camera/core/Preview;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->preview:Landroidx/camera/core/Preview;

    .line 134
    new-instance v0, Landroidx/camera/core/ImageCapture$Builder;

    invoke-direct {v0}, Landroidx/camera/core/ImageCapture$Builder;-><init>()V

    const/4 v1, 0x1

    .line 135
    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageCapture$Builder;->setCaptureMode(I)Landroidx/camera/core/ImageCapture$Builder;

    move-result-object v0

    .line 136
    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$Builder;->build()Landroidx/camera/core/ImageCapture;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->imageCapture:Landroidx/camera/core/ImageCapture;

    .line 139
    new-instance v0, Landroidx/camera/core/CameraSelector$Builder;

    invoke-direct {v0}, Landroidx/camera/core/CameraSelector$Builder;-><init>()V

    iget v2, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->lensFacing:I

    .line 140
    invoke-virtual {v0, v2}, Landroidx/camera/core/CameraSelector$Builder;->requireLensFacing(I)Landroidx/camera/core/CameraSelector$Builder;

    move-result-object v0

    .line 141
    invoke-virtual {v0}, Landroidx/camera/core/CameraSelector$Builder;->build()Landroidx/camera/core/CameraSelector;

    move-result-object v0

    .line 142
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->cameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-virtual {v2}, Landroidx/camera/lifecycle/ProcessCameraProvider;->unbindAll()V

    .line 144
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->cameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    const/4 v3, 0x2

    new-array v3, v3, [Landroidx/camera/core/UseCase;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->preview:Landroidx/camera/core/Preview;

    aput-object v5, v3, v4

    iget-object v4, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->imageCapture:Landroidx/camera/core/ImageCapture;

    aput-object v4, v3, v1

    invoke-virtual {v2, p0, v0, v3}, Landroidx/camera/lifecycle/ProcessCameraProvider;->bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->camera:Landroidx/camera/core/Camera;

    .line 150
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->preview:Landroidx/camera/core/Preview;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->pv:Landroidx/camera/view/PreviewView;

    invoke-virtual {v1}, Landroidx/camera/view/PreviewView;->getSurfaceProvider()Landroidx/camera/core/Preview$SurfaceProvider;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/Preview;->setSurfaceProvider(Landroidx/camera/core/Preview$SurfaceProvider;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method synthetic lambda$setListener$2$com-lenzetech-isearchingtwo-fragment-CameraFragment(Landroid/view/View;)V
    .locals 2

    .line 278
    iget p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->lensFacing:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 279
    iput v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->lensFacing:I

    .line 280
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->flash:Landroid/widget/CheckBox;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setVisibility(I)V

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    .line 283
    iput v1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->lensFacing:I

    .line 284
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->flash:Landroid/widget/CheckBox;

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 286
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->InitCameraView()V

    return-void
.end method

.method synthetic lambda$takePhotots$1$com-lenzetech-isearchingtwo-fragment-CameraFragment()V
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->iv_pic:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    .line 344
    :try_start_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 347
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-eqz p1, :cond_0

    .line 358
    new-instance p2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    const-class v0, Lcom/lenzetech/isearchingtwo/Camera/PicActivity;

    invoke-direct {p2, p3, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p3, "imgUri"

    .line 359
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/jianjin/camera/utils/UriUtils;->getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 360
    invoke-virtual {p0, p2}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 364
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 79
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b003a

    const/4 v0, 0x0

    .line 85
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    .line 86
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->InitCameraView()V

    .line 87
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    .line 395
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onPause()V
    .locals 0

    .line 382
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    const/4 p1, 0x0

    .line 328
    aget p1, p3, p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    aget p1, p3, p1

    if-nez p1, :cond_0

    const/4 p1, 0x2

    aget p1, p3, p1

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 372
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 373
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->InitCameraView()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 115
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const-string p1, "\u751f\u547d\u5468\u671f"

    const-string p2, "onViewCreated"

    .line 116
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public releaseCamera()V
    .locals 1

    .line 389
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->cameraProvider:Landroidx/camera/lifecycle/ProcessCameraProvider;

    if-eqz v0, :cond_0

    .line 390
    invoke-virtual {v0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->unbindAll()V

    :cond_0
    return-void
.end method

.method public takePhotots()V
    .locals 5

    .line 171
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 173
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->picture:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f050021

    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 174
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->mContentView:Landroid/view/View;

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$$ExternalSyntheticLambda2;-><init>(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 176
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "iSearching_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 179
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 180
    new-instance v0, Landroidx/camera/core/ImageCapture$OutputFileOptions$Builder;

    invoke-direct {v0, v1}, Landroidx/camera/core/ImageCapture$OutputFileOptions$Builder;-><init>(Ljava/io/File;)V

    .line 181
    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$OutputFileOptions$Builder;->build()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v0

    .line 184
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->imageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v3

    new-instance v4, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;

    invoke-direct {v4, p0, v1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;-><init>(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;Ljava/io/File;)V

    invoke-virtual {v2, v0, v3, v4}, Landroidx/camera/core/ImageCapture;->takePicture(Landroidx/camera/core/ImageCapture$OutputFileOptions;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V

    return-void
.end method
