.class Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$2;
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

    .line 246
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 249
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->takePhotots()V

    return-void
.end method
