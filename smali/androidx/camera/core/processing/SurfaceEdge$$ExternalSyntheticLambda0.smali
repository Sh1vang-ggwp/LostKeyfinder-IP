.class public final synthetic Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/impl/utils/futures/AsyncFunction;


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/processing/SurfaceEdge;

.field public final synthetic f$1:Landroid/util/Size;

.field public final synthetic f$2:Landroid/graphics/Rect;

.field public final synthetic f$3:I

.field public final synthetic f$4:Z


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/processing/SurfaceEdge;Landroid/util/Size;Landroid/graphics/Rect;IZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/core/processing/SurfaceEdge;

    iput-object p2, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$1:Landroid/util/Size;

    iput-object p3, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$2:Landroid/graphics/Rect;

    iput p4, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$3:I

    iput-boolean p5, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$4:Z

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 6

    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/core/processing/SurfaceEdge;

    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$1:Landroid/util/Size;

    iget-object v2, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$2:Landroid/graphics/Rect;

    iget v3, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$3:I

    iget-boolean v4, p0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;->f$4:Z

    move-object v5, p1

    check-cast v5, Landroid/view/Surface;

    invoke-virtual/range {v0 .. v5}, Landroidx/camera/core/processing/SurfaceEdge;->lambda$createSurfaceOutputFuture$0$androidx-camera-core-processing-SurfaceEdge(Landroid/util/Size;Landroid/graphics/Rect;IZLandroid/view/Surface;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    return-object p1
.end method
