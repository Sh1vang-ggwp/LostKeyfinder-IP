.class public Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;
.super Ljava/lang/Object;
.source "GeocoderHandler.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GeoResult"
.end annotation


# instance fields
.field private lat:D

.field private lng:D

.field private obj:Ljava/lang/Object;

.field private result:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/Object;DD)V
    .locals 0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->obj:Ljava/lang/Object;

    .line 90
    iput-wide p2, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->lat:D

    .line 91
    iput-wide p4, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->lng:D

    return-void
.end method

.method static synthetic access$002(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->result:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;)D
    .locals 2

    .line 81
    iget-wide v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->lat:D

    return-wide v0
.end method

.method static synthetic access$200(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;)D
    .locals 2

    .line 81
    iget-wide v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->lng:D

    return-wide v0
.end method


# virtual methods
.method public getObj()Ljava/lang/Object;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->obj:Ljava/lang/Object;

    return-object v0
.end method

.method public getResult()Ljava/lang/String;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->result:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GeoResult{lat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->lat:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", lng="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->lng:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", obj="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->obj:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", result=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->result:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
