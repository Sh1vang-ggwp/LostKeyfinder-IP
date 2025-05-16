.class public Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;
.super Ljava/lang/Object;
.source "VideoEncoderConfigCamcorderProfileResolver.java"

# interfaces
.implements Landroidx/core/util/Supplier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/core/util/Supplier<",
        "Landroidx/camera/video/internal/encoder/VideoEncoderConfig;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VidEncCmcrdrPrflRslvr"


# instance fields
.field private final mCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

.field private final mExpectedFrameRateRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mInputTimebase:Landroidx/camera/core/impl/Timebase;

.field private final mMimeType:Ljava/lang/String;

.field private final mSurfaceSize:Landroid/util/Size;

.field private final mVideoSpec:Landroidx/camera/video/VideoSpec;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/VideoSpec;Landroid/util/Size;Landroidx/camera/core/impl/CamcorderProfileProxy;Landroid/util/Range;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/Timebase;",
            "Landroidx/camera/video/VideoSpec;",
            "Landroid/util/Size;",
            "Landroidx/camera/core/impl/CamcorderProfileProxy;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mMimeType:Ljava/lang/String;

    .line 74
    iput-object p2, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 75
    iput-object p3, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mVideoSpec:Landroidx/camera/video/VideoSpec;

    .line 76
    iput-object p4, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mSurfaceSize:Landroid/util/Size;

    .line 77
    iput-object p5, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    .line 78
    iput-object p6, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mExpectedFrameRateRange:Landroid/util/Range;

    return-void
.end method

.method private resolveFrameRate()I
    .locals 5

    .line 106
    iget-object v0, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mVideoSpec:Landroidx/camera/video/VideoSpec;

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getFrameRate()Landroid/util/Range;

    move-result-object v0

    .line 107
    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    invoke-virtual {v1}, Landroidx/camera/core/impl/CamcorderProfileProxy;->getVideoFrameRate()I

    move-result v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    .line 110
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object v0, v2, v3

    iget-object v3, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mExpectedFrameRateRange:Landroid/util/Range;

    const/4 v4, 0x2

    aput-object v3, v2, v4

    const-string v3, "Frame rate from camcorder profile: %dfps. [Requested range: %s, Expected operating range: %s]"

    .line 109
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "VidEncCmcrdrPrflRslvr"

    .line 108
    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    iget-object v2, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mExpectedFrameRateRange:Landroid/util/Range;

    invoke-static {v0, v1, v2}, Landroidx/camera/video/internal/config/VideoConfigUtil;->resolveFrameRate(Landroid/util/Range;ILandroid/util/Range;)I

    move-result v0

    return v0
.end method


# virtual methods
.method public get()Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .locals 9

    .line 84
    invoke-direct {p0}, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->resolveFrameRate()I

    move-result v8

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Resolved VIDEO frame rate: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "fps"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "VidEncCmcrdrPrflRslvr"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    iget-object v0, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mVideoSpec:Landroidx/camera/video/VideoSpec;

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getBitrate()Landroid/util/Range;

    move-result-object v7

    const-string v0, "Using resolved VIDEO bitrate from CamcorderProfile"

    .line 88
    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    .line 90
    invoke-virtual {v0}, Landroidx/camera/core/impl/CamcorderProfileProxy;->getVideoBitRate()I

    move-result v0

    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    .line 91
    invoke-virtual {v1}, Landroidx/camera/core/impl/CamcorderProfileProxy;->getVideoFrameRate()I

    move-result v2

    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mSurfaceSize:Landroid/util/Size;

    .line 92
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    invoke-virtual {v1}, Landroidx/camera/core/impl/CamcorderProfileProxy;->getVideoFrameWidth()I

    move-result v4

    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mSurfaceSize:Landroid/util/Size;

    .line 93
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v5

    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    invoke-virtual {v1}, Landroidx/camera/core/impl/CamcorderProfileProxy;->getVideoFrameHeight()I

    move-result v6

    move v1, v8

    .line 89
    invoke-static/range {v0 .. v7}, Landroidx/camera/video/internal/config/VideoConfigUtil;->scaleAndClampBitrate(IIIIIIILandroid/util/Range;)I

    move-result v0

    .line 96
    invoke-static {}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->builder()Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mMimeType:Ljava/lang/String;

    .line 97
    invoke-virtual {v1, v2}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setMimeType(Ljava/lang/String;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 98
    invoke-virtual {v1, v2}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setInputTimebase(Landroidx/camera/core/impl/Timebase;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->mSurfaceSize:Landroid/util/Size;

    .line 99
    invoke-virtual {v1, v2}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setResolution(Landroid/util/Size;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v1

    .line 100
    invoke-virtual {v1, v0}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setBitrate(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v0

    .line 101
    invoke-virtual {v0, v8}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setFrameRate(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v0

    .line 102
    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->build()Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 37
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/VideoEncoderConfigCamcorderProfileResolver;->get()Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    move-result-object v0

    return-object v0
.end method
