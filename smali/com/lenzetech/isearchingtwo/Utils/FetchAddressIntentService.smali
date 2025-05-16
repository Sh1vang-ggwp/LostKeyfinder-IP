.class public Lcom/lenzetech/isearchingtwo/Utils/FetchAddressIntentService;
.super Landroid/app/IntentService;
.source "FetchAddressIntentService.java"


# static fields
.field public static final FAILURE_RESULT:I = 0x1

.field public static final LATLNG_DATA_EXTRA:Ljava/lang/String; = "com.example.mylocationdemo.LATLNG_DATA_EXTRA"

.field public static final PACKAGE_NAME:Ljava/lang/String; = "com.example.mylocationdemo"

.field public static final RECEIVER:Ljava/lang/String; = "com.example.mylocationdemo.RECEIVER"

.field public static final RESULT_DATA_KEY:Ljava/lang/String; = "com.example.mylocationdemo.RESULT_DATA_KEY"

.field public static final SUCCESS_RESULT:I


# instance fields
.field private final TAG:Ljava/lang/String;

.field protected mReceiver:Landroid/os/ResultReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string v0, "AddressIntentService"

    .line 47
    invoke-direct {p0, v0}, Lcom/lenzetech/isearchingtwo/Utils/FetchAddressIntentService;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    const-string p1, "FetchAddress"

    .line 25
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/FetchAddressIntentService;->TAG:Ljava/lang/String;

    return-void
.end method

.method private deliverResultToReceiver(ILjava/lang/String;)V
    .locals 2

    .line 51
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "com.example.mylocationdemo.RESULT_DATA_KEY"

    .line 52
    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/Utils/FetchAddressIntentService;->mReceiver:Landroid/os/ResultReceiver;

    invoke-virtual {p2, p1, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 8

    const-string v0, "FetchAddress"

    .line 59
    new-instance v1, Landroid/location/Geocoder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    const-string v2, "com.example.mylocationdemo.LATLNG_DATA_EXTRA"

    .line 63
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/maps/model/LatLng;

    const-string v3, "com.example.mylocationdemo.RECEIVER"

    .line 65
    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/os/ResultReceiver;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/FetchAddressIntentService;->mReceiver:Landroid/os/ResultReceiver;

    const/4 p1, 0x0

    .line 70
    :try_start_0
    iget-wide v3, v2, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    iget-wide v5, v2, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    const/4 v7, 0x5

    move-wide v2, v3

    move-wide v4, v5

    move v6, v7

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, ""

    goto :goto_0

    :catch_0
    const-string v1, "invalid_lat_long_used"

    .line 81
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    const-string v1, "service_not_available"

    .line 77
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    if-eqz p1, :cond_2

    .line 85
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    :cond_0
    const/4 v1, 0x0

    .line 92
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/location/Address;

    .line 93
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    .line 95
    :goto_1
    invoke-virtual {p1}, Landroid/location/Address;->getMaxAddressLineIndex()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 96
    invoke-virtual {p1, v3}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    const-string p1, "address_found"

    .line 98
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "line.separator"

    .line 100
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    .line 99
    invoke-direct {p0, v1, p1}, Lcom/lenzetech/isearchingtwo/Utils/FetchAddressIntentService;->deliverResultToReceiver(ILjava/lang/String;)V

    goto :goto_3

    .line 86
    :cond_2
    :goto_2
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    const-string v1, "no_address_found"

    .line 88
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    const/4 p1, 0x1

    .line 90
    invoke-direct {p0, p1, v1}, Lcom/lenzetech/isearchingtwo/Utils/FetchAddressIntentService;->deliverResultToReceiver(ILjava/lang/String;)V

    :goto_3
    return-void
.end method
