.class public abstract Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;
.super Ljava/lang/Object;
.source "GeocoderHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "GeocoderHandler"


# instance fields
.field private mGeocoder:Landroid/location/Geocoder;

.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mTaskCount:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mTaskCount:Ljava/util/concurrent/atomic/AtomicLong;

    .line 36
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "GeocoderHandler"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mHandlerThread:Landroid/os/HandlerThread;

    .line 37
    new-instance v0, Landroid/location/Geocoder;

    invoke-direct {v0, p1}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mGeocoder:Landroid/location/Geocoder;

    return-void
.end method

.method static synthetic access$300(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;DD)Ljava/lang/String;
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->getAddress(DD)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getAddress(DD)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    .line 120
    :try_start_0
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mGeocoder:Landroid/location/Geocoder;

    const/4 v6, 0x1

    move-wide v2, p1

    move-wide v4, p3

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object p1

    .line 121
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    if-lez p2, :cond_4

    const/4 p2, 0x0

    .line 122
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/location/Address;

    if-nez p1, :cond_0

    :goto_0
    move-object p2, v0

    goto :goto_2

    .line 127
    :cond_0
    invoke-virtual {p1}, Landroid/location/Address;->getMaxAddressLineIndex()I

    move-result p3

    const/4 p4, -0x1

    if-ne p3, p4, :cond_1

    goto :goto_0

    .line 129
    :cond_1
    invoke-virtual {p1}, Landroid/location/Address;->getMaxAddressLineIndex()I

    move-result p3

    if-nez p3, :cond_2

    .line 130
    invoke-virtual {p1, p2}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_2

    .line 132
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 p3, 0x1

    .line 133
    :goto_1
    invoke-virtual {p1}, Landroid/location/Address;->getMaxAddressLineIndex()I

    move-result p4

    if-gt p3, p4, :cond_3

    .line 134
    invoke-virtual {p1, p3}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p3, p3, 0x1

    goto :goto_1

    .line 136
    :cond_3
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_2
    const-string p3, "GeocoderHandler"

    .line 148
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getAddress: address="

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",result="

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p2

    :catch_0
    move-exception p1

    .line 152
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_4
    return-object v0
.end method


# virtual methods
.method protected abstract onResult(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;)V
.end method

.method public send(Ljava/lang/Object;DD)V
    .locals 8

    .line 70
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 71
    new-instance v7, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;

    move-object v1, v7

    move-object v2, p1

    move-wide v3, p2

    move-wide v5, p4

    invoke-direct/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;-><init>(Ljava/lang/Object;DD)V

    iput-object v7, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 72
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 74
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mTaskCount:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    :cond_0
    return-void
.end method

.method public start()V
    .locals 3

    .line 41
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 42
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$1;

    invoke-direct {v2, p0}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$1;-><init>(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;)V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public stop()V
    .locals 2

    .line 58
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 59
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    return-void
.end method
