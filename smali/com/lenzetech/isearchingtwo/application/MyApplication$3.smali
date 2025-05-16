.class Lcom/lenzetech/isearchingtwo/application/MyApplication$3;
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

.field final synthetic val$scanFilter:Landroid/bluetooth/le/ScanFilter;

.field final synthetic val$settings:Landroid/bluetooth/le/ScanSettings;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/bluetooth/le/ScanFilter;Landroid/bluetooth/le/ScanSettings;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 484
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$3;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$3;->val$scanFilter:Landroid/bluetooth/le/ScanFilter;

    iput-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$3;->val$settings:Landroid/bluetooth/le/ScanSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const-string v0, "\u84dd\u7259"

    const-string v1, "\u5f00\u59cb\u626b\u63cf"

    .line 487
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$3;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$300(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Landroid/bluetooth/le/BluetoothLeScanner;

    move-result-object v0

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$3;->val$scanFilter:Landroid/bluetooth/le/ScanFilter;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$3;->val$settings:Landroid/bluetooth/le/ScanSettings;

    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$3;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-static {v3}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$200(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Landroid/bluetooth/le/ScanCallback;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/bluetooth/le/BluetoothLeScanner;->startScan(Ljava/util/List;Landroid/bluetooth/le/ScanSettings;Landroid/bluetooth/le/ScanCallback;)V

    return-void
.end method
