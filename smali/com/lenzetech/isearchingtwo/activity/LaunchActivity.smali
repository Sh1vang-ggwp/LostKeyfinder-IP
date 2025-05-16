.class public Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;
.super Landroid/app/Activity;
.source "LaunchActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 14
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001d

    .line 15
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;->setContentView(I)V

    const/16 p1, 0x7d0

    .line 16
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 17
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 19
    new-instance v1, Lcom/lenzetech/isearchingtwo/activity/LaunchActivity$1;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/activity/LaunchActivity$1;-><init>(Lcom/lenzetech/isearchingtwo/activity/LaunchActivity;)V

    .line 25
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-long v2, p1

    .line 19
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
