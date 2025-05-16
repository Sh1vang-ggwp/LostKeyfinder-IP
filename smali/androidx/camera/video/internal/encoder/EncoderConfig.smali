.class public interface abstract Landroidx/camera/video/internal/encoder/EncoderConfig;
.super Ljava/lang/Object;
.source "EncoderConfig.java"


# static fields
.field public static final CODEC_PROFILE_NONE:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    sget v0, Landroidx/camera/core/impl/CamcorderProfileProxy;->CODEC_PROFILE_NONE:I

    sput v0, Landroidx/camera/video/internal/encoder/EncoderConfig;->CODEC_PROFILE_NONE:I

    return-void
.end method


# virtual methods
.method public abstract getInputTimebase()Landroidx/camera/core/impl/Timebase;
.end method

.method public abstract getMimeType()Ljava/lang/String;
.end method

.method public abstract getProfile()I
.end method

.method public abstract toMediaFormat()Landroid/media/MediaFormat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation
.end method
