.class Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$4;
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

    .line 295
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$4;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 298
    new-instance p1, Landroid/content/Intent;

    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v1, "android.intent.action.PICK"

    invoke-direct {p1, v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 299
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$4;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->access$200(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
