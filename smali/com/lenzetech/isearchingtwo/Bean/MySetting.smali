.class public Lcom/lenzetech/isearchingtwo/Bean/MySetting;
.super Lorg/litepal/crud/LitePalSupport;
.source "MySetting.java"


# instance fields
.field WifiDisTr:Z

.field doubleClickIsRecording:Z

.field endHour:Ljava/lang/Integer;

.field endMin:Ljava/lang/Integer;

.field startHour:Ljava/lang/Integer;

.field startMin:Ljava/lang/Integer;

.field timeDisTr:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 5
    invoke-direct {p0}, Lorg/litepal/crud/LitePalSupport;-><init>()V

    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->timeDisTr:Z

    const/16 v0, 0x17

    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->startHour:Ljava/lang/Integer;

    const/4 v0, 0x0

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->startMin:Ljava/lang/Integer;

    const/4 v2, 0x7

    .line 13
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->endHour:Ljava/lang/Integer;

    .line 14
    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->endMin:Ljava/lang/Integer;

    .line 16
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->WifiDisTr:Z

    .line 39
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->doubleClickIsRecording:Z

    return-void
.end method


# virtual methods
.method public getEndHour()Ljava/lang/Integer;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->endHour:Ljava/lang/Integer;

    return-object v0
.end method

.method public getEndMin()Ljava/lang/Integer;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->endMin:Ljava/lang/Integer;

    return-object v0
.end method

.method public getStartHour()Ljava/lang/Integer;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->startHour:Ljava/lang/Integer;

    return-object v0
.end method

.method public getStartMin()Ljava/lang/Integer;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->startMin:Ljava/lang/Integer;

    return-object v0
.end method

.method public isDoubleClickIsRecording()Z
    .locals 1

    .line 31
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->doubleClickIsRecording:Z

    return v0
.end method

.method public isTimeDisTr()Z
    .locals 1

    .line 48
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->timeDisTr:Z

    return v0
.end method

.method public isWifiDisTr()Z
    .locals 1

    .line 20
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->WifiDisTr:Z

    return v0
.end method

.method public setDoubleClickIsRecording(Z)V
    .locals 0

    .line 35
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->doubleClickIsRecording:Z

    return-void
.end method

.method public setEndHour(Ljava/lang/Integer;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->endHour:Ljava/lang/Integer;

    return-void
.end method

.method public setEndMin(Ljava/lang/Integer;)V
    .locals 0

    .line 86
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->endMin:Ljava/lang/Integer;

    return-void
.end method

.method public setStartHour(Ljava/lang/Integer;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->startHour:Ljava/lang/Integer;

    return-void
.end method

.method public setStartMin(Ljava/lang/Integer;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->startMin:Ljava/lang/Integer;

    return-void
.end method

.method public setTimeDisTr(Z)V
    .locals 0

    .line 52
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->timeDisTr:Z

    return-void
.end method

.method public setWifiDisTr(Z)V
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->WifiDisTr:Z

    return-void
.end method
