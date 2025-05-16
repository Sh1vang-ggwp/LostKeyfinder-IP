.class public abstract Landroidx/camera/core/impl/CamcorderProfileProxy;
.super Ljava/lang/Object;
.source "CamcorderProfileProxy.java"


# static fields
.field public static CODEC_PROFILE_NONE:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(IIIIIIIIIIII)Landroidx/camera/core/impl/CamcorderProfileProxy;
    .locals 14

    .line 83
    new-instance v13, Landroidx/camera/core/impl/AutoValue_CamcorderProfileProxy;

    move-object v0, v13

    move v1, p0

    move v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    invoke-direct/range {v0 .. v12}, Landroidx/camera/core/impl/AutoValue_CamcorderProfileProxy;-><init>(IIIIIIIIIIII)V

    return-object v13
.end method

.method public static fromCamcorderProfile(Landroid/media/CamcorderProfile;)Landroidx/camera/core/impl/CamcorderProfileProxy;
    .locals 14

    .line 103
    new-instance v13, Landroidx/camera/core/impl/AutoValue_CamcorderProfileProxy;

    iget v1, p0, Landroid/media/CamcorderProfile;->duration:I

    iget v2, p0, Landroid/media/CamcorderProfile;->quality:I

    iget v3, p0, Landroid/media/CamcorderProfile;->fileFormat:I

    iget v4, p0, Landroid/media/CamcorderProfile;->videoCodec:I

    iget v5, p0, Landroid/media/CamcorderProfile;->videoBitRate:I

    iget v6, p0, Landroid/media/CamcorderProfile;->videoFrameRate:I

    iget v7, p0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget v8, p0, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    iget v9, p0, Landroid/media/CamcorderProfile;->audioCodec:I

    iget v10, p0, Landroid/media/CamcorderProfile;->audioBitRate:I

    iget v11, p0, Landroid/media/CamcorderProfile;->audioSampleRate:I

    iget v12, p0, Landroid/media/CamcorderProfile;->audioChannels:I

    move-object v0, v13

    invoke-direct/range {v0 .. v12}, Landroidx/camera/core/impl/AutoValue_CamcorderProfileProxy;-><init>(IIIIIIIIIIII)V

    return-object v13
.end method


# virtual methods
.method public abstract getAudioBitRate()I
.end method

.method public abstract getAudioChannels()I
.end method

.method public abstract getAudioCodec()I
.end method

.method public getAudioCodecMimeType()Ljava/lang/String;
    .locals 1

    .line 197
    invoke-virtual {p0}, Landroidx/camera/core/impl/CamcorderProfileProxy;->getAudioCodec()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    return-object v0

    :pswitch_0
    const-string v0, "audio/opus"

    return-object v0

    :pswitch_1
    const-string v0, "audio/vorbis"

    return-object v0

    :pswitch_2
    const-string v0, "audio/mp4a-latm"

    return-object v0

    :pswitch_3
    const-string v0, "audio/amr-wb"

    return-object v0

    :pswitch_4
    const-string v0, "audio/3gpp"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public abstract getAudioSampleRate()I
.end method

.method public abstract getDuration()I
.end method

.method public abstract getFileFormat()I
.end method

.method public abstract getQuality()I
.end method

.method public getRequiredAudioProfile()I
    .locals 3

    .line 230
    invoke-virtual {p0}, Landroidx/camera/core/impl/CamcorderProfileProxy;->getAudioCodec()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    const/4 v2, 0x5

    if-eq v0, v1, :cond_1

    if-eq v0, v2, :cond_0

    .line 238
    sget v0, Landroidx/camera/core/impl/CamcorderProfileProxy;->CODEC_PROFILE_NONE:I

    return v0

    :cond_0
    const/16 v0, 0x27

    return v0

    :cond_1
    return v2

    :cond_2
    const/4 v0, 0x2

    return v0
.end method

.method public abstract getVideoBitRate()I
.end method

.method public abstract getVideoCodec()I
.end method

.method public getVideoCodecMimeType()Ljava/lang/String;
    .locals 2

    .line 168
    invoke-virtual {p0}, Landroidx/camera/core/impl/CamcorderProfileProxy;->getVideoCodec()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    const-string v0, "video/hevc"

    return-object v0

    :cond_1
    const-string v0, "video/x-vnd.on2.vp8"

    return-object v0

    :cond_2
    const-string v0, "video/mp4v-es"

    return-object v0

    :cond_3
    const-string v0, "video/avc"

    return-object v0

    :cond_4
    const-string v0, "video/3gpp"

    return-object v0
.end method

.method public abstract getVideoFrameHeight()I
.end method

.method public abstract getVideoFrameRate()I
.end method

.method public abstract getVideoFrameWidth()I
.end method
