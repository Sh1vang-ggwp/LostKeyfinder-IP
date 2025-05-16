.class final Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;
.super Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
.source "AutoValue_SurfaceProcessorNode_OutConfig.java"


# instance fields
.field private final cropRect:Landroid/graphics/Rect;

.field private final size:Landroid/util/Size;

.field private final targets:I


# direct methods
.method constructor <init>(ILandroid/graphics/Rect;Landroid/util/Size;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;-><init>()V

    .line 23
    iput p1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->targets:I

    const-string p1, "Null cropRect"

    .line 25
    invoke-static {p2, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 27
    iput-object p2, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->cropRect:Landroid/graphics/Rect;

    const-string p1, "Null size"

    .line 29
    invoke-static {p3, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 31
    iput-object p3, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->size:Landroid/util/Size;

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
    instance-of v1, p1, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 67
    check-cast p1, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    .line 68
    iget v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->targets:I

    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getTargets()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->cropRect:Landroid/graphics/Rect;

    .line 69
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->size:Landroid/util/Size;

    .line 70
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getSize()Landroid/util/Size;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

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

.method getCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 43
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->cropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method getSize()Landroid/util/Size;
    .locals 1

    .line 49
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->size:Landroid/util/Size;

    return-object v0
.end method

.method getTargets()I
    .locals 1

    .line 37
    iget v0, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->targets:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 79
    iget v0, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->targets:I

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 81
    iget-object v2, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 83
    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->size:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OutConfig{targets="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->targets:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", cropRect="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;->size:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
