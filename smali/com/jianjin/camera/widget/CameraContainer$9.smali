.class Lcom/jianjin/camera/widget/CameraContainer$9;
.super Ljava/lang/Object;
.source "CameraContainer.java"

# interfaces
.implements Landroid/hardware/Camera$AutoFocusCallback;


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

    .line 432
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$9;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAutoFocus(ZLandroid/hardware/Camera;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 438
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$9;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraContainer;->access$800(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/FocusImageView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/jianjin/camera/widget/FocusImageView;->onFocusSuccess()V

    goto :goto_0

    .line 441
    :cond_0
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$9;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraContainer;->access$800(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/widget/FocusImageView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/jianjin/camera/widget/FocusImageView;->onFocusFailed()V

    .line 443
    :goto_0
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$9;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraContainer;->access$300(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/Handler;

    move-result-object p1

    new-instance p2, Lcom/jianjin/camera/widget/CameraContainer$9$1;

    invoke-direct {p2, p0}, Lcom/jianjin/camera/widget/CameraContainer$9$1;-><init>(Lcom/jianjin/camera/widget/CameraContainer$9;)V

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
