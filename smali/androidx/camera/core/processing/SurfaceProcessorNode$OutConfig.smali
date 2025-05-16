.class public abstract Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
.super Ljava/lang/Object;
.source "SurfaceProcessorNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/processing/SurfaceProcessorNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "OutConfig"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 305
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static of(ILandroid/graphics/Rect;Landroid/util/Size;)Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    .locals 1

    .line 344
    new-instance v0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;

    invoke-direct {v0, p0, p1, p2}, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;-><init>(ILandroid/graphics/Rect;Landroid/util/Size;)V

    return-object v0
.end method

.method public static of(Landroidx/camera/core/processing/SurfaceEdge;)Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    .locals 3

    .line 334
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getTargets()I

    move-result v0

    .line 335
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v1

    .line 336
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getRotationDegrees()I

    move-result p0

    invoke-static {v2, p0}, Landroidx/camera/core/impl/utils/TransformUtils;->getRotatedSize(Landroid/graphics/Rect;I)Landroid/util/Size;

    move-result-object p0

    .line 334
    invoke-static {v0, v1, p0}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->of(ILandroid/graphics/Rect;Landroid/util/Size;)Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method abstract getCropRect()Landroid/graphics/Rect;
.end method

.method abstract getSize()Landroid/util/Size;
.end method

.method abstract getTargets()I
.end method
