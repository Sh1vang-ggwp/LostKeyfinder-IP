.class public Lcom/lenzetech/isearchingtwo/application/MessageEvent;
.super Ljava/lang/Object;
.source "MessageEvent.java"


# instance fields
.field private bytesInfo:[B

.field private deviceMac:Ljava/lang/String;

.field private eventType:Lcom/lenzetech/isearchingtwo/application/EventType;

.field private responseBean:Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;


# direct methods
.method public constructor <init>(Lcom/lenzetech/isearchingtwo/application/EventType;[BLcom/lenzetech/isearchingtwo/Bean/ResponseBean;Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->setEventType(Lcom/lenzetech/isearchingtwo/application/EventType;)V

    .line 13
    invoke-virtual {p0, p2}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->setBytesInfo([B)V

    .line 14
    invoke-virtual {p0, p3}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->setResponseBean(Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;)V

    .line 15
    invoke-virtual {p0, p4}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->setDeviceMac(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBytesInfo()[B
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->bytesInfo:[B

    return-object v0
.end method

.method public getDeviceMac()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->deviceMac:Ljava/lang/String;

    return-object v0
.end method

.method public getEventType()Lcom/lenzetech/isearchingtwo/application/EventType;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->eventType:Lcom/lenzetech/isearchingtwo/application/EventType;

    return-object v0
.end method

.method public getResponseBean()Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->responseBean:Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;

    return-object v0
.end method

.method public setBytesInfo([B)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->bytesInfo:[B

    return-void
.end method

.method public setDeviceMac(Ljava/lang/String;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->deviceMac:Ljava/lang/String;

    return-void
.end method

.method public setEventType(Lcom/lenzetech/isearchingtwo/application/EventType;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->eventType:Lcom/lenzetech/isearchingtwo/application/EventType;

    return-void
.end method

.method public setResponseBean(Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MessageEvent;->responseBean:Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;

    return-void
.end method
