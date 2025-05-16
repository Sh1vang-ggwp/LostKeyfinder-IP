.class public Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;
.super Lorg/litepal/crud/LitePalSupport;
.source "MyBleItem.java"


# instance fields
.field private addresss:Ljava/lang/String;

.field private battery:Ljava/lang/Integer;

.field private bleNickName:Ljava/lang/String;

.field private btnShowText:Ljava/lang/String;

.field private hasBattery:Ljava/lang/Boolean;

.field private imageByte:[B

.field public isAlarmOnDisconnect:Z

.field private isAlarming:Z

.field private isConnect:Z

.field private isMine:Z

.field private ringIndex:Ljava/lang/Integer;

.field private rssi:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 10
    invoke-direct {p0}, Lorg/litepal/crud/LitePalSupport;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->addresss:Ljava/lang/String;

    const-string v0, "iTAG"

    .line 18
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->bleNickName:Ljava/lang/String;

    const/4 v0, 0x0

    .line 55
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 23
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarmOnDisconnect:Z

    .line 25
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isConnect:Z

    .line 44
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->hasBattery:Ljava/lang/Boolean;

    .line 55
    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->battery:Ljava/lang/Integer;

    .line 63
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarming:Z

    .line 74
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0f0026

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->btnShowText:Ljava/lang/String;

    .line 85
    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->rssi:Ljava/lang/Integer;

    const/4 v1, 0x1

    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->ringIndex:Ljava/lang/Integer;

    .line 98
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isMine:Z

    return-void
.end method


# virtual methods
.method public getAddresss()Ljava/lang/String;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->addresss:Ljava/lang/String;

    return-object v0
.end method

.method public getBattery()Ljava/lang/Integer;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->battery:Ljava/lang/Integer;

    return-object v0
.end method

.method public getBleNickName()Ljava/lang/String;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->bleNickName:Ljava/lang/String;

    return-object v0
.end method

.method public getBtnShowText()Ljava/lang/String;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->btnShowText:Ljava/lang/String;

    return-object v0
.end method

.method public getHasBattery()Ljava/lang/Boolean;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->hasBattery:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getImageByte()[B
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->imageByte:[B

    return-object v0
.end method

.method public getRingIndex()Ljava/lang/Integer;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->ringIndex:Ljava/lang/Integer;

    return-object v0
.end method

.method public getRssi()Ljava/lang/Integer;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->rssi:Ljava/lang/Integer;

    return-object v0
.end method

.method public isAlarmOnDisconnect()Z
    .locals 1

    .line 142
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarmOnDisconnect:Z

    return v0
.end method

.method public isAlarming()Z
    .locals 1

    .line 28
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarming:Z

    return v0
.end method

.method public isConnect()Z
    .locals 1

    .line 110
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isConnect:Z

    return v0
.end method

.method public isMine()Z
    .locals 1

    .line 90
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isMine:Z

    return v0
.end method

.method public setAddresss(Ljava/lang/String;)V
    .locals 0

    .line 138
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->addresss:Ljava/lang/String;

    return-void
.end method

.method public setAlarmOnDisconnect(Z)V
    .locals 0

    .line 146
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarmOnDisconnect:Z

    return-void
.end method

.method public setAlarming(Z)V
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarming:Z

    return-void
.end method

.method public setBattery(Ljava/lang/Integer;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->battery:Ljava/lang/Integer;

    return-void
.end method

.method public setBleNickName(Ljava/lang/String;)V
    .locals 0

    .line 122
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->bleNickName:Ljava/lang/String;

    return-void
.end method

.method public setBtnShowText(Ljava/lang/String;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->btnShowText:Ljava/lang/String;

    return-void
.end method

.method public setConnect(Z)V
    .locals 0

    .line 114
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isConnect:Z

    return-void
.end method

.method public setHasBattery(Ljava/lang/Boolean;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->hasBattery:Ljava/lang/Boolean;

    return-void
.end method

.method public setImageByte([B)V
    .locals 0

    .line 130
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->imageByte:[B

    return-void
.end method

.method public setMine(Z)V
    .locals 0

    .line 94
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isMine:Z

    return-void
.end method

.method public setRingIndex(Ljava/lang/Integer;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->ringIndex:Ljava/lang/Integer;

    return-void
.end method

.method public setRssi(Ljava/lang/Integer;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->rssi:Ljava/lang/Integer;

    return-void
.end method
