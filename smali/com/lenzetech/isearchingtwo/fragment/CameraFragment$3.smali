.class Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$3;
.super Ljava/lang/Object;
.source "CameraFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->setListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)V
    .locals 0

    .line 288
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$3;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 292
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$3;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->access$100(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)Landroidx/camera/core/Camera;

    move-result-object p1

    invoke-interface {p1}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$3;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->access$100(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)Landroidx/camera/core/Camera;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/CameraInfo;->getTorchState()Landroidx/lifecycle/LiveData;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-interface {p1, v0}, Landroidx/camera/core/CameraControl;->enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;

    return-void
.end method
