.class public Lcom/lenzetech/isearchingtwo/activity/MainActivity;
.super Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;
.source "MainActivity.java"


# static fields
.field public static TAG:Ljava/lang/String; = "MainActivity"


# instance fields
.field public cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

.field public deviceFragment:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

.field private fragmentId:I

.field private fragmentManager:Landroidx/fragment/app/FragmentManager;

.field private fusedLocationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

.field public googleMapFragment:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

.field public locationFragment:Lcom/lenzetech/isearchingtwo/fragment/LocationFragment;

.field private mCurrent:Landroidx/fragment/app/Fragment;

.field public mHandler:Landroid/os/Handler;

.field private mOnNavigationItemSelectedListener:Lcom/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemSelectedListener;

.field public pdfFragment:Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;

.field public settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 53
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;-><init>()V

    const/4 v0, 0x0

    .line 70
    iput v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->fragmentId:I

    .line 74
    new-instance v0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity$1;-><init>(Lcom/lenzetech/isearchingtwo/activity/MainActivity;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->mHandler:Landroid/os/Handler;

    .line 123
    new-instance v0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;-><init>(Lcom/lenzetech/isearchingtwo/activity/MainActivity;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->mOnNavigationItemSelectedListener:Lcom/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemSelectedListener;

    const/4 v0, 0x0

    .line 213
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->fusedLocationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/activity/MainActivity;I)V
    .locals 0

    .line 53
    invoke-direct {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->setFragment(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/lenzetech/isearchingtwo/activity/MainActivity;)V
    .locals 0

    .line 53
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->requestCameraPermission()V

    return-void
.end method

.method private checkPermission()V
    .locals 10

    .line 426
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.CAMERA"

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 427
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 428
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 430
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "android.permission.LOCATION_HARDWARE"

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 432
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 434
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 435
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "android.permission.RECORD_AUDIO"

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 436
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "android.permission.BLUETOOTH_ADMIN"

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 449
    :cond_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->init(Landroid/content/Context;)V

    goto :goto_1

    .line 439
    :cond_1
    :goto_0
    invoke-static {p0, v1}, Landroidx/core/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v1, "android.permission.CAMERA"

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    const-string v3, "android.permission.READ_EXTERNAL_STORAGE"

    const-string v4, "android.permission.LOCATION_HARDWARE"

    const-string v5, "android.permission.ACCESS_COARSE_LOCATION"

    const-string v6, "android.permission.ACCESS_FINE_LOCATION"

    const-string v7, "android.permission.RECORD_AUDIO"

    const-string v8, "android.permission.BLUETOOTH_ADMIN"

    .line 440
    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_1

    :cond_2
    const-string v2, "android.permission.CAMERA"

    const-string v3, "android.permission.WRITE_EXTERNAL_STORAGE"

    const-string v4, "android.permission.READ_EXTERNAL_STORAGE"

    const-string v5, "android.permission.LOCATION_HARDWARE"

    const-string v6, "android.permission.ACCESS_COARSE_LOCATION"

    const-string v7, "android.permission.ACCESS_FINE_LOCATION"

    const-string v8, "android.permission.RECORD_AUDIO"

    const-string v9, "android.permission.BLUETOOTH_ADMIN"

    .line 444
    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {p0, v0, v1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :goto_1
    return-void
.end method

.method private hideFragments(Landroidx/fragment/app/FragmentTransaction;)V
    .locals 1

    .line 374
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->deviceFragment:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    if-eqz v0, :cond_0

    .line 376
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentTransaction;->hide(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 378
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    if-eqz v0, :cond_1

    .line 379
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentTransaction;->hide(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 390
    :cond_1
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->googleMapFragment:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    if-eqz v0, :cond_2

    .line 391
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentTransaction;->hide(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 396
    :cond_2
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    if-eqz v0, :cond_3

    .line 397
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentTransaction;->hide(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 398
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->onHideFc()V

    .line 402
    :cond_3
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->pdfFragment:Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;

    if-eqz v0, :cond_4

    .line 403
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentTransaction;->hide(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 404
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->pdfFragment:Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;->onHideFc()V

    :cond_4
    return-void
.end method

.method private requestCameraPermission()V
    .locals 4

    .line 171
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x4

    const-string v2, "android.permission.CAMERA"

    const/16 v3, 0x1c

    if-le v0, v3, :cond_0

    .line 172
    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_0

    :cond_0
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 175
    filled-new-array {v2, v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :goto_0
    return-void
.end method

.method private setFragment(I)V
    .locals 4

    .line 280
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 282
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    .line 284
    invoke-direct {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->hideFragments(Landroidx/fragment/app/FragmentTransaction;)V

    const v1, 0x7f08006b

    if-eqz p1, :cond_b

    const/4 v2, 0x1

    if-eq p1, v2, :cond_9

    const/4 v2, 0x2

    if-eq p1, v2, :cond_6

    const/4 v2, 0x3

    if-eq p1, v2, :cond_3

    const/4 v2, 0x4

    if-eq p1, v2, :cond_0

    goto/16 :goto_0

    .line 355
    :cond_0
    iput v2, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->fragmentId:I

    .line 356
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    if-eqz p1, :cond_1

    .line 357
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->releaseCamera()V

    .line 358
    :cond_1
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->pdfFragment:Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;

    if-nez p1, :cond_2

    .line 359
    new-instance p1, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;

    invoke-direct {p1}, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;-><init>()V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->pdfFragment:Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;

    const-string v2, "setting_fragment2"

    .line 360
    invoke-virtual {v0, v1, p1, v2}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    goto/16 :goto_0

    .line 363
    :cond_2
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->show(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    goto/16 :goto_0

    .line 342
    :cond_3
    iput v2, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->fragmentId:I

    .line 343
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    if-eqz p1, :cond_4

    .line 344
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->releaseCamera()V

    .line 345
    :cond_4
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    if-nez p1, :cond_5

    .line 346
    new-instance p1, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    invoke-direct {p1}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;-><init>()V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    const-string v2, "setting_fragment"

    .line 347
    invoke-virtual {v0, v1, p1, v2}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    goto/16 :goto_0

    .line 350
    :cond_5
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->show(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    goto/16 :goto_0

    .line 313
    :cond_6
    iput v2, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->fragmentId:I

    .line 314
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    if-eqz p1, :cond_7

    .line 315
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->releaseCamera()V

    .line 329
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u52a0\u8f7d\u5730\u56fe\uff1a\u8c37\u6b4c\u6a21\u5f0f\uff1a"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0f003d

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "\u5730\u56fe"

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->googleMapFragment:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    if-nez p1, :cond_8

    .line 331
    new-instance p1, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    invoke-direct {p1}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;-><init>()V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->googleMapFragment:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    const-string v2, "location_fragment"

    .line 332
    invoke-virtual {v0, v1, p1, v2}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    .line 335
    :cond_8
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->show(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    .line 302
    :cond_9
    iput v2, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->fragmentId:I

    .line 303
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    if-nez p1, :cond_a

    .line 304
    new-instance p1, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-direct {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;-><init>()V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    const-string v2, "camera_fragment"

    .line 305
    invoke-virtual {v0, v1, p1, v2}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    .line 308
    :cond_a
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->show(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 309
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->InitCameraView()V

    goto :goto_0

    .line 289
    :cond_b
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    if-eqz p1, :cond_c

    .line 290
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->releaseCamera()V

    :cond_c
    const/4 p1, 0x0

    .line 291
    iput p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->fragmentId:I

    .line 293
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->deviceFragment:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    if-nez p1, :cond_d

    .line 294
    new-instance p1, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    invoke-direct {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;-><init>()V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->deviceFragment:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    const-string v2, "main_fragment"

    .line 295
    invoke-virtual {v0, v1, p1, v2}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    .line 298
    :cond_d
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->show(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 370
    :goto_0
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method private showAlertDialog(Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;)V
    .locals 2

    .line 112
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 113
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 114
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->getContent()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/lenzetech/isearchingtwo/activity/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/lenzetech/isearchingtwo/activity/MainActivity$$ExternalSyntheticLambda0;-><init>(Lcom/lenzetech/isearchingtwo/activity/MainActivity;Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;)V

    const-string p1, "\u786e\u5b9a"

    .line 115
    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 v0, 0x0

    .line 119
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 120
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method synthetic lambda$showAlertDialog$0$com-lenzetech-isearchingtwo-activity-MainActivity(Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 116
    new-instance p2, Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->getWww()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p3, "android.intent.action.VIEW"

    invoke-direct {p2, p3, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 117
    invoke-virtual {p0, p2}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 182
    invoke-super {p0, p1}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->onCreate(Landroid/os/Bundle;)V

    .line 184
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->checkPermission()V

    const v0, 0x7f0b001f

    .line 187
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->setContentView(I)V

    const v0, 0x7f0800d7

    .line 189
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/bottomnavigation/BottomNavigationView;

    .line 190
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->mOnNavigationItemSelectedListener:Lcom/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemSelectedListener;

    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomnavigation/BottomNavigationView;->setOnNavigationItemSelectedListener(Lcom/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemSelectedListener;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 195
    invoke-direct {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->setFragment(I)V

    .line 199
    :cond_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget-object p1, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 206
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->InitBle(Landroidx/fragment/app/FragmentActivity;)V

    .line 207
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->startDiscovery()V

    .line 209
    invoke-static {}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->getInstance()Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    .line 231
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->moveTaskToBack(Z)Z

    return p1

    .line 234
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onMessageEvent(Lcom/lenzetech/isearchingtwo/application/MessageEvent;)V
    .locals 2
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 101
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->getEventType()Lcom/lenzetech/isearchingtwo/application/EventType;

    move-result-object v0

    sget-object v1, Lcom/lenzetech/isearchingtwo/application/EventType;->DEVICE_VERIFY:Lcom/lenzetech/isearchingtwo/application/EventType;

    if-ne v0, v1, :cond_1

    .line 102
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->getResponseBean()Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->getOpt()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 103
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->getResponseBean()Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->showAlertDialog(Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;)V

    .line 104
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->getDeviceMac()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->deleteItemByMac(Ljava/lang/String;)V

    goto :goto_0

    .line 105
    :cond_0
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->getResponseBean()Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->getOpt()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 106
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->finish()V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 3

    .line 247
    invoke-super {p0, p1}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 248
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "main_fragment"

    .line 251
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->deviceFragment:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    const-string v1, "camera_fragment"

    .line 253
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->cameraFragment:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    const-string v1, "\u5730\u56fe"

    const-string v2, "\u52a0\u8f7d\u5730\u56fe1\uff1a\u8c37\u6b4c\u6a21\u5f0f"

    .line 263
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "location_fragment"

    .line 265
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->googleMapFragment:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    const-string v1, "setting_fragment"

    .line 269
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    const-string v1, "setting_fragment2"

    .line 273
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->pdfFragment:Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;

    const-string v0, "fragment_id"

    .line 275
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->setFragment(I)V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 218
    invoke-super {p0}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->onResume()V

    const-string v0, "\u8fdb\u5165\u4e86\u524d\u53f0"

    const-string v1, "\u8bbe\u5907\u8fdb\u5165\u524d\u53f0"

    .line 219
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->UPDATERssi()V

    .line 223
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isLocationPermission()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isEnableGps()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 224
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->init(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 240
    iget v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->fragmentId:I

    const-string v1, "fragment_id"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 241
    invoke-super {p0, p1}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 88
    invoke-super {p0}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->onStart()V

    .line 89
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 94
    invoke-super {p0}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->onStop()V

    .line 95
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->unregister(Ljava/lang/Object;)V

    return-void
.end method
