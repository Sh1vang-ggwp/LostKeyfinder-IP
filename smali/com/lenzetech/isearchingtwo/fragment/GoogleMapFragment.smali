.class public Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;
.super Landroidx/fragment/app/Fragment;
.source "GoogleMapFragment.java"

# interfaces
.implements Lcom/google/android/gms/maps/OnMapReadyCallback;
.implements Lcom/google/android/gms/maps/GoogleMap$OnMyLocationButtonClickListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/google/android/gms/maps/GoogleMap$OnMarkerDragListener;
.implements Lcom/google/android/gms/maps/GoogleMap$OnCameraMoveStartedListener;
.implements Lcom/google/android/gms/maps/GoogleMap$OnCameraMoveCanceledListener;
.implements Landroidx/core/app/ActivityCompat$OnRequestPermissionsResultCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;
    }
.end annotation


# static fields
.field private static final KEY_CAMERA_POSITION:Ljava/lang/String; = "camera_position"

.field private static final KEY_LOCATION:Ljava/lang/String; = "location"

.field private static final LOCATION_PERMISSION_REQUEST_CODE:I = 0x1

.field public static START_FORRESULT:I = 0x7b

.field private static final TAG:Ljava/lang/String; = "LocationFragment"

.field static googleMapFragment:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;


# instance fields
.field button:Landroid/widget/TextView;

.field private cameraPosition:Lcom/google/android/gms/maps/model/CameraPosition;

.field private currPolylineOptions:Lcom/google/android/gms/maps/model/PolylineOptions;

.field public fusedLocationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

.field private googleMapView:Lcom/google/android/gms/maps/MapView;

.field private isCanceled:Z

.field private lastLatLng:Lcom/google/android/gms/maps/model/LatLng;

.field private mAddressRequested:Z

.field private mContentView:Landroid/view/View;

.field public mLastLocation:Landroid/location/Location;

.field private mMap:Lcom/google/android/gms/maps/GoogleMap;

.field private mPermissionDenied:Z

.field private mResultReceiver:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;

.field private perth:Lcom/google/android/gms/maps/model/Marker;

.field private perthLatLng:Lcom/google/android/gms/maps/model/LatLng;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 112
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/4 v0, 0x0

    .line 73
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mPermissionDenied:Z

    const/4 v1, 0x0

    .line 110
    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->fusedLocationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 422
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->isCanceled:Z

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;)Lcom/google/android/gms/maps/GoogleMap;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    return-object p0
.end method

.method private checkIsGooglePlayConn()V
    .locals 5

    .line 229
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    if-eqz v0, :cond_0

    .line 230
    new-instance v0, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    invoke-virtual {v3}, Landroid/location/Location;->getLongitude()D

    move-result-wide v3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->startIntentService(Lcom/google/android/gms/maps/model/LatLng;)V

    :cond_0
    const/4 v0, 0x1

    .line 232
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mAddressRequested:Z

    return-void
.end method

