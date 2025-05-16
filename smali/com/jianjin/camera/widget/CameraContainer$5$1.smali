.class Lcom/jianjin/camera/widget/CameraContainer$5$1;
.super Ljava/lang/Object;
.source "CameraContainer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jianjin/camera/widget/CameraContainer$5;->onProgressChanged(Landroid/widget/SeekBar;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/jianjin/camera/widget/CameraContainer$5;


# direct methods
.method constructor <init>(Lcom/jianjin/camera/widget/CameraContainer$5;)V
    .locals 0

    .line 165
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$5$1;->this$1:Lcom/jianjin/camera/widget/CameraContainer$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 169
    iget-object v0, p0, Lcom/jianjin/camera/widget/CameraContainer$5$1;->this$1:Lcom/jianjin/camera/widget/CameraContainer$5;

    iget-object v0, v0, Lcom/jianjin/camera/widget/CameraContainer$5;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v0}, Lcom/jianjin/camera/widget/CameraContainer;->access$200(Lcom/jianjin/camera/widget/CameraContainer;)Landroid/widget/SeekBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setVisibility(I)V

    return-void
.end method
