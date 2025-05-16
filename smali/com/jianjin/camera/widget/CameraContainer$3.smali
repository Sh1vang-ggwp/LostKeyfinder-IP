.class Lcom/jianjin/camera/widget/CameraContainer$3;
.super Ljava/lang/Object;
.source "CameraContainer.java"

# interfaces
.implements Lcom/jianjin/camera/widget/SwitchCameraCallback;


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

    .line 112
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$3;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public switchCamera(Z)V
    .locals 3

    if-eqz p1, :cond_0

    .line 116
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$3;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraContainer;->access$300(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/jianjin/camera/widget/CameraContainer$3$1;

    invoke-direct {v0, p0}, Lcom/jianjin/camera/widget/CameraContainer$3$1;-><init>(Lcom/jianjin/camera/widget/CameraContainer$3;)V

    const-wide/16 v1, 0x12c

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