.method private displayPerth(ZLcom/google/android/gms/maps/model/LatLng;)V
    .locals 2

    .line 354
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->perth:Lcom/google/android/gms/maps/model/Marker;

    if-nez v0, :cond_0

    .line 355
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v1, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v1}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    invoke-virtual {v1, p2}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object p2

    const-string v1, "Your Position"

    invoke-virtual {p2, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object p2

    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->perth:Lcom/google/android/gms/maps/model/Marker;

    .line 356
    invoke-virtual {p2, p1}, Lcom/google/android/gms/maps/model/Marker;->setDraggable(Z)V

    :cond_0
    return-void
.end method

.method private enableMyLocation()V
    .locals 3

    .line 239
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 242
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/app/AppCompatActivity;

    invoke-static {v0, v2, v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils;->requestPermission(Landroidx/appcompat/app/AppCompatActivity;ILjava/lang/String;Z)V

    goto :goto_0

    .line 244
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_1

    .line 246
    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 247
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->fusedLocationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    invoke-interface {v0}, Lcom/google/android/gms/location/FusedLocationProviderClient;->getLastLocation()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    .line 248
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    new-instance v2, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$$ExternalSyntheticLambda0;-><init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    :cond_1
    :goto_0
    return-void
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;
    .locals 1

    .line 101
    sget-object v0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->googleMapFragment:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    if-eqz v0, :cond_0

    return-object v0

    .line 104
    :cond_0
    new-instance v0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;-><init>()V

    return-object v0
.end method

.method private initCamera(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 2

    .line 365
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;

    invoke-direct {v1, p0, p1}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;-><init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;Lcom/google/android/gms/maps/model/LatLng;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 380
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private showMissingPermissionError()V
    .locals 3

    const/4 v0, 0x1

    .line 315
    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->newInstance(Z)Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-string v2, "dialog"

    invoke-virtual {v0, v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getGoogleLocation()V
    .locals 3

    .line 482
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v1}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, v1}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 492
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->fusedLocationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    invoke-interface {v0}, Lcom/google/android/gms/location/FusedLocationProviderClient;->getLastLocation()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    new-instance v2, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$2;

    invoke-direct {v2, p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$2;-><init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method synthetic lambda$enableMyLocation$0$com-lenzetech-isearchingtwo-fragment-GoogleMapFragment(Lcom/google/android/gms/tasks/Task;)V
    .locals 4

    .line 249
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 250
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/location/Location;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    if-eqz p1, :cond_0

    .line 252
    new-instance p1, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    .line 253
    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->lastLatLng:Lcom/google/android/gms/maps/model/LatLng;

    const/4 v0, 0x1

    .line 255
    invoke-direct {p0, v0, p1}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->displayPerth(ZLcom/google/android/gms/maps/model/LatLng;)V

    .line 256
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->lastLatLng:Lcom/google/android/gms/maps/model/LatLng;

    invoke-direct {p0, p1}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->initCamera(Lcom/google/android/gms/maps/model/LatLng;)V

    :cond_0
    return-void
.end method

.method public notifyPosition(DDLjava/lang/String;)V
    .locals 2

    .line 519
    new-instance v0, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    invoke-direct {v1, p3, p4, p1, p2}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 520
    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object p1

    invoke-virtual {p1, p5}, Lcom/google/android/gms/maps/model/MarkerOptions;->title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object p1

    .line 522
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 505
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onCameraMoveCanceled()V
    .locals 2

    .line 454
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->currPolylineOptions:Lcom/google/android/gms/maps/model/PolylineOptions;

    if-eqz v0, :cond_0

    .line 455
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/GoogleMap;->addPolyline(Lcom/google/android/gms/maps/model/PolylineOptions;)Lcom/google/android/gms/maps/model/Polyline;

    :cond_0
    const/4 v0, 0x1

    .line 457
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->isCanceled:Z

    const/4 v0, 0x0

    .line 458
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->currPolylineOptions:Lcom/google/android/gms/maps/model/PolylineOptions;

    const-string v0, "LocationFragment"

    const-string v1, "onCameraMoveCancelled"

    .line 459
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onCameraMoveStarted(I)V
    .locals 2

    .line 433
    new-instance v0, Lcom/google/android/gms/maps/model/PolylineOptions;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/PolylineOptions;-><init>()V

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/PolylineOptions;->width(F)Lcom/google/android/gms/maps/model/PolylineOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->currPolylineOptions:Lcom/google/android/gms/maps/model/PolylineOptions;

    const/4 v1, 0x1

    if-eq p1, v1, :cond_2

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    const-string p1, "UNKNOWN_REASON"

    goto :goto_0

    :cond_0
    const p1, -0xff0100

    .line 444
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/PolylineOptions;->color(I)Lcom/google/android/gms/maps/model/PolylineOptions;

    const-string p1, "DEVELOPER_ANIMATION"

    goto :goto_0

    :cond_1
    const/high16 p1, -0x10000

    .line 440
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/PolylineOptions;->color(I)Lcom/google/android/gms/maps/model/PolylineOptions;

    const-string p1, "API_ANIMATION"

    goto :goto_0

    :cond_2
    const p1, -0xffff01

    .line 436
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/PolylineOptions;->color(I)Lcom/google/android/gms/maps/model/PolylineOptions;

    const-string p1, "GESTURE"

    .line 448
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onCameraMoveStarted("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "LocationFragment"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 414
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f08009f

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 416
    :cond_0
    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 417
    sget v0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->START_FORRESULT:I

    invoke-virtual {p0, p1, v0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 118
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string v0, "location"

    .line 120
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/location/Location;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    const-string v0, "camera_position"

    .line 121
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/maps/model/CameraPosition;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->cameraPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 123
    :cond_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/location/LocationServices;->getFusedLocationProviderClient(Landroid/app/Activity;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->fusedLocationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const v0, 0x7f0b003c

    const/4 v1, 0x0

    .line 130
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mContentView:Landroid/view/View;

    const p2, 0x7f0800a0

    .line 131
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/maps/MapView;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->googleMapView:Lcom/google/android/gms/maps/MapView;

    .line 132
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mContentView:Landroid/view/View;

    const p2, 0x7f08009f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->button:Landroid/widget/TextView;

    .line 133
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->googleMapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {p1, p3}, Lcom/google/android/gms/maps/MapView;->onCreate(Landroid/os/Bundle;)V

    .line 136
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->googleMapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {p1}, Lcom/google/android/gms/maps/MapView;->onResume()V

    .line 139
    new-instance p1, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;

    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    invoke-direct {p1, p0, p2}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;-><init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mResultReceiver:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;

    .line 148
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->googleMapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/maps/MapView;->getMapAsync(Lcom/google/android/gms/maps/OnMapReadyCallback;)V

    .line 149
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/maps/MapsInitializer;->initialize(Landroid/content/Context;)I

    .line 153
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/maps/MapsInitializer;->initialize(Landroid/content/Context;)I

    .line 157
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mContentView:Landroid/view/View;

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->googleMapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onDestroy()V

    .line 204
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onLowMemory()V
    .locals 1

    .line 209
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onLowMemory()V

    .line 210
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->googleMapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onLowMemory()V

    return-void
.end method

.method public onMapReady(Lcom/google/android/gms/maps/GoogleMap;)V
    .locals 0

    .line 215
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 216
    invoke-virtual {p1, p0}, Lcom/google/android/gms/maps/GoogleMap;->setOnMyLocationButtonClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMyLocationButtonClickListener;)V

    .line 217
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/maps/GoogleMap;->setOnMarkerDragListener(Lcom/google/android/gms/maps/GoogleMap$OnMarkerDragListener;)V

    .line 218
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/maps/GoogleMap;->setOnCameraMoveStartedListener(Lcom/google/android/gms/maps/GoogleMap$OnCameraMoveStartedListener;)V

    .line 219
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/maps/GoogleMap;->setOnCameraMoveCanceledListener(Lcom/google/android/gms/maps/GoogleMap$OnCameraMoveCanceledListener;)V

    .line 221
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->enableMyLocation()V

    return-void
.end method

.method public onMarkerDrag(Lcom/google/android/gms/maps/model/Marker;)V
    .locals 0

    return-void
.end method

.method public onMarkerDragEnd(Lcom/google/android/gms/maps/model/Marker;)V
    .locals 0

    .line 406
    invoke-virtual {p1}, Lcom/google/android/gms/maps/model/Marker;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->perthLatLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 407
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->startIntentService(Lcom/google/android/gms/maps/model/LatLng;)V

    return-void
.end method

.method public onMarkerDragStart(Lcom/google/android/gms/maps/model/Marker;)V
    .locals 0

    return-void
.end method

.method public onMyLocationButtonClick()Z
    .locals 4

    .line 272
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    if-eqz v0, :cond_0

    .line 273
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Latitude-->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MapsActivity"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Longitude-->"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->lastLatLng:Lcom/google/android/gms/maps/model/LatLng;

    if-eqz v0, :cond_1

    .line 279
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->perth:Lcom/google/android/gms/maps/model/Marker;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/model/Marker;->setPosition(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 280
    :cond_1
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->checkIsGooglePlayConn()V

    const/4 v0, 0x0

    return v0
.end method

.method public onPause()V
    .locals 1

    .line 171
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 172
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->googleMapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onPause()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    return-void

    :cond_0
    const-string p1, "android.permission.ACCESS_FINE_LOCATION"

    .line 300
    invoke-static {p2, p3, p1}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils;->isPermissionGranted([Ljava/lang/String;[ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 303
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->enableMyLocation()V

    goto :goto_0

    .line 306
    :cond_1
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mPermissionDenied:Z

    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 184
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 185
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->googleMapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onResume()V

    .line 186
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mPermissionDenied:Z

    if-eqz v0, :cond_0

    .line 188
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->showMissingPermissionError()V

    const/4 v0, 0x0

    .line 189
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mPermissionDenied:Z

    :cond_0
    const-string v0, "LocationFragment"

    const-string v1, "onResume: "

    .line 191
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 162
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 163
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_0

    .line 164
    invoke-virtual {v0}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v0

    const-string v1, "camera_position"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 165
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mLastLocation:Landroid/location/Location;

    const-string v1, "location"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 178
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    const-string v0, "LocationFragment"

    const-string v1, "onStart: "

    .line 179
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onStop()V
    .locals 2

    .line 197
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    const-string v0, "LocationFragment"

    const-string v1, "onStop: "

    .line 198
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected startIntentService(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 3

    .line 288
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/lenzetech/isearchingtwo/Utils/FetchAddressIntentService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 289
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->mResultReceiver:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;

    const-string v2, "com.example.mylocationdemo.RECEIVER"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v1, "com.example.mylocationdemo.LATLNG_DATA_EXTRA"

    .line 290
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 291
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method
