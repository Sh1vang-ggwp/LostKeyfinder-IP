.class final Landroidx/camera/core/AutoValue_ResolutionInfo;
.super Landroidx/camera/core/ResolutionInfo;
.source "AutoValue_ResolutionInfo.java"


# instance fields
.field private final cropRect:Landroid/graphics/Rect;

.field private final resolution:Landroid/util/Size;

.field private final rotationDegrees:I


# direct methods
.method constructor <init>(Landroid/util/Size;Landroid/graphics/Rect;I)V
    .locals 1

    .line 22
    invoke-direct {p0}, Landroidx/camera/core/ResolutionInfo;-><init>()V

    const-string v0, "Null resolution"

    .line 24
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    iput-object p1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->resolution:Landroid/util/Size;

    const-string p1, "Null cropRect"

    .line 28
    invoke-static {p2, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 30
    iput-object p2, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->cropRect:Landroid/graphics/Rect;

    .line 31
    iput p3, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->rotationDegrees:I

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
    instance-of v1, p1, Landroidx/camera/core/ResolutionInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 67
    check-cast p1, Landroidx/camera/core/ResolutionInfo;

    .line 68
    iget-object v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->resolution:Landroid/util/Size;

    invoke-virtual {p1}, Landroidx/camera/core/ResolutionInfo;->getResolution()Landroid/util/Size;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->cropRect:Landroid/graphics/Rect;

    .line 69
    invoke-virtual {p1}, Landroidx/camera/core/ResolutionInfo;->getCropRect()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->rotationDegrees:I

    .line 70
    invoke-virtual {p1}, Landroidx/camera/core/ResolutionInfo;->getRotationDegrees()I

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

.method public getCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 43
    iget-object v0, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->cropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getResolution()Landroid/util/Size;
    .locals 1

    .line 37
    iget-object v0, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->resolution:Landroid/util/Size;

    return-object v0
.end method

.method public getRotationDegrees()I
    .locals 1

    .line 49
    iget v0, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->rotationDegrees:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 79
    iget-object v0, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->resolution:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 81
    iget-object v2, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 83
    iget v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->rotationDegrees:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ResolutionInfo{resolution="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->resolution:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", cropRect="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", rotationDegrees="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo;->rotationDegrees:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
