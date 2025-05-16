.class Lcom/jianjin/camera/widget/CameraContainer$5;
.super Ljava/lang/Object;
.source "CameraContainer.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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

    .line 156
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$5;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    .line 161
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$5;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraContainer;->access$100(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/CameraPreview;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/jianjin/camera/widget/CameraPreview;->setZoom(I)V

    .line 163
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$5;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraContainer;->access$300(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/Handler;

    move-result-object p1

    iget-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer$5;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p2}, Lcom/jianjin/camera/widget/CameraContainer;->access$200(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/widget/SeekBar;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 165
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$5;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraContainer;->access$300(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/Handler;

    move-result-object p1

    new-instance p2, Lcom/jianjin/camera/widget/CameraContainer$5$1;

    invoke-direct {p2, p0}, Lcom/jianjin/camera/widget/CameraContainer$5$1;-><init>(Lcom/jianjin/camera/widget/CameraContainer$5;)V

    iget-object p3, p0, Lcom/jianjin/camera/widget/CameraContainer$5;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    .line 171
    invoke-static {p3}, Lcom/jianjin/camera/widget/CameraContainer;->access$200(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/widget/SeekBar;

    move-result-object p3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x7d0

    add-long/2addr v0, v2

    .line 165
    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
