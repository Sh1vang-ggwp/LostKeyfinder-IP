.class public Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$UpdateListReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DeviceFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UpdateListReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;


# direct methods
.method public constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;)V
    .locals 0

    .line 219
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$UpdateListReceiver;->this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 224
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$UpdateListReceiver;->this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->access$000(Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;)Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->notifyDataSetChanged()V

    return-void
.end method
