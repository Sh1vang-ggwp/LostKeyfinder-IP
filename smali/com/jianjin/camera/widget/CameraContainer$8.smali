.class Lcom/jianjin/camera/widget/CameraContainer$8;
.super Ljava/lang/Object;
.source "CameraContainer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jianjin/camera/widget/CameraContainer;->onCameraFocus(Landroid/graphics/Point;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jianjin/camera/widget/CameraContainer;

.field final synthetic val$point:Landroid/graphics/Point;


# direct methods
.method constructor <init>(Lcom/jianjin/camera/widget/CameraContainer;Landroid/graphics/Point;)V
    .locals 0

    .line 415
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$8;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    iput-object p2, p0, Lcom/jianjin/camera/widget/CameraContainer$8;->val$point:Landroid/graphics/Point;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 418
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer$8;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v0}, Lcom/jianjin/camera/widget/CameraContainer;->access$600(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/SensorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jianjin/camera/SensorController;->isFocusLocked()Z

    move-result v0

    if-nez v0, :cond_0

    .line 419
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer$8;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v0}, Lcom/jianjin/camera/widget/CameraContainer;->access$100(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/CameraPreview;

    move-result-object v0

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraContainer$8;->val$point:Landroid/graphics/Point;

    iget-object v2, p0, Lcom/jianjin/camera/widget/CameraContainer$8;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v2}, Lcom/jianjin/camera/widget/CameraContainer;->access$700(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/hardware/Camera$AutoFocusCallback;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/jianjin/camera/widget/CameraPreview;->onFocus(Landroid/graphics/Point;Landroid/hardware/Camera$AutoFocusCallback;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 420
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer$8;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v0}, Lcom/jianjin/camera/widget/CameraContainer;->access$600(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/SensorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jianjin/camera/SensorController;->lockFocus()V

    .line 421
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer$8;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v0}, Lcom/jianjin/camera/widget/CameraContainer;->access$800(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/FocusImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraContainer$8;->val$point:Landroid/graphics/Point;

    invoke-virtual {v0, v1}, Lcom/jianjin/camera/widget/FocusImageView;->startFocus(Landroid/graphics/Point;)V

    :cond_0
    return-void
.end method
