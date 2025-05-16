.class Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$3;
.super Ljava/lang/Object;
.source "DeviceFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;)V
    .locals 0

    .line 123
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$3;->this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 127
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$3;->this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    iget-object v0, v0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->scanBtn:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$3;->this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07005d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
