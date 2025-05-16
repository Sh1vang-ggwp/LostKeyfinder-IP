.class public Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;
.super Ljava/lang/Object;
.source "UserDefaults.java"


# static fields
.field public static Lat:D = 0.0

.field public static Lon:D = 0.0

.field public static RecordListCount:I = 0x5

.field public static locationListCount:I = 0x1e


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLat()D
    .locals 2

    .line 22
    sget-wide v0, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->Lat:D

    return-wide v0
.end method

.method public static getLon()D
    .locals 2

    .line 14
    sget-wide v0, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->Lon:D

    return-wide v0
.end method

.method public static setLat(D)V
    .locals 0

    .line 26
    sput-wide p0, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->Lat:D

    return-void
.end method

.method public static setLon(D)V
    .locals 0

    .line 18
    sput-wide p0, Lcom/lenzetech/isearchingtwo/Utils/UserDefaults;->Lon:D

    return-void
.end method
