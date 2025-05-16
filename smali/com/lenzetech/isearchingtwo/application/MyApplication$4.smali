.class Lcom/lenzetech/isearchingtwo/application/MyApplication$4;
.super Ljava/lang/Object;
.source "MyApplication.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/application/MyApplication;->startDiscovery()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;)V
    .locals 0

    .line 495
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$4;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-string v0, "\u84dd\u7259"

    const-string v1, "\u505c\u6b62\u626b\u63cf"

    .line 498
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$4;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$300(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Landroid/bluetooth/le/BluetoothLeScanner;

    move-result-object v0

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$4;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-static {v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$200(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Landroid/bluetooth/le/ScanCallback;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/bluetooth/le/BluetoothLeScanner;->stopScan(Landroid/bluetooth/le/ScanCallback;)V

    return-void
.end method
