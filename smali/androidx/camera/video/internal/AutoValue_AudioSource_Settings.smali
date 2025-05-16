.class final Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;
.super Landroidx/camera/video/internal/AudioSource$Settings;
.source "AutoValue_AudioSource_Settings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/internal/AutoValue_AudioSource_Settings$Builder;
    }
.end annotation


# instance fields
.field private final audioFormat:I

.field private final audioSource:I

.field private final channelCount:I

.field private final sampleRate:I


# direct methods
.method private constructor <init>(IIII)V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroidx/camera/video/internal/AudioSource$Settings;-><init>()V

    .line 23
    iput p1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioSource:I

    .line 24
    iput p2, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->sampleRate:I

    .line 25
    iput p3, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->channelCount:I

    .line 26
    iput p4, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioFormat:I

    return-void
.end method

.method synthetic constructor <init>(IIIILandroidx/camera/video/internal/AutoValue_AudioSource_Settings$1;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;-><init>(IIII)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 66
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/internal/AudioSource$Settings;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 67
    check-cast p1, Landroidx/camera/video/internal/AudioSource$Settings;

    .line 68
    iget v1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioSource:I

    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioSource()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget v1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->sampleRate:I

    .line 69
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getSampleRate()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget v1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->channelCount:I

    .line 70
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getChannelCount()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget v1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioFormat:I

    .line 71
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioFormat()I

    move-result p1

    if-ne v1, p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public getAudioFormat()I
    .locals 1

    .line 48
    iget v0, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioFormat:I

    return v0
.end method

.method public getAudioSource()I
    .locals 1

    .line 31
    iget v0, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioSource:I

    return v0
.end method

.method public getChannelCount()I
    .locals 1

    .line 43
    iget v0, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->channelCount:I

    return v0
.end method

.method public getSampleRate()I
    .locals 1

    .line 37
    iget v0, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->sampleRate:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 80
    iget v0, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioSource:I

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 82
    iget v2, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->sampleRate:I

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 84
    iget v2, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->channelCount:I

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 86
    iget v1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioFormat:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public toBuilder()Landroidx/camera/video/internal/AudioSource$Settings$Builder;
    .locals 2

    .line 92
    new-instance v0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings$Builder;-><init>(Landroidx/camera/video/internal/AudioSource$Settings;Landroidx/camera/video/internal/AutoValue_AudioSource_Settings$1;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Settings{audioSource="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioSource:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", sampleRate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->sampleRate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", channelCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->channelCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", audioFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings;->audioFormat:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
