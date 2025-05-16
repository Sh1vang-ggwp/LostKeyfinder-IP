.class public final synthetic Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Supplier;


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/VideoCapture;

.field public final synthetic f$1:Landroidx/camera/video/impl/VideoCaptureConfig;

.field public final synthetic f$2:Landroidx/camera/core/impl/CameraInternal;

.field public final synthetic f$3:Landroidx/camera/core/impl/Timebase;

.field public final synthetic f$4:Landroidx/camera/video/MediaSpec;

.field public final synthetic f$5:Landroid/util/Size;

.field public final synthetic f$6:Landroid/util/Range;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/VideoCapture;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/MediaSpec;Landroid/util/Size;Landroid/util/Range;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$0:Landroidx/camera/video/VideoCapture;

    iput-object p2, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$1:Landroidx/camera/video/impl/VideoCaptureConfig;

    iput-object p3, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$2:Landroidx/camera/core/impl/CameraInternal;

    iput-object p4, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$3:Landroidx/camera/core/impl/Timebase;

    iput-object p5, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$4:Landroidx/camera/video/MediaSpec;

    iput-object p6, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$5:Landroid/util/Size;

    iput-object p7, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$6:Landroid/util/Range;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 7

    iget-object v0, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$0:Landroidx/camera/video/VideoCapture;

    iget-object v1, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$1:Landroidx/camera/video/impl/VideoCaptureConfig;

    iget-object v2, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$2:Landroidx/camera/core/impl/CameraInternal;

    iget-object v3, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$3:Landroidx/camera/core/impl/Timebase;

    iget-object v4, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$4:Landroidx/camera/video/MediaSpec;

    iget-object v5, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$5:Landroid/util/Size;

    iget-object v6, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;->f$6:Landroid/util/Range;

    invoke-virtual/range {v0 .. v6}, Landroidx/camera/video/VideoCapture;->lambda$createPipeline$1$androidx-camera-video-VideoCapture(Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/MediaSpec;Landroid/util/Size;Landroid/util/Range;)Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    move-result-object v0

    return-object v0
.end method
