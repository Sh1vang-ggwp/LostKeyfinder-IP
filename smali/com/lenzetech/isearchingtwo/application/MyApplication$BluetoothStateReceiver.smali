.class Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MyApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/application/MyApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BluetoothStateReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;


# direct methods
.method private constructor <init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;)V
    .locals 0

    .line 1165
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Lcom/lenzetech/isearchingtwo/application/MyApplication$1;)V
    .locals 0

    .line 1165
    invoke-direct {p0, p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1169
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "BluetoothStateReceiver onReceive: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "hello"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1170
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, -0x1

    const-string v0, "android.bluetooth.adapter.extra.STATE"

    .line 1171
    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/16 p2, 0xc

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 1176
    :cond_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->startDiscovery()V

    :cond_1
    :goto_0
    return-void
.end method
