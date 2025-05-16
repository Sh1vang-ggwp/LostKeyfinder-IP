.class public Lcom/lenzetech/isearchingtwo/activity/LocationActivity/ShowLocation;
.super Ljava/lang/Object;
.source "ShowLocation.java"


# static fields
.field private static sholdShow:Z = false

.field private static userLocationInfo:Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getUserLocationInfo()Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;
    .locals 1

    .line 17
    sget-object v0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/ShowLocation;->userLocationInfo:Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    return-object v0
.end method

.method public static isSholdShow()Z
    .locals 1

    .line 9
    sget-boolean v0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/ShowLocation;->sholdShow:Z

    return v0
.end method

.method public static setSholdShow(Z)V
    .locals 0

    .line 13
    sput-boolean p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/ShowLocation;->sholdShow:Z

    return-void
.end method

.method public static setUserLocationInfo(Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;)V
    .locals 0

    .line 21
    sput-object p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/ShowLocation;->userLocationInfo:Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    return-void
.end method
