.class final Landroidx/camera/video/AutoValue_StreamInfo;
.super Landroidx/camera/video/StreamInfo;
.source "AutoValue_StreamInfo.java"


# instance fields
.field private final id:I

.field private final streamState:Landroidx/camera/video/StreamInfo$StreamState;


# direct methods
.method constructor <init>(ILandroidx/camera/video/StreamInfo$StreamState;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroidx/camera/video/StreamInfo;-><init>()V

    .line 17
    iput p1, p0, Landroidx/camera/video/AutoValue_StreamInfo;->id:I

    const-string p1, "Null streamState"

    .line 19
    invoke-static {p2, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    iput-object p2, p0, Landroidx/camera/video/AutoValue_StreamInfo;->streamState:Landroidx/camera/video/StreamInfo$StreamState;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 48
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/StreamInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 49
    check-cast p1, Landroidx/camera/video/StreamInfo;

    .line 50
    iget v1, p0, Landroidx/camera/video/AutoValue_StreamInfo;->id:I

    invoke-virtual {p1}, Landroidx/camera/video/StreamInfo;->getId()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Landroidx/camera/video/AutoValue_StreamInfo;->streamState:Landroidx/camera/video/StreamInfo$StreamState;

    .line 51
    invoke-virtual {p1}, Landroidx/camera/video/StreamInfo;->getStreamState()Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/camera/video/StreamInfo$StreamState;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public getId()I
    .locals 1

    .line 26
    iget v0, p0, Landroidx/camera/video/AutoValue_StreamInfo;->id:I

    return v0
.end method

.method public getStreamState()Landroidx/camera/video/StreamInfo$StreamState;
    .locals 1

    .line 32
    iget-object v0, p0, Landroidx/camera/video/AutoValue_StreamInfo;->streamState:Landroidx/camera/video/StreamInfo$StreamState;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 60
    iget v0, p0, Landroidx/camera/video/AutoValue_StreamInfo;->id:I

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 62
    iget-object v1, p0, Landroidx/camera/video/AutoValue_StreamInfo;->streamState:Landroidx/camera/video/StreamInfo$StreamState;

    invoke-virtual {v1}, Landroidx/camera/video/StreamInfo$StreamState;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "StreamInfo{id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/camera/video/AutoValue_StreamInfo;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", streamState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/video/AutoValue_StreamInfo;->streamState:Landroidx/camera/video/StreamInfo$StreamState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
