.class public Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "LocaitonList.java"

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "LocaitonList"


# instance fields
.field backBtn:Landroid/widget/Button;

.field geocoderHandler:Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;

.field protected lastLocation:Landroid/location/Location;

.field listView:Landroid/widget/ListView;

.field private resultReceiver:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;

.field private userLocationInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->userLocationInfoList:Ljava/util/List;

    return-void
.end method

.method private InitList()V
    .locals 9

    const v0, 0x7f080005

    .line 86
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->listView:Landroid/widget/ListView;

    .line 88
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 93
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object v0

    iget-object v0, v0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sget v1, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->locationListCount:I

    if-le v0, v1, :cond_0

    .line 94
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object v0

    iget-object v0, v0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 95
    sget v1, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->locationListCount:I

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    .line 96
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->userLocationInfoList:Ljava/util/List;

    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object v3

    iget-object v3, v3, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    add-int/lit8 v4, v0, -0x1

    sub-int/2addr v4, v1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 99
    :cond_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object v0

    iget-object v0, v0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v1, v0

    :goto_1
    if-ltz v1, :cond_1

    .line 102
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->userLocationInfoList:Ljava/util/List;

    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object v3

    iget-object v3, v3, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    sub-int v4, v0, v1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 106
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "InitList: userLocationInfoList.size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LocaitonList"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    new-instance v0, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0b0042

    iget-object v4, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->userLocationInfoList:Ljava/util/List;

    invoke-direct {v0, v2, v3, v4}, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 111
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->listView:Landroid/widget/ListView;

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    const v0, 0x7f080127

    .line 113
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->backBtn:Landroid/widget/Button;

    .line 114
    new-instance v2, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$2;

    invoke-direct {v2, p0}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$2;-><init>(Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->listView:Landroid/widget/ListView;

    new-instance v2, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$3;

    invoke-direct {v2, p0}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$3;-><init>(Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;)V

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 149
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    .line 150
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "upDateLocationDate: item="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->geocoderHandler:Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;

    invoke-virtual {v4}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->getLat()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    invoke-virtual {v4}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->getLon()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    invoke-virtual/range {v3 .. v8}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->send(Ljava/lang/Object;DD)V

    goto :goto_2

    :cond_2
    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;Ljava/lang/String;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->updateListGeocode(Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;Ljava/lang/String;)V

    return-void
.end method

.method private updateListGeocode(Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;Ljava/lang/String;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->userLocationInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    if-ne v1, p1, :cond_1

    .line 184
    invoke-virtual {v1, p2}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->setGoogleaddress(Ljava/lang/String;)V

    .line 188
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "updateListGeocode: size="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->userLocationInfoList:Ljava/util/List;

    .line 189
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ",item="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "LocaitonList"

    .line 188
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    new-instance p1, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$4;

    invoke-direct {p1, p0}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$4;-><init>(Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;)V

    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public onConnected(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0

    return-void
.end method

.method public onConnectionSuspended(I)V
    .locals 0

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 45
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001e

    .line 46
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->setContentView(I)V

    .line 48
    new-instance p1, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$1;

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$1;-><init>(Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->geocoderHandler:Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;

    .line 55
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->start()V

    .line 59
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->upDateLocationDate()V

    .line 65
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->InitList()V

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .line 73
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    return-void
.end method

.method protected startIntentService()V
    .locals 3

    .line 156
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lenzetech/isearchingtwo/Utils/FetchAddressIntentService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 157
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->resultReceiver:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;

    const-string v2, "com.google.android.gms.extras.resultReceiver"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 159
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method
