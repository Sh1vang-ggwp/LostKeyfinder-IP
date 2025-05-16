.class public Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;
.super Ljava/lang/Object;
.source "VerifyDevice.java"


# instance fields
.field private appVersion:Ljava/lang/String;

.field private deviceAdvInfo:Ljava/lang/String;

.field private deviceCharacterInfo:Ljava/lang/String;

.field private deviceMac:Ljava/lang/String;

.field private deviceName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 44
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceName:Ljava/lang/String;

    .line 45
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceMac:Ljava/lang/String;

    .line 46
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceAdvInfo:Ljava/lang/String;

    .line 47
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceCharacterInfo:Ljava/lang/String;

    .line 48
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->appVersion:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAppVersion()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->appVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceAdvInfo()Ljava/lang/String;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceAdvInfo:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceCharacterInfo()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceCharacterInfo:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceMac()Ljava/lang/String;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceMac:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceName()Ljava/lang/String;
    .locals 1

    .line 5
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceName:Ljava/lang/String;

    return-object v0
.end method

.method public setAppVersion(Ljava/lang/String;)V
    .locals 0

    .line 25
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->appVersion:Ljava/lang/String;

    return-void
.end method

.method public setDeviceAdvInfo(Ljava/lang/String;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceAdvInfo:Ljava/lang/String;

    return-void
.end method

.method public setDeviceCharacterInfo(Ljava/lang/String;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceCharacterInfo:Ljava/lang/String;

    return-void
.end method

.method public setDeviceMac(Ljava/lang/String;)V
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceMac:Ljava/lang/String;

    return-void
.end method

.method public setDeviceName(Ljava/lang/String;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->deviceName:Ljava/lang/String;

    return-void
.end method
