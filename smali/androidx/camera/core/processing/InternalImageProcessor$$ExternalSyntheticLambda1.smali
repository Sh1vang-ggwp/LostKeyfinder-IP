.class public final synthetic Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/processing/InternalImageProcessor;

.field public final synthetic f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

.field public final synthetic f$2:Landroidx/camera/core/ImageProcessor$Request;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/ImageProcessor$Request;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/processing/InternalImageProcessor;

    iput-object p2, p0, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda1;->f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-object p3, p0, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda1;->f$2:Landroidx/camera/core/ImageProcessor$Request;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/processing/InternalImageProcessor;

    iget-object v1, p0, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda1;->f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iget-object v2, p0, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda1;->f$2:Landroidx/camera/core/ImageProcessor$Request;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/processing/InternalImageProcessor;->lambda$safeProcess$0$androidx-camera-core-processing-InternalImageProcessor(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/ImageProcessor$Request;)V

    return-void
.end method
