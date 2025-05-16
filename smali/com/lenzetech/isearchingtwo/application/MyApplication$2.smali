.class Lcom/lenzetech/isearchingtwo/application/MyApplication$2;
.super Landroid/bluetooth/le/ScanCallback;
.source "MyApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/application/MyApplication;
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

    .line 309
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$2;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-direct {p0}, Landroid/bluetooth/le/ScanCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onScanResult(ILandroid/bluetooth/le/ScanResult;)V
    .locals 7

    .line 313
    invoke-super {p0, p1, p2}, Landroid/bluetooth/le/ScanCallback;->onScanResult(ILandroid/bluetooth/le/ScanResult;)V

    .line 315
    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 316
    :cond_0
    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getScanRecord()Landroid/bluetooth/le/ScanRecord;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/le/ScanRecord;->getBytes()[B

    move-result-object p1

    .line 318
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\u53d1\u73b0\u8bbe\u5907"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 320
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_1

    .line 321
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getScanRecord()Landroid/bluetooth/le/ScanRecord;

    move-result-object v6

    invoke-virtual {v6}, Landroid/bluetooth/le/ScanRecord;->getBytes()[B

    move-result-object v6

    aget-byte v6, v6, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x6

    .line 325
    aget-byte v3, p1, v3

    const/4 v4, 0x3

    const/4 v5, 0x1

    if-ne v3, v4, :cond_2

    const/4 v3, 0x7

    aget-byte v3, p1, v3

    const/16 v4, 0x19

    if-ne v3, v4, :cond_2

    goto :goto_1

    :cond_2
    const/16 v3, 0x9

    .line 329
    aget-byte v3, p1, v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_3

    const/16 v3, 0xa

    aget-byte p1, p1, v3

    if-ne p1, v5, :cond_3

    const/4 v0, 0x1

    .line 336
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$2;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->OnMyDeviceFound(Landroid/bluetooth/BluetoothDevice;Ljava/lang/Boolean;)V

    .line 338
    new-instance p1, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;

    invoke-direct {p1}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;-><init>()V

    .line 340
    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->setDeviceName(Ljava/lang/String;)V

    .line 342
    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->setDeviceMac(Ljava/lang/String;)V

    .line 344
    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getScanRecord()Landroid/bluetooth/le/ScanRecord;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/le/ScanRecord;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bytesToHex([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->setDeviceAdvInfo(Ljava/lang/String;)V

    .line 346
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$2;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$000(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->setAppVersion(Ljava/lang/String;)V

    .line 348
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$2;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$100(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p2

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
