.class Lcom/jianjin/camera/widget/CameraContainer$1;
.super Ljava/lang/Object;
.source "CameraContainer.java"

# interfaces
.implements Lcom/jianjin/camera/SensorController$CameraFocusListener;


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

    .line 80
    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraContainer$1;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocus()V
    .locals 3

    .line 83
    new-instance v0, Landroid/graphics/Point;

    sget v1, Lcom/jianjin/camera/utils/UIUtils;->screenWidth:I

    div-int/lit8 v1, v1, 0x2

    sget v2, Lcom/jianjin/camera/utils/UIUtils;->screenHeight:I

    div-int/lit8 v2, v2, 0x2

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 85
    iget-object v1, p0, Lcom/jianjin/camera/widget/CameraContainer$1;->this$0:Lcom/jianjin/camera/widget/CameraContainer;

    invoke-static {v1, v0}, Lcom/jianjin/camera/widget/CameraContainer;->access$000(Lcom/jianjin/camera/widget/CameraContainer;Landroid/graphics/Point;)V

    return-void
.end method
