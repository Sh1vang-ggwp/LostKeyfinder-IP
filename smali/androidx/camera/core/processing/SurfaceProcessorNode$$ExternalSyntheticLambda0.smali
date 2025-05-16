.class public final synthetic Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/SurfaceRequest$TransformationInfoListener;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Z

.field public final synthetic f$2:Ljava/util/Collection;


# direct methods
.method public synthetic constructor <init>(IZLjava/util/Collection;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;->f$0:I

    iput-boolean p2, p0, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;->f$1:Z

    iput-object p3, p0, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;->f$2:Ljava/util/Collection;

    return-void
.end method


# virtual methods
.method public final onTransformationInfoUpdate(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V
    .locals 3

    iget v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;->f$0:I

    iget-boolean v1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;->f$1:Z

    iget-object v2, p0, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;->f$2:Ljava/util/Collection;

    invoke-static {v0, v1, v2, p1}, Landroidx/camera/core/processing/SurfaceProcessorNode;->lambda$setupRotationUpdates$0(IZLjava/util/Collection;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V

    return-void
.end method
