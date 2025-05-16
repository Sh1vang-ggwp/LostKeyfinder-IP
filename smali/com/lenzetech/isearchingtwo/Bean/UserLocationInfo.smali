.class public Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;
.super Lorg/litepal/crud/LitePalSupport;
.source "UserLocationInfo.java"


# instance fields
.field private addressInfo:Ljava/lang/String;

.field private bleMac:Ljava/lang/String;

.field private dateString:Ljava/lang/String;

.field private googleaddress:Ljava/lang/String;

.field private isAmapHistroy:Z

.field private lat:Ljava/lang/Double;

.field private lon:Ljava/lang/Double;

.field private lostName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 5
    invoke-direct {p0}, Lorg/litepal/crud/LitePalSupport;-><init>()V

    const/4 v0, 0x1

    .line 91
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->isAmapHistroy:Z

    return-void
.end method


# virtual methods
.method public getAddressInfo()Ljava/lang/String;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->addressInfo:Ljava/lang/String;

    return-object v0
.end method

.method public getBleMac()Ljava/lang/String;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->bleMac:Ljava/lang/String;

    return-object v0
.end method

.method public getDateString()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->dateString:Ljava/lang/String;

    return-object v0
.end method

.method public getGoogleaddress()Ljava/lang/String;
    .locals 1

    .line 10
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->googleaddress:Ljava/lang/String;

    return-object v0
.end method

.method public getLat()Ljava/lang/Double;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->lat:Ljava/lang/Double;

    return-object v0
.end method

.method public getLon()Ljava/lang/Double;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->lon:Ljava/lang/Double;

    return-object v0
.end method

.method public getLostName()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->lostName:Ljava/lang/String;

    return-object v0
.end method

.method public isAmapHistroy()Z
    .locals 1

    .line 83
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->isAmapHistroy:Z

    return v0
.end method

.method public setAddressInfo(Ljava/lang/String;)V
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->addressInfo:Ljava/lang/String;

    return-void
.end method

.method public setAmapHistroy(Z)V
    .locals 0

    .line 87
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->isAmapHistroy:Z

    return-void
.end method

.method public setBleMac(Ljava/lang/String;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->bleMac:Ljava/lang/String;

    return-void
.end method

.method public setDateString(Ljava/lang/String;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->dateString:Ljava/lang/String;

    return-void
.end method

.method public setGoogleaddress(Ljava/lang/String;)V
    .locals 0

    .line 14
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->googleaddress:Ljava/lang/String;

    return-void
.end method

.method public setLat(Ljava/lang/Double;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->lat:Ljava/lang/Double;

    return-void
.end method

.method public setLon(Ljava/lang/Double;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->lon:Ljava/lang/Double;

    return-void
.end method

.method public setLostName(Ljava/lang/String;)V
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->lostName:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UserLocationInfo{lostName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->lostName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", googleaddress=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->googleaddress:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", addressInfo=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->addressInfo:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", bleMac=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->bleMac:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", lat="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->lat:Ljava/lang/Double;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", lon="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->lon:Ljava/lang/Double;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", dateString=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->dateString:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", isAmapHistroy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->isAmapHistroy:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
