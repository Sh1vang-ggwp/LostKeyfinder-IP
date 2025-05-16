.class Lcom/jianjin/camera/widget/CameraContainer$4;
.super Ljava/lang/Object;
.source "CameraContainer.java"

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jianjin/camera/widget/CameraContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jianjin/camera/widget/CameraContainer;


# direct methods
.method constructor <init>(Lcom/jianjin/camera/widget/CameraContainer;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$4;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 4

    .line 139
    iget-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer$4;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p2}, Lcom/jianjin/camera/widget/CameraContainer;->access$100(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/CameraPreview;

    move-result-object p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_1

    .line 140
    iget-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer$4;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p2}, Lcom/jianjin/camera/widget/CameraContainer;->access$100(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/CameraPreview;

    move-result-object p2

    invoke-virtual {p2}, Lcom/jianjin/camera/widget/CameraPreview;->getCameraId()Lcom/jianjin/camera/CameraDirection;

    move-result-object p2

    sget-object v2, Lcom/jianjin/camera/CameraDirection;->CAMERA_BACK:Lcom/jianjin/camera/CameraDirection;

    if-ne p2, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    const-string p2, "CameraContainer"

    const-string v2, "\u521b\u5efa\u7ebf\u7a0b"

    .line 145
    invoke-static {p2, v2}, Lcom/jianjin/camera/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    iget-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer$4;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "save_picture"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-static {p2, v2}, Lcom/jianjin/camera/widget/CameraContainer;->access$402(Lcom/jianjin/camera/widget/CameraContainer;Landroid/os/HandlerThread;)Landroid/os/HandlerThread;

    .line 147
    iget-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer$4;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p2}, Lcom/jianjin/camera/widget/CameraContainer;->access$400(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/HandlerThread;

    move-result-object p2

    invoke-virtual {p2}, Landroid/os/HandlerThread;->start()V

    .line 149
    new-instance p2, Lcom/jianjin/camera/SavePicHandler;

    iget-object v2, p0, Lcom/jianjin/camera/widget/CameraContainer$4;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v2}, Lcom/jianjin/camera/widget/CameraContainer;->access$400(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/HandlerThread;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/jianjin/camera/widget/CameraContainer$4;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v3}, Lcom/jianjin/camera/widget/CameraContainer;->access$500(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/Handler;

    move-result-object v3

    invoke-direct {p2, v2, v3, p1, v1}, Lcom/jianjin/camera/SavePicHandler;-><init>(Landroid/os/Looper;Landroid/os/Handler;[BZ)V

    .line 151
    invoke-virtual {p2, v0}, Lcom/jianjin/camera/SavePicHandler;->sendEmptyMessage(I)Z

    return-void
.end method
