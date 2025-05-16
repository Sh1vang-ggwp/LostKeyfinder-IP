.class Lcom/jianjin/camera/widget/CameraContainer$7;
.super Landroid/os/Handler;
.source "CameraContainer.java"


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

    .line 388
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$7;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    .line 391
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void
.end method
