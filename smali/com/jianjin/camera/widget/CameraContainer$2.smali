.class Lcom/jianjin/camera/widget/CameraContainer$2;
.super Ljava/lang/Object;
.source "CameraContainer.java"

# interfaces
.implements Lcom/jianjin/camera/widget/OnCameraPrepareListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jianjin/camera/widget/CameraContainer;->init()V
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

    .line 89
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$2;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepare(Lcom/jianjin/camera/CameraDirection;)V
    .locals 4

    .line 92
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer$2;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    new-instance v1, Lcom/jianjin/camera/widget/CameraContainer$2$1;

    invoke-direct {v1, p0}, Lcom/jianjin/camera/widget/CameraContainer$2$1;-><init>(Lcom/jianjin/camera/widget/CameraContainer$2;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/jianjin/camera/widget/CameraContainer;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 99
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer$2;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v0}, Lcom/jianjin/camera/widget/CameraContainer;->access$200(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/widget/SeekBar;

    move-result-object v0

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraContainer$2;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v1}, Lcom/jianjin/camera/widget/CameraContainer;->access$100(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/CameraPreview;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jianjin/camera/widget/CameraPreview;->getMaxZoom()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 101
    sget-object v0, Lcom/jianjin/camera/CameraDirection;->CAMERA_BACK:Lcom/jianjin/camera/CameraDirection;

    if-ne p1, v0, :cond_0

    .line 102
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$2;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraContainer;->access$300(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/jianjin/camera/widget/CameraContainer$2$2;

    invoke-direct {v0, p0}, Lcom/jianjin/camera/widget/CameraContainer$2$2;-><init>(Lcom/jianjin/camera/widget/CameraContainer$2;)V

    const-wide/16 v1, 0x320

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
