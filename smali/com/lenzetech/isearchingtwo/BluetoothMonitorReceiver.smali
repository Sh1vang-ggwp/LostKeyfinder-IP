.class public Lcom/lenzetech/isearchingtwo/BluetoothMonitorReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothMonitorReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 15
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string v0, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    const-string v0, "android.bluetooth.adapter.extra.STATE"

    .line 18
    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/16 p2, 0xa

    if-ne p1, p2, :cond_0

    .line 22
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->initByCloseBl()V

    goto :goto_0

    :cond_0
    const/16 p2, 0xc

    if-ne p1, p2, :cond_1

    .line 24
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->startDiscovery()V

    :cond_1
    :goto_0
    return-void
.end method
