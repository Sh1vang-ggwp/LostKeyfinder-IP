.class Lcom/lenzetech/isearchingtwo/activity/MainActivity$1;
.super Landroid/os/Handler;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/activity/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/activity/MainActivity;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 77
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 79
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x7b

    if-ne p1, v0, :cond_0

    const-string p1, "notify"

    const-string v0, "\u66f4\u65b0"

    .line 80
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    iget-object p1, p1, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->deviceFragment:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getMyADP()Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
