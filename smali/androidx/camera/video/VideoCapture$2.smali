.class Landroidx/camera/video/VideoCapture$2;
.super Landroidx/camera/core/impl/CameraCaptureCallback;
.source "VideoCapture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/video/VideoCapture;->setupSurfaceUpdateNotifier(Landroidx/camera/core/impl/SessionConfig$Builder;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/video/VideoCapture;

.field final synthetic val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

.field final synthetic val$sessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

.field final synthetic val$surfaceUpdateComplete:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Landroidx/camera/video/VideoCapture;Ljava/util/concurrent/atomic/AtomicBoolean;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 0

    .line 994
    iput-object p1, p0, Landroidx/camera/video/VideoCapture$2;->this$0:Landroidx/camera/video/VideoCapture;

    iput-object p2, p0, Landroidx/camera/video/VideoCapture$2;->val$surfaceUpdateComplete:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p3, p0, Landroidx/camera/video/VideoCapture$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-object p4, p0, Landroidx/camera/video/VideoCapture$2;->val$sessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-direct {p0}, Landroidx/camera/core/impl/CameraCaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCaptureCompleted$0$androidx-camera-video-VideoCapture$2(Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 0

    .line 1010
    invoke-virtual {p1, p0}, Landroidx/camera/core/impl/SessionConfig$Builder;->removeCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Z

    return-void
.end method

.method public onCaptureCompleted(Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 2

    .line 998
    invoke-super {p0, p1}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCompleted(Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 999
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$2;->val$surfaceUpdateComplete:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1000
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraCaptureResult;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object p1

    const-string v0, "androidx.camera.video.VideoCapture.streamUpdate"

    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1002
    check-cast p1, Ljava/lang/Integer;

    .line 1003
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Landroidx/camera/video/VideoCapture$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Landroidx/camera/video/VideoCapture$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v0, 0x0

    .line 1004
    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroidx/camera/video/VideoCapture$2;->val$surfaceUpdateComplete:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x1

    .line 1005
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result p1

    if-nez p1, :cond_0

    .line 1008
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    iget-object v0, p0, Landroidx/camera/video/VideoCapture$2;->val$sessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    new-instance v1, Landroidx/camera/video/VideoCapture$2$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v0}, Landroidx/camera/video/VideoCapture$2$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/VideoCapture$2;Landroidx/camera/core/impl/SessionConfig$Builder;)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
