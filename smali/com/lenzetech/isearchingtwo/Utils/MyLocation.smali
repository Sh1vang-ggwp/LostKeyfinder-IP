.class public Lcom/lenzetech/isearchingtwo/Utils/MyLocation;
.super Ljava/lang/Object;
.source "MyLocation.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MyLocation"

.field public static location:Landroid/location/Location;

.field private static myLocation:Lcom/lenzetech/isearchingtwo/Utils/MyLocation;


# instance fields
.field private fusedLocationProviderClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

.field locationListener:Landroid/location/LocationListener;

.field private locationManager:Landroid/location/LocationManager;

.field private locationProvider:Ljava/lang/String;

.field private locationRequest:Lcom/google/android/gms/location/LocationRequest;

.field private mContext:Landroid/content/Context;

.field public userLocationInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    new-instance v0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation$2;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation$2;-><init>(Lcom/lenzetech/isearchingtwo/Utils/MyLocation;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationListener:Landroid/location/LocationListener;

    .line 284
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/Utils/MyLocation;Landroid/location/Location;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->setLocation(Landroid/location/Location;)V

    return-void
.end method

.method private getAddressFromLocation(Landroid/location/Location;)Ljava/lang/String;
    .locals 6

    .line 271
    new-instance v0, Landroid/location/Geocoder;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->mContext:Landroid/content/Context;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    .line 273
    :try_start_0
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v3

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 274
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 275
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/location/Address;

    .line 276
    invoke-virtual {p1, v0}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 279
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;
    .locals 1

    .line 71
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->myLocation:Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    if-nez v0, :cond_0

    .line 74
    new-instance v0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;-><init>()V

    sput-object v0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->myLocation:Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    .line 76
    :cond_0
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->myLocation:Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    return-object v0
.end method

.method private getLocation()V
    .locals 7

    .line 82
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->mContext:Landroid/content/Context;

    const-string v1, "location"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationManager:Landroid/location/LocationManager;

    const/4 v1, 0x1

    .line 84
    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getProviders(Z)Ljava/util/List;

    move-result-object v0

    const-string v1, "network"

    .line 85
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 88
    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationProvider:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v1, "gps"

    .line 89
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 92
    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationProvider:Ljava/lang/String;

    .line 99
    :goto_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationManager:Landroid/location/LocationManager;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationProvider:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 101
    invoke-direct {p0, v0}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->setLocation(Landroid/location/Location;)V

    .line 104
    :cond_1
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationManager:Landroid/location/LocationManager;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationProvider:Ljava/lang/String;

    const-wide/32 v3, 0x1d4c0

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationListener:Landroid/location/LocationListener;

    invoke-virtual/range {v1 .. v6}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 105
    new-instance v0, Lcom/google/android/gms/location/LocationRequest$Builder;

    const-wide/32 v1, 0xea60

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/location/LocationRequest$Builder;-><init>(J)V

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/google/android/gms/location/LocationRequest$Builder;->setPriority(I)Lcom/google/android/gms/location/LocationRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/location/LocationRequest$Builder;->build()Lcom/google/android/gms/location/LocationRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationRequest:Lcom/google/android/gms/location/LocationRequest;

    .line 106
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/location/LocationServices;->getFusedLocationProviderClient(Landroid/content/Context;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->fusedLocationProviderClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 108
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->locationRequest:Lcom/google/android/gms/location/LocationRequest;

    new-instance v2, Lcom/lenzetech/isearchingtwo/Utils/MyLocation$1;

    invoke-direct {v2, p0}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation$1;-><init>(Lcom/lenzetech/isearchingtwo/Utils/MyLocation;)V

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/location/FusedLocationProviderClient;->requestLocationUpdates(Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/LocationCallback;Landroid/os/Looper;)Lcom/google/android/gms/tasks/Task;

    :cond_2
    return-void
.end method

.method private setLocation(Landroid/location/Location;)V
    .locals 3

    .line 120
    sput-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->location:Landroid/location/Location;

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u7eac\u5ea6\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, "\u7ecf\u5ea6\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MyLocation"

    .line 122
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public getCurrentLocation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const-string v0, "\u5b9a\u4f4d"

    const-string v1, "\u8fdb\u5165\u65b9\u6cd5"

    .line 232
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    new-instance v0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;-><init>()V

    .line 246
    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->setLostName(Ljava/lang/String;)V

    .line 248
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->location:Landroid/location/Location;

    invoke-direct {p0, p1}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getAddressFromLocation(Landroid/location/Location;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->setAddressInfo(Ljava/lang/String;)V

    .line 250
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->location:Landroid/location/Location;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->setLat(Ljava/lang/Double;)V

    .line 251
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->location:Landroid/location/Location;

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->setLon(Ljava/lang/Double;)V

    .line 253
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->location:Landroid/location/Location;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->setLat(D)V

    .line 254
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->location:Landroid/location/Location;

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->setLon(D)V

    .line 256
    invoke-virtual {v0, p2}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->setBleMac(Ljava/lang/String;)V

    .line 261
    new-instance p1, Ljava/text/SimpleDateFormat;

    const-string p2, "yyyy-MM-dd HH:mm:ss "

    invoke-direct {p1, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 262
    new-instance p2, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-direct {p2, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 263
    invoke-virtual {p1, p2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    .line 265
    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->setDateString(Ljava/lang/String;)V

    .line 267
    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->save()Z

    return-void
.end method

.method public getLocationByIndex(I)Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;
    .locals 1

    .line 295
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 298
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    return-object p1
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->mContext:Landroid/content/Context;

    .line 67
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getLocation()V

    return-void
.end method

.method public upDateLocationDate()V
    .locals 2

    .line 288
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 289
    const-class v0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    const/4 v1, 0x0

    new-array v1, v1, [J

    invoke-static {v0, v1}, Lorg/litepal/LitePal;->findAll(Ljava/lang/Class;[J)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    return-void
.end method
