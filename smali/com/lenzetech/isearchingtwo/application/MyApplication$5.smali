.class Lcom/lenzetech/isearchingtwo/application/MyApplication$5;
.super Landroid/bluetooth/BluetoothGattCallback;
.source "MyApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/application/MyApplication;->ConnectBleByIndexORMac(Ljava/lang/Integer;Ljava/lang/String;)V
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

    .line 784
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-direct {p0}, Landroid/bluetooth/BluetoothGattCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 6

    .line 1064
    invoke-super {p0, p1, p2}, Landroid/bluetooth/BluetoothGattCallback;->onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    .line 1067
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0000ffe1-0000-1000-8000-00805f9b34fb"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1069
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 1070
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 1071
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u84dd\u7259"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u83b7\u53d6\u5230\u6309\u952e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-byte v5, v0, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1074
    :cond_0
    array-length v2, v0

    if-lez v2, :cond_1

    .line 1075
    aget-byte v0, v0, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1077
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1078
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u84dd\u7259\u7279\u5f81\u503c"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "\u6539\u53d8"

    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1080
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p2

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->OnFDQClick(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public onCharacteristicRead(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 1

    .line 1043
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onCharacteristicRead(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V

    .line 1046
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p3

    if-eqz p3, :cond_0

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p3

    array-length p3, p3

    const/4 v0, 0x1

    if-lt p3, v0, :cond_0

    .line 1047
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object p2

    const/4 p3, 0x0

    aget-byte p2, p2, p3

    .line 1048
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p1, p3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBattery(Ljava/lang/Integer;)V

    .line 1049
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u8bbe\u7f6e\u7535\u91cf"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "\u84dd\u7259"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 0

    .line 1056
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V

    const-string p2, "\u84dd\u7259"

    const-string p3, "\u5199\u5165"

    .line 1057
    invoke-static {p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1059
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->onDeviceSucceedWrite(Ljava/lang/String;)V

    return-void
.end method

.method public onConnectionStateChange(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 3

    .line 799
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onConnectionStateChange(Landroid/bluetooth/BluetoothGatt;II)V

    .line 801
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onConnectionStateChange: status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "MyApplication"

    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p2, 0x1

    const-string v0, "\u84dd\u7259"

    if-eqz p3, :cond_1

    const/4 v1, 0x2

    if-eq p3, v1, :cond_0

    goto/16 :goto_0

    .line 805
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5df2\u7ecf\u8fde\u63a5 \u5f00\u59cb\u53d1\u73b0\u670d\u52a1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 806
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z

    .line 807
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->dismiss()V

    .line 809
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p3, p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setMine(Z)V

    .line 810
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p2, p2, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p3

    invoke-virtual {p3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->save()Z

    .line 812
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    new-instance p3, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;

    sget-object v0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_DISMISS:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, v0, p1}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;-><init>(Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->sendDialogEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V

    goto/16 :goto_0

    .line 824
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u8bbe\u5907\u65ad\u5f00\u8fde\u63a5"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_2

    return-void

    .line 831
    :cond_2
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    const/4 v0, 0x0

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ConnectBleByIndexORMac(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 833
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isConnect()Z

    move-result p3

    if-nez p3, :cond_3

    return-void

    .line 838
    :cond_3
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 839
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    new-instance v0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;

    sget-object v1, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_SHOW:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;-><init>(Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;Ljava/lang/String;)V

    invoke-virtual {p3, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->sendDialogEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V

    .line 844
    :cond_4
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0f0043

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->SetBtnTextByAddress(Ljava/lang/String;Ljava/lang/String;)V

    .line 845
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->dismiss()V

    .line 848
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setConnect(Z)V

    const-string p3, "\u8bbe\u5907\u8fde\u63a5\u6210\u529f\uff0c\u8bbe\u7f6e\u62a5\u8b66\u4e3afals"

    const-string v0, ""

    .line 854
    invoke-static {p3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 855
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p3, p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setAlarming(Z)V

    .line 859
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p2

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    .line 863
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    move-result-object p2

    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBleNickName()Ljava/lang/String;

    move-result-object p3

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object v1, v1, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getAddresss()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, p3, v1}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getCurrentLocation(Ljava/lang/String;Ljava/lang/String;)V

    .line 870
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p3

    invoke-virtual {p3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getBleItemByMac(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    move-result-object p2

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarmOnDisconnect()Z

    move-result p2

    if-nez p2, :cond_5

    const-string p1, "\u65ad\u5f00\u4e0d\u62a5\u8b66\uff0c\u4e0d\u62a5\u8b66"

    .line 871
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 875
    :cond_5
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p2

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->shouleWifiSettingAlarm()Z

    move-result p2

    if-nez p2, :cond_6

    const-string p1, "Wifi\u5224\u65ad\u5728WIFI\u52ff\u6270\u6a21\u5f0f\u4e0b\uff0c\u4e0d\u62a5\u8b66"

    .line 876
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 880
    :cond_6
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p2

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->showTimeAlarm()Z

    move-result p2

    if-nez p2, :cond_7

    const-string p1, "\u65f6\u95f4\u5224\u65ad\u5728\u52ff\u6270\u65f6\u95f4\u5185 \u4e0d\u62a5\u8b66"

    .line 881
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 887
    :cond_7
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p2

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySound(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onDescriptorRead(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V
    .locals 0

    .line 1090
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onDescriptorRead(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V

    return-void
.end method

.method public onDescriptorWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V
    .locals 0

    .line 1095
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onDescriptorWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V

    const-string p1, "\u84dd\u7259"

    const-string p2, "\u63cf\u8ff0"

    .line 1096
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onMtuChanged(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 0

    .line 1124
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onMtuChanged(Landroid/bluetooth/BluetoothGatt;II)V

    const-string p1, "\u84dd\u7259"

    const-string p2, "Mtu\u6539\u53d8"

    .line 1125
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onPhyRead(Landroid/bluetooth/BluetoothGatt;III)V
    .locals 0

    .line 793
    invoke-super {p0, p1, p2, p3, p4}, Landroid/bluetooth/BluetoothGattCallback;->onPhyRead(Landroid/bluetooth/BluetoothGatt;III)V

    const-string p1, "\u84dd\u7259"

    const-string p2, "\u9605\u8bfb"

    .line 794
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onPhyUpdate(Landroid/bluetooth/BluetoothGatt;III)V
    .locals 0

    .line 787
    invoke-super {p0, p1, p2, p3, p4}, Landroid/bluetooth/BluetoothGattCallback;->onPhyUpdate(Landroid/bluetooth/BluetoothGatt;III)V

    const-string p1, "\u84dd\u7259"

    const-string p2, "\u66f4\u65b0"

    .line 788
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onReadRemoteRssi(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 1

    .line 1107
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onReadRemoteRssi(Landroid/bluetooth/BluetoothGatt;II)V

    .line 1110
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 1111
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u4fe1\u53f7"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "bleItemHashMap\u8bbe\u7f6e"

    invoke-static {v0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1112
    iget-object p3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p3, p3, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setRssi(Ljava/lang/Integer;)V

    .line 1113
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p2, p2, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p3

    invoke-virtual {p3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->save()Z

    .line 1115
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p2, p2, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public onReliableWriteCompleted(Landroid/bluetooth/BluetoothGatt;I)V
    .locals 0

    .line 1101
    invoke-super {p0, p1, p2}, Landroid/bluetooth/BluetoothGattCallback;->onReliableWriteCompleted(Landroid/bluetooth/BluetoothGatt;I)V

    const-string p1, "\u84dd\u7259"

    const-string p2, "\u53ef\u8bfb"

    .line 1102
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V
    .locals 11

    .line 896
    invoke-super {p0, p1, p2}, Landroid/bluetooth/BluetoothGattCallback;->onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V

    .line 897
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u53d1\u73b0\u670d\u52a1\u5b8c\u6bd5:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u84dd\u7259"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p2, :cond_8

    const-string p2, "\u84dd\u7259\u8fde\u63a5\u5230\u670d\u52a1"

    .line 905
    invoke-static {v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 909
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getServices()Ljava/util/List;

    move-result-object p2

    .line 910
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const-string v0, ""

    move-object v2, v0

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/bluetooth/BluetoothGattService;

    .line 911
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u670d\u52a1uuid"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothGattService;->getUuid()Ljava/util/UUID;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 913
    invoke-virtual {v3}, Landroid/bluetooth/BluetoothGattService;->getCharacteristics()Ljava/util/List;

    move-result-object v6

    .line 914
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 915
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u7279\u5f81\u503cuuid"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v9, v0

    const/4 v8, 0x0

    .line 919
    :goto_1
    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptors()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-ge v8, v10, :cond_1

    .line 920
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " Descriptors UUID:"

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptors()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/bluetooth/BluetoothGattDescriptor;

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothGattDescriptor;->getUuid()Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " Descriptors Value"

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 921
    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptors()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/bluetooth/BluetoothGattDescriptor;

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothGattDescriptor;->getValue()[B

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 925
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "ServerUUID:"

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothGattService;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " CharaUUID:"

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " CharaProperities:"

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v2

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 927
    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "00002a06-0000-1000-8000-00805f9b34fb"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const-string v8, "\u9632\u4e22\u5668\u8981\u54cd\u4e86"

    .line 928
    invoke-static {v1, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 931
    iget-object v8, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object v8, v8, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v9

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 932
    iget-object v8, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object v8, v8, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v9

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 934
    iget-object v7, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-virtual {v7}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->UPDATERssi()V

    goto/16 :goto_2

    .line 936
    :cond_2
    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "0000ffe1-0000-1000-8000-00805f9b34fb"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 940
    invoke-virtual {p1, v7, v5}, Landroid/bluetooth/BluetoothGatt;->setCharacteristicNotification(Landroid/bluetooth/BluetoothGattCharacteristic;Z)Z

    .line 941
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v9

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "\u53d1\u73b0FFE1-"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Landroid/bluetooth/BluetoothGattCharacteristic;->getStringValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v8, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 943
    :cond_3
    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "0000ffe2-0000-1000-8000-00805f9b34fb"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    const-string v8, "\u53d1\u73b0\u5199\u5165\u670d\u52a1\u7684Chara"

    .line 946
    invoke-static {v1, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 947
    iget-object v8, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object v8, v8, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleAlarmWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v9

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 950
    iget-object v7, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object v7, v7, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v8

    invoke-virtual {v8}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 951
    iget-object v7, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object v7, v7, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v8

    invoke-virtual {v8}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v7}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarmOnDisconnect()Z

    move-result v7

    .line 952
    iget-object v8, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v9

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v7}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->SetDeviceISAlarm(Ljava/lang/String;Z)V

    goto :goto_2

    .line 954
    :cond_4
    iget-object v7, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v8

    invoke-virtual {v8}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v4}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->SetDeviceISAlarm(Ljava/lang/String;Z)V

    goto :goto_2

    .line 963
    :cond_5
    invoke-virtual {v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "00002a19-0000-1000-8000-00805f9b34fb"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    const-string v8, "\u8bfb\u53d6\u7535\u91cf\u4fe1\u606f"

    .line 965
    invoke-static {v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 966
    invoke-virtual {p1, v7}, Landroid/bluetooth/BluetoothGatt;->readCharacteristic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z

    :cond_6
    :goto_2
    const-string v7, "\u6253\u5370\u7279\u5f81"

    .line 969
    invoke-static {v7, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 977
    :cond_7
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-static {p2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$100(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Ljava/util/HashMap;

    move-result-object p2

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;

    .line 978
    invoke-virtual {p2, v2}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->setDeviceCharacterInfo(Ljava/lang/String;)V

    .line 979
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    new-instance v1, Lokhttp3/logging/HttpLoggingInterceptor;

    invoke-direct {v1}, Lokhttp3/logging/HttpLoggingInterceptor;-><init>()V

    sget-object v2, Lokhttp3/logging/HttpLoggingInterceptor$Level;->BODY:Lokhttp3/logging/HttpLoggingInterceptor$Level;

    .line 980
    invoke-virtual {v1, v2}, Lokhttp3/logging/HttpLoggingInterceptor;->setLevel(Lokhttp3/logging/HttpLoggingInterceptor$Level;)Lokhttp3/logging/HttpLoggingInterceptor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 981
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    .line 982
    new-instance v1, Lokhttp3/FormBody$Builder;

    invoke-direct {v1}, Lokhttp3/FormBody$Builder;-><init>()V

    .line 983
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "name"

    invoke-virtual {v1, v3, v2}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v1

    .line 984
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->getDeviceAdvInfo()Ljava/lang/String;

    move-result-object v2

    const-string v3, "adv"

    invoke-virtual {v1, v3, v2}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v1

    .line 985
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->getDeviceMac()Ljava/lang/String;

    move-result-object v2

    const-string v3, "mac"

    invoke-virtual {v1, v3, v2}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v1

    .line 986
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->getDeviceCharacterInfo()Ljava/lang/String;

    move-result-object v2

    const-string v3, "charc"

    invoke-virtual {v1, v3, v2}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v1

    .line 987
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->getAppVersion()Ljava/lang/String;

    move-result-object v2

    const-string v3, "appv"

    invoke-virtual {v1, v3, v2}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v1

    .line 988
    invoke-virtual {v1}, Lokhttp3/FormBody$Builder;->build()Lokhttp3/FormBody;

    move-result-object v1

    .line 989
    new-instance v2, Lokhttp3/Request$Builder;

    invoke-direct {v2}, Lokhttp3/Request$Builder;-><init>()V

    const-string v3, "http://47.122.0.200:1234/fdqverify/Index/androidLogin"

    invoke-virtual {v2, v3}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    .line 990
    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    new-instance v1, Lcom/lenzetech/isearchingtwo/application/MyApplication$5$1;

    invoke-direct {v1, p0, p2}, Lcom/lenzetech/isearchingtwo/application/MyApplication$5$1;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication$5;Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;)V

    invoke-interface {v0, v1}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 1018
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0f0027

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->SetBtnTextByAddress(Ljava/lang/String;Ljava/lang/String;)V

    .line 1020
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p2, p2, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p2, v5}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setConnect(Z)V

    .line 1022
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iget-object p2, p2, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p2, v4}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setAlarming(Z)V

    .line 1025
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->SetBtnTextByAddress(Ljava/lang/String;Ljava/lang/String;)V

    .line 1029
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->Pause()V

    .line 1031
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    goto :goto_3

    :cond_8
    const-string p1, "\u53d1\u73b0\u670d\u52a1\u5931\u8d25"

    const-string p2, "\u670d\u52a1\u5931\u8d25"

    .line 1035
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3
    return-void
.end method
