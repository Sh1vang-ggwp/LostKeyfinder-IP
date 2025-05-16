.class Lcom/lenzetech/isearchingtwo/activity/LaunchActivity$1;
.super Ljava/lang/Object;
.source "LaunchActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;)V
    .locals 0

    .line 19
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/LaunchActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 22
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LaunchActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/activity/LaunchActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;

    const-class v3, Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;->startActivity(Landroid/content/Intent;)V

    .line 23
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LaunchActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;->finish()V

    return-void
.end method
