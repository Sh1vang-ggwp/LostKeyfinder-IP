.class Lcom/jianjin/camera/widget/CameraPreview$1;
.super Landroid/view/OrientationEventListener;
.source "CameraPreview.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jianjin/camera/widget/CameraPreview;->startOrientationChangeListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jianjin/camera/widget/CameraPreview;


# direct methods
.method constructor <init>(Lcom/jianjin/camera/widget/CameraPreview;Landroid/content/Context;)V
    .locals 0

    .line 412
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview$1;->this$0:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 4

    const/4 v0, 0x0

    const/16 v1, 0x2d

    if-ltz p1, :cond_0

    if-le p1, v1, :cond_4

    :cond_0
    const/16 v2, 0x13b

    if-le p1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/16 v3, 0x87

    if-le p1, v1, :cond_2

    if-gt p1, v3, :cond_2

    const/16 v0, 0x5a

    goto :goto_0

    :cond_2
    const/16 v1, 0xe1

    if-le p1, v3, :cond_3

    if-gt p1, v1, :cond_3

    const/16 v0, 0xb4

    goto :goto_0

    :cond_3
    if-le p1, v1, :cond_4

    if-gt p1, v2, :cond_4

    const/16 v0, 0x10e

    .line 427
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview$1;->this$0:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-static {p1}, Lcom/jianjin/camera/widget/CameraPreview;->access$000(Lcom/jianjin/camera/widget/CameraPreview;)I

    move-result p1

    if-ne v0, p1, :cond_5

    return-void

    .line 429
    :cond_5
    iget-object p1, p0, Lcom/jianjin/camera/widget/CameraPreview$1;->this$0:Lcom/jianjin/camera/widget/CameraPreview;

    invoke-static {p1, v0}, Lcom/jianjin/camera/widget/CameraPreview;->access$002(Lcom/jianjin/camera/widget/CameraPreview;I)I

    return-void
.end method
