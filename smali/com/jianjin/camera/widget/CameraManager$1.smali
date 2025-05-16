.class Lcom/jianjin/camera/widget/CameraManager$1;
.super Ljava/lang/Object;
.source "CameraManager.java"

# interfaces
.implements Lcom/jianjin/camera/widget/PreviewLightCallback$OnCameraLightCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jianjin/camera/widget/CameraManager;->setPreviewLight(Landroid/hardware/Camera;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jianjin/camera/widget/CameraManager;


# direct methods
.method constructor <init>(Lcom/jianjin/camera/widget/CameraManager;)V
    .locals 0

    .line 188
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraManager$1;->this$0:Lcom/jianjin/camera/widget/CameraManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cameraLight(Z)V
    .locals 2

    .line 192
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraManager$1;->this$0:Lcom/jianjin/camera/widget/CameraManager;

    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraManager;->getCameraDirection()Lcom/jianjin/camera/CameraDirection;

    move-result-object v0

    sget-object v1, Lcom/jianjin/camera/CameraDirection;->CAMERA_BACK:Lcom/jianjin/camera/CameraDirection;

    if-ne v0, v1, :cond_2

    if-nez p1, :cond_1

    .line 193
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraManager$1;->this$0:Lcom/jianjin/camera/widget/CameraManager;

    invoke-virtual {p1}, Lcom/jianjin/camera/widget/CameraManager;->getFlashLightStatus()Lcom/jianjin/camera/FlashLightStatus;

    move-result-object p1

    sget-object v0, Lcom/jianjin/camera/FlashLightStatus;->LIGHT_ON:Lcom/jianjin/camera/FlashLightStatus;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 198
    :cond_0
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraManager$1;->this$0:Lcom/jianjin/camera/widget/CameraManager;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraManager;->access$000(Lcom/jianjin/camera/widget/CameraManager;)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    const/16 v0, 0x8

    if-eq p1, v0, :cond_2

    .line 199
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraManager$1;->this$0:Lcom/jianjin/camera/widget/CameraManager;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraManager;->access$000(Lcom/jianjin/camera/widget/CameraManager;)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 194
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraManager$1;->this$0:Lcom/jianjin/camera/widget/CameraManager;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraManager;->access$000(Lcom/jianjin/camera/widget/CameraManager;)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_2

    .line 195
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraManager$1;->this$0:Lcom/jianjin/camera/widget/CameraManager;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraManager;->access$000(Lcom/jianjin/camera/widget/CameraManager;)Landroid/widget/TextView;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_2
    :goto_1
    return-void
.end method
