.class public Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;
.super Ljava/lang/Object;
.source "BlePermissionHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BlePermissionHelper"


# instance fields
.field private final OPEN_BLUETOOTH:I

.field public final REQUEST_BLUETOOTH_PERMISSIONS:I

.field public final REQUEST_GPS_PERMISSIONS:I

.field private final blPermissions:[Ljava/lang/String;

.field private final bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private final gpsPermissions:[Ljava/lang/String;

.field private final locationManager:Landroid/location/LocationManager;

.field private mActivity:Landroid/app/Activity;

.field private mContext:Landroid/content/Context;

.field private mDialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 4

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "android.permission.ACCESS_COARSE_LOCATION"

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 39
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->gpsPermissions:[Ljava/lang/String;

    const-string v0, "android.permission.BLUETOOTH_SCAN"

    const-string v1, "android.permission.BLUETOOTH_CONNECT"

    .line 40
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->blPermissions:[Ljava/lang/String;

    const/4 v0, 0x1

    .line 46
    iput v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->OPEN_BLUETOOTH:I

    const/16 v1, 0xca

    .line 47
    iput v1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->REQUEST_GPS_PERMISSIONS:I

    const/16 v1, 0x12f

    .line 48
    iput v1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->REQUEST_BLUETOOTH_PERMISSIONS:I

    .line 53
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mActivity:Landroid/app/Activity;

    .line 54
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    .line 55
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 56
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    const-string v2, "location"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->locationManager:Landroid/location/LocationManager;

    .line 57
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0f0051

    .line 58
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0f0065

    .line 59
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper$$ExternalSyntheticLambda0;

    invoke-direct {v3, p1}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;)V

    const p1, 0x7f0f007e

    .line 60
    invoke-virtual {v2, p1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v2, 0x7f0f0022

    const/4 v3, 0x0

    .line 65
    invoke-virtual {p1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 67
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mDialog:Landroid/app/AlertDialog;

    .line 68
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "android.permission.ACCESS_COARSE_LOCATION"

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 39
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->gpsPermissions:[Ljava/lang/String;

    const-string v0, "android.permission.BLUETOOTH_SCAN"

    const-string v1, "android.permission.BLUETOOTH_CONNECT"

    .line 40
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->blPermissions:[Ljava/lang/String;

    const/4 v0, 0x1

    .line 46
    iput v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->OPEN_BLUETOOTH:I

    const/16 v0, 0xca

    .line 47
    iput v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->REQUEST_GPS_PERMISSIONS:I

    const/16 v0, 0x12f

    .line 48
    iput v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->REQUEST_BLUETOOTH_PERMISSIONS:I

    .line 72
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    .line 73
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 74
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    const-string v0, "location"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/location/LocationManager;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->locationManager:Landroid/location/LocationManager;

    return-void
.end method

.method static synthetic lambda$new$0(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 2

    .line 61
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object p2

    const-string v0, "package"

    const/4 v1, 0x0

    invoke-static {v0, p2, v1}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    .line 63
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 64
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public checkNOpenBl()Z
    .locals 4

    .line 115
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isBlPermission()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 116
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->requestBlePermissions()V

    return v1

    .line 119
    :cond_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isEnableBluetooth()Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    .line 121
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 122
    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return v1

    :cond_1
    return v2
.end method

.method public checkNOpenGps()Z
    .locals 4

    .line 100
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isLocationPermission()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 101
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->requestGpsPermissions()V

    return v1

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isEnableGps()Z

    move-result v0

    if-nez v0, :cond_1

    .line 105
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mActivity:Landroid/app/Activity;

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.settings.LOCATION_SOURCE_SETTINGS"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return v1

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public isBlPermission()Z
    .locals 3

    .line 157
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x1f

    if-lt v0, v2, :cond_1

    .line 158
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.BLUETOOTH_SCAN"

    .line 159
    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public isEnableBluetooth()Z
    .locals 1

    .line 139
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isSupportBLE()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    return v0
.end method

.method public isEnableGps()Z
    .locals 2

    .line 146
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->locationManager:Landroid/location/LocationManager;

    const-string v1, "gps"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->locationManager:Landroid/location/LocationManager;

    const-string v1, "network"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isLocationPermission()Z
    .locals 2

    .line 151
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 152
    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isPermission(Ljava/lang/String;)Z
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isSupportBLE()Z
    .locals 2

    .line 131
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.bluetooth_le"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public requestBlePermissions()V
    .locals 3

    .line 89
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isBlPermission()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "BlePermissionHelper"

    const-string v1, "request bl "

    .line 91
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->blPermissions:[Ljava/lang/String;

    const/16 v2, 0x12f

    invoke-static {v0, v1, v2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public requestGpsPermissions()V
    .locals 3

    .line 79
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 80
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isLocationPermission()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "BlePermissionHelper"

    const-string v1, "request gps permission"

    .line 81
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->gpsPermissions:[Ljava/lang/String;

    const/16 v2, 0xca

    invoke-static {v0, v1, v2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public requestPermission(Ljava/lang/String;I)V
    .locals 3

    .line 183
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1, p2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public showSetPermissionDialogIfDeny(Ljava/lang/String;I)V
    .locals 1

    const/16 v0, 0x12f

    if-eq p2, v0, :cond_0

    const/16 v0, 0xca

    if-ne p2, v0, :cond_1

    .line 173
    :cond_0
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mActivity:Landroid/app/Activity;

    invoke-static {p2, p1}, Landroidx/core/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mActivity:Landroid/app/Activity;

    invoke-static {p2, p1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p2

    if-eqz p2, :cond_1

    .line 174
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "show dialog"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "BlePermissionHelper"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result p1

    if-nez p1, :cond_1

    .line 176
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    :cond_1
    return-void
.end method
