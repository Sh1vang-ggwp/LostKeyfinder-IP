.class final Landroidx/camera/video/internal/config/AutoValue_MimeInfo;
.super Landroidx/camera/video/internal/config/MimeInfo;
.source "AutoValue_MimeInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/internal/config/AutoValue_MimeInfo$Builder;
    }
.end annotation


# instance fields
.field private final compatibleCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

.field private final mimeType:Ljava/lang/String;

.field private final profile:I


# direct methods
.method private constructor <init>(Ljava/lang/String;ILandroidx/camera/core/impl/CamcorderProfileProxy;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Landroidx/camera/video/internal/config/MimeInfo;-><init>()V

    .line 22
    iput-object p1, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->mimeType:Ljava/lang/String;

    .line 23
    iput p2, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->profile:I

    .line 24
    iput-object p3, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->compatibleCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILandroidx/camera/core/impl/CamcorderProfileProxy;Landroidx/camera/video/internal/config/AutoValue_MimeInfo$1;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;-><init>(Ljava/lang/String;ILandroidx/camera/core/impl/CamcorderProfileProxy;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 58
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/internal/config/MimeInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 59
    check-cast p1, Landroidx/camera/video/internal/config/MimeInfo;

    .line 60
    iget-object v1, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->mimeType:Ljava/lang/String;

    invoke-virtual {p1}, Landroidx/camera/video/internal/config/MimeInfo;->getMimeType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->profile:I

    .line 61
    invoke-virtual {p1}, Landroidx/camera/video/internal/config/MimeInfo;->getProfile()I

    move-result v3

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->compatibleCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    if-nez v1, :cond_1

    .line 62
    invoke-virtual {p1}, Landroidx/camera/video/internal/config/MimeInfo;->getCompatibleCamcorderProfile()Landroidx/camera/core/impl/CamcorderProfileProxy;

    move-result-object p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroidx/camera/video/internal/config/MimeInfo;->getCompatibleCamcorderProfile()Landroidx/camera/core/impl/CamcorderProfileProxy;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    return v2
.end method

.method public getCompatibleCamcorderProfile()Landroidx/camera/core/impl/CamcorderProfileProxy;
    .locals 1

    .line 41
    iget-object v0, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->compatibleCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getProfile()I
    .locals 1

    .line 35
    iget v0, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->profile:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 71
    iget-object v0, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->mimeType:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 73
    iget v2, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->profile:I

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 75
    iget-object v1, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->compatibleCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MimeInfo{mimeType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", profile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->profile:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", compatibleCamcorderProfile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/video/internal/config/AutoValue_MimeInfo;->compatibleCamcorderProfile:Landroidx/camera/core/impl/CamcorderProfileProxy;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
