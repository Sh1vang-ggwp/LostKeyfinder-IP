.class Lcom/jianjin/camera/widget/CameraContainer$9$1;
.super Ljava/lang/Object;
.source "CameraContainer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jianjin/camera/widget/CameraContainer$9;->onAutoFocus(ZLandroid/hardware/Camera;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/jianjin/camera/widget/CameraContainer$9;


# direct methods
.method constructor <init>(Lcom/jianjin/camera/widget/CameraContainer$9;)V
    .locals 0

    .line 443
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$9$1;->this$1:Lcom/jianjin/camera/widget/CameraContainer$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 447
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer$9$1;->this$1:Lcom/jianjin/camera/widget/CameraContainer$9;

    iget-object v0, v0, Lcom/jianjin/camera/widget/CameraContainer$9;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v0}, Lcom/jianjin/camera/widget/CameraContainer;->access$600(Lcom/jianjin/camera/widget/CameraContainer;)Lcom/jianjin/camera/SensorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jianjin/camera/SensorController;->unlockFocus()V

    return-void
.end method
