.class public Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;
.super Landroid/widget/ArrayAdapter;
.source "LocatioitemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public bleimg:Landroid/widget/ImageView;

.field geocoderHandler:Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;

.field googleMapFragment:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

.field mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private resourceId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;",
            ">;)V"
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 39
    iput p2, p0, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->resourceId:I

    .line 40
    iput-object p3, p0, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->mData:Ljava/util/List;

    return-void
.end method

.method public static isZh(Landroid/content/Context;)Z
    .locals 1

    .line 113
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 114
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    const-string v0, "zh"

    .line 115
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public getData()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;",
            ">;"
        }
    .end annotation

    .line 44
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->mData:Ljava/util/List;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 54
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object p2

    iget-object p2, p2, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    sget v0, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->locationListCount:I

    if-le p2, v0, :cond_0

    .line 55
    sget p2, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->locationListCount:I

    add-int/lit8 p2, p2, -0x1

    sub-int/2addr p2, p1

    invoke-virtual {p0, p2}, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    goto :goto_0

    .line 57
    :cond_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object p2

    iget-object p2, p2, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->userLocationInfoList:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    sub-int/2addr p2, p1

    invoke-virtual {p0, p2}, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    .line 62
    :goto_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    iget v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->resourceId:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    const p3, 0x7f0800c2

    .line 63
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->bleimg:Landroid/widget/ImageView;

    .line 66
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p3

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->getBleMac()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getBleItemByMac(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    move-result-object p3

    if-eqz p3, :cond_3

    .line 71
    invoke-virtual {p3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v0

    const-string v1, "\u8fdb\u5165\u84dd\u7259\u8bbe\u7f6e"

    if-eqz v0, :cond_2

    invoke-virtual {p3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v0

    array-length v0, v0

    if-gtz v0, :cond_1

    goto :goto_1

    :cond_1
    const-string v0, "\u5f97\u5230\u7528\u6237\u81ea\u5b9a\u4e49\u7684\u56fe\u7247"

    .line 75
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-virtual {p3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object p3

    const/4 v0, 0x0

    invoke-static {p3, v0}, Lcom/lenzetech/isearchingtwo/Utils/ImageDispose;->getPicFromBytes([BLandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p3

    .line 79
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->bleimg:Landroid/widget/ImageView;

    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_2

    :cond_2
    :goto_1
    const-string p3, "\u7528\u6237\u56fe\u7247\u4fe1\u606f\u4e3a\u7a7a,\u4e0d\u505a\u5904\u7406"

    .line 72
    invoke-static {v1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_2
    const p3, 0x7f08014f

    .line 85
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    const v0, 0x7f0800c3

    .line 86
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 87
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->getLostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0800c4

    .line 88
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 89
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->getDateString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->getGoogleaddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p2
.end method
