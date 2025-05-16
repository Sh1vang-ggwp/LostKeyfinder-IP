.class public abstract Landroidx/camera/video/internal/AudioSource$Settings;
.super Ljava/lang/Object;
.source "AudioSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/AudioSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Settings"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/internal/AudioSource$Settings$Builder;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 656
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static builder()Landroidx/camera/video/internal/AudioSource$Settings$Builder;
    .locals 2

    .line 617
    new-instance v0, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings$Builder;

    invoke-direct {v0}, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings$Builder;-><init>()V

    const/4 v1, -0x1

    .line 618
    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/AutoValue_AudioSource_Settings$Builder;->setAudioSource(I)Landroidx/camera/video/internal/AudioSource$Settings$Builder;

    move-result-object v0

    .line 619
    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/AudioSource$Settings$Builder;->setSampleRate(I)Landroidx/camera/video/internal/AudioSource$Settings$Builder;

    move-result-object v0

    .line 620
    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/AudioSource$Settings$Builder;->setChannelCount(I)Landroidx/camera/video/internal/AudioSource$Settings$Builder;

    move-result-object v0

    .line 621
    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/AudioSource$Settings$Builder;->setAudioFormat(I)Landroidx/camera/video/internal/AudioSource$Settings$Builder;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public abstract getAudioFormat()I
.end method

.method public abstract getAudioSource()I
.end method

.method public abstract getChannelCount()I
.end method

.method public abstract getSampleRate()I
.end method

.method public abstract toBuilder()Landroidx/camera/video/internal/AudioSource$Settings$Builder;
.end method
