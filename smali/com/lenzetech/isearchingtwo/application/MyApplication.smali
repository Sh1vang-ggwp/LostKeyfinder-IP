.class public Lcom/lenzetech/isearchingtwo/application/MyApplication;
.super Landroid/app/Application;
.source "MyApplication.java"

# interfaces
.implements Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;,
        Lcom/lenzetech/isearchingtwo/application/MyApplication$DialogClick;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MyApplication"

.field private static myApplication:Lcom/lenzetech/isearchingtwo/application/MyApplication;


# instance fields
.field public bleAlarmWrireCharaterMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/bluetooth/BluetoothGattCharacteristic;",
            ">;"
        }
    .end annotation
.end field

.field public bleDeviceMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation
.end field

.field public bleGattMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/bluetooth/BluetoothGatt;",
            ">;"
        }
    .end annotation
.end field

.field public bleItemHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;",
            ">;"
        }
    .end annotation
.end field

.field public blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

.field public bleWrireCharaterMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/bluetooth/BluetoothGattCharacteristic;",
            ">;"
        }
    .end annotation
.end field

.field private bluetoothMonitorReceiver:Lcom/lenzetech/isearchingtwo/BluetoothMonitorReceiver;

.field private context:Landroidx/fragment/app/FragmentActivity;

.field dialog_new_message:Landroid/widget/TextView;

.field dialog_new_session:Landroid/widget/TextView;

.field mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field mBluetoothStateReceiver:Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;

.field private mDialog:Landroid/app/Dialog;

.field private mDialog2:Landroid/app/Dialog;

.field private mEventCallback:Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;

.field private mHandler:Landroid/os/Handler;

.field private mHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/content/DialogInterface;",
            ">;"
        }
    .end annotation
.end field

.field private mLeScanner:Landroid/bluetooth/le/BluetoothLeScanner;

.field mediaPlayerTools:Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

.field private myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

.field private scanCallbackH:Landroid/bluetooth/le/ScanCallback;

.field private verifyDic:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 89
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mHashMap:Ljava/util/HashMap;

    .line 110
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->verifyDic:Ljava/util/HashMap;

    .line 166
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    .line 168
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleDeviceMap:Ljava/util/HashMap;

    .line 170
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleWrireCharaterMap:Ljava/util/HashMap;

    .line 172
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    .line 175
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleAlarmWrireCharaterMap:Ljava/util/HashMap;

    const/4 v0, 0x0

    .line 230
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mLeScanner:Landroid/bluetooth/le/BluetoothLeScanner;

    .line 309
    new-instance v1, Lcom/lenzetech/isearchingtwo/application/MyApplication$2;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication$2;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;)V

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->scanCallbackH:Landroid/bluetooth/le/ScanCallback;

    .line 1163
    new-instance v1, Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;

    invoke-direct {v1, p0, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Lcom/lenzetech/isearchingtwo/application/MyApplication$1;)V

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mBluetoothStateReceiver:Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;

    .line 1253
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Landroidx/fragment/app/FragmentActivity;
    .locals 0

    .line 89
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->context:Landroidx/fragment/app/FragmentActivity;

    return-object p0
.end method

.method static synthetic access$100(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Ljava/util/HashMap;
    .locals 0

    .line 89
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->verifyDic:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$200(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Landroid/bluetooth/le/ScanCallback;
    .locals 0

    .line 89
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->scanCallbackH:Landroid/bluetooth/le/ScanCallback;

    return-object p0
.end method

.method static synthetic access$300(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Landroid/bluetooth/le/BluetoothLeScanner;
    .locals 0

    .line 89
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mLeScanner:Landroid/bluetooth/le/BluetoothLeScanner;

    return-object p0
.end method

.method static synthetic access$500(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;
    .locals 0

    .line 89
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mEventCallback:Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;

    return-object p0
.end method

.method static synthetic access$602(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0

    .line 89
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$702(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0

    .line 89
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog2:Landroid/app/Dialog;

    return-object p1
.end method

.method public static bytesToHex([B)Ljava/lang/String;
    .locals 6

    .line 365
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 367
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    .line 368
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    .line 369
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    const/16 v4, 0x30

    .line 370
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 372
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 375
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;
    .locals 1

    .line 225
    sget-object v0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->myApplication:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    return-object v0
.end method

.method public static getVersionName(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 355
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 356
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 357
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 359
    invoke-virtual {p0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method

.method private registerReceiver()V
    .locals 2

    .line 1190
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 1191
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1192
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mBluetoothStateReceiver:Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private unregisterReceiver()V
    .locals 1

    .line 1197
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mBluetoothStateReceiver:Lcom/lenzetech/isearchingtwo/application/MyApplication$BluetoothStateReceiver;

    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method


# virtual methods
.method public AlarmByAddress(Ljava/lang/String;)V
    .locals 5

    .line 619
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5f00\u59cb\u62a5\u8b66"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\u5f00\u59cb\u62a5\u8b661"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 620
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 621
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\u5f00\u59cb\u62a5\u8b662"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\u5f00\u59cb\u62a5\u8b664"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGattCharacteristic;

    const/4 v2, 0x1

    new-array v3, v2, [B

    const/4 v4, 0x0

    aput-byte v2, v3, v4

    invoke-virtual {v0, v3}, Landroid/bluetooth/BluetoothGattCharacteristic;->setValue([B)Z

    .line 628
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u5f00\u59cb\u62a5\u8b665"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGatt;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothGattCharacteristic;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothGatt;->writeCharacteristic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z

    return-void

    .line 623
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u5f00\u59cb\u62a5\u8b663"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public CancleAlarmByAddress(Ljava/lang/String;)V
    .locals 4

    .line 635
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5f00\u59cb\u62a5\u8b66"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\u5f00\u59cb\u62a5\u8b661"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 636
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 637
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\u5f00\u59cb\u62a5\u8b662"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\u5f00\u59cb\u62a5\u8b664"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 643
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGattCharacteristic;

    const/4 v2, 0x1

    new-array v2, v2, [B

    const/4 v3, 0x0

    aput-byte v3, v2, v3

    invoke-virtual {v0, v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->setValue([B)Z

    .line 644
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u5f00\u59cb\u62a5\u8b665"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 645
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGatt;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothGattCharacteristic;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothGatt;->writeCharacteristic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z

    return-void

    .line 639
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u5f00\u59cb\u62a5\u8b663"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V
    .locals 2

    const-string v0, "\u4fee\u6539"

    const-string v1, "\u5f00\u59cb\u4fee\u6539\u8bbe\u5907\u8bbe\u7f6e"

    .line 272
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    .line 275
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "\u4fee\u6539\u6210\u529f\uff0c\u83b7\u53d6\u5230\u8bbe\u5907"

    const-string v1, "222"

    .line 276
    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string p1, "\u4fee\u6539\u5931\u8d25\uff0c\u8bbe\u5907\u4e3a\u7a7a"

    const-string v1, "333"

    .line 279
    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    if-eqz p2, :cond_1

    .line 284
    invoke-virtual {v0, p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBleNickName(Ljava/lang/String;)V

    .line 285
    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->save()Z

    :cond_1
    if-eqz p5, :cond_2

    .line 289
    invoke-virtual {v0, p5}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setImageByte([B)V

    .line 290
    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->save()Z

    :cond_2
    if-eqz p3, :cond_3

    .line 294
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setAlarmOnDisconnect(Z)V

    .line 295
    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->save()Z

    :cond_3
    if-eqz p4, :cond_4

    .line 299
    invoke-virtual {v0, p4}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setRingIndex(Ljava/lang/Integer;)V

    .line 300
    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->save()Z

    .line 304
    :cond_4
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    return-void
.end method

.method public ConnectBleByIndexORMac(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 2

    const-string v0, "\u66f4\u65b0bluetoothDevice"

    if-eqz p1, :cond_0

    const-string p2, "\u84dd\u7259bluetoothDevice1"

    .line 769
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 770
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aget-object p1, p2, p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    .line 771
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleDeviceMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getAddresss()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothDevice;

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    const-string p1, "\u84dd\u7259bluetoothDevice2"

    .line 773
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 774
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    .line 775
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleDeviceMap:Ljava/util/HashMap;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothDevice;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_2

    const-string p1, "\u84dd\u7259bluetoothDevice3"

    .line 780
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    const-string p2, "\u84dd\u7259bluetoothDevice"

    .line 783
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 784
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    const/4 v0, 0x0

    new-instance v1, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication$5;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;)V

    invoke-virtual {p1, p2, v0, v1}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;)Landroid/bluetooth/BluetoothGatt;

    return-void
.end method

.method public InitBle(Landroidx/fragment/app/FragmentActivity;)V
    .locals 2

    .line 234
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->context:Landroidx/fragment/app/FragmentActivity;

    .line 236
    new-instance v0, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-direct {v0, p1}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    .line 239
    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isSupportBLE()Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f0f005b

    const/4 v1, 0x1

    .line 240
    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 244
    :cond_0
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "bluetooth"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothManager;

    .line 245
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 247
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p1, v0, :cond_1

    .line 248
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothLeScanner()Landroid/bluetooth/le/BluetoothLeScanner;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mLeScanner:Landroid/bluetooth/le/BluetoothLeScanner;

    .line 258
    :cond_1
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result p1

    const-string v0, "\u84dd\u7259"

    if-eqz p1, :cond_2

    const-string p1, "\u8bbe\u5907\u5f00\u542f\u84dd\u7259"

    .line 259
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->startDiscovery()V

    goto :goto_0

    :cond_2
    const-string p1, "\u8bbe\u5907\u6ca1\u6709\u5f00\u542f\u84dd\u7259"

    .line 262
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->checkNOpenBl()Z

    :goto_0
    return-void
.end method

.method public LoadFromDisk()V
    .locals 6

    .line 194
    const-class v0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    const/4 v1, 0x0

    new-array v2, v1, [J

    invoke-static {v0, v2}, Lorg/litepal/LitePal;->findAll(Ljava/lang/Class;[J)Ljava/util/List;

    move-result-object v0

    .line 196
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "LoadFromDisk\u4ece\u672c\u5730\u5f00\u59cb\u52a0\u8f7d\u8bbe\u5907"

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    .line 198
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 201
    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v4}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getAddresss()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    const-string v4, "LoadFromDisk"

    if-eqz v3, :cond_0

    .line 203
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "\u8bbe\u5907\u5217\u8868\u4e2d\u5b58\u5728"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 205
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "\u8bbe\u5907\u5217\u8868\u4e2d\u4e0d\u5b58\u5728\uff0c\u6dfb\u52a0\u5230\u663e\u793a\u5217\u8868"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v4}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getAddresss()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v4}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getAddresss()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    const v4, 0x7f0f0098

    .line 210
    invoke-virtual {p0, v4}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBtnShowText(Ljava/lang/String;)V

    .line 211
    invoke-virtual {v3, v1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setConnect(Z)V

    const/4 v4, 0x1

    .line 212
    invoke-virtual {v3, v4}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setMine(Z)V

    .line 216
    :goto_1
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_1
    return-void
.end method

.method public OnItemSettingClick(Ljava/lang/String;)V
    .locals 3

    if-nez p1, :cond_0

    .line 699
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mac\u5730\u5740\u4e3a\u7a7a\uff0c\u4e0d\u8fdb\u884c\u8bbe\u7f6e"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u84dd\u7259"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 703
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 705
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    .line 707
    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isConnect()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 709
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "mac"

    .line 711
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p1, 0x10000000

    .line 712
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 713
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->startActivity(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public OnMyDeviceFound(Landroid/bluetooth/BluetoothDevice;Ljava/lang/Boolean;)V
    .locals 6

    .line 508
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleDeviceMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const v2, 0x7f0f0098

    if-eqz v0, :cond_2

    .line 512
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBtnShowText()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 513
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    const v0, 0x7f0f0026

    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBtnShowText(Ljava/lang/String;)V

    .line 516
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isMine()Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "\u53d1\u73b0\u6211\u4eec\u7684\u8bbe\u5907\uff0c"

    const-string v0, "\u8fde\u63a5\u5230\u6211\u7684\u8bbe\u5907"

    .line 517
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v1, p2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ConnectBleByIndexORMac(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 520
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    const p2, 0x7f0f003b

    invoke-virtual {p0, p2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBtnShowText(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p1, "\u53d1\u73b0\u6211\u4eec\u7684\u8bbe222\u5907\uff0c"

    const-string p2, "\u8fde\u63a5\u5230\u6211\u7684222\u8bbe\u5907"

    .line 522
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 525
    :goto_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    const-string p1, "\u5237\u65b0\u8bbe\u59071"

    const-string p2, "\u8bbe\u5907\u5b58\u5728"

    .line 526
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 528
    :cond_1
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBtnShowText()Ljava/lang/String;

    move-result-object p1

    const-string p2, "\u5237\u65b0\u8bbe\u59072"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 531
    :cond_2
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    const/16 v3, 0x8

    if-lt v0, v3, :cond_3

    return-void

    .line 539
    :cond_3
    new-instance v0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;-><init>()V

    .line 540
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, " [\n`~!@#$%^&*()+=|{}\':;\',\\[\\].<>/?~\uff01@#\uffe5%\u2026\u2026&*\uff08\uff09\u2014\u2014+|{}\u3010\u3011\u2018\uff1b\uff1a\u201d\u201c\u2019\u3002\uff0c \u3001\uff1f] 0"

    .line 545
    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 546
    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    const-string v4, " "

    .line 547
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 548
    invoke-virtual {v0, v3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBleNickName(Ljava/lang/String;)V

    .line 549
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "OnMyDeviceFound123: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "MyApplication"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 566
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setAddresss(Ljava/lang/String;)V

    .line 567
    invoke-virtual {p0, v2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBtnShowText(Ljava/lang/String;)V

    .line 568
    invoke-virtual {v0, v1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setImageByte([B)V

    .line 571
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 572
    invoke-virtual {v0, p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setHasBattery(Ljava/lang/Boolean;)V

    .line 577
    :cond_4
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 579
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    :goto_1
    return-void
.end method

.method public SetBtnTextByAddress(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 601
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBtnShowText(Ljava/lang/String;)V

    .line 603
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    return-void
.end method

.method public SetDeviceISAlarm(Ljava/lang/String;Z)V
    .locals 4

    .line 653
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u8bbe\u7f6e\u65ad\u5f00\u662f\u5426\u62a5\u8b66"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 654
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleAlarmWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 661
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    const/4 v2, 0x1

    if-ne p2, v2, :cond_0

    .line 666
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v3, "\u8bbe\u7f6e\u65ad\u5f00\u662f\u5426\u62a5\u8b66:\u65ad\u5f00\u62a5\u8b66"

    invoke-static {v3, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 667
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleAlarmWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/bluetooth/BluetoothGattCharacteristic;

    new-array v3, v2, [B

    aput-byte v2, v3, v0

    invoke-virtual {p2, v3}, Landroid/bluetooth/BluetoothGattCharacteristic;->setValue([B)Z

    goto :goto_0

    .line 671
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v3, "\u8bbe\u7f6e\u65ad\u5f00\u662f\u5426\u62a5\u8b66:\u4e0d\u62a5\u8b66"

    invoke-static {v3, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 672
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleAlarmWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/bluetooth/BluetoothGattCharacteristic;

    new-array v2, v2, [B

    aput-byte v0, v2, v0

    invoke-virtual {p2, v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->setValue([B)Z

    .line 676
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u8bbe\u7f6e\u65ad\u5f00\u662f\u5426\u62a5\u8b66OK"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 678
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 679
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/bluetooth/BluetoothGatt;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleAlarmWrireCharaterMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothGattCharacteristic;

    invoke-virtual {p2, p1}, Landroid/bluetooth/BluetoothGatt;->writeCharacteristic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z

    :cond_1
    return-void

    .line 657
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public SetIsAlarmingByMac(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 687
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 688
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setAlarming(Z)V

    :cond_0
    return-void
.end method

.method public UPDATERssi()V
    .locals 3

    .line 1147
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "\u8bbe\u5907\u4fe1\u606f"

    .line 1148
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1150
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothGatt;->readRemoteRssi()Z

    .line 1152
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public deleteItemByMac(Ljava/lang/String;)V
    .locals 1

    .line 734
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->delete()I

    .line 742
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 747
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 750
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 751
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 755
    :cond_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->LoadFromDisk()V

    .line 757
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    return-void
.end method

.method public dialogbleconnect(Ljava/lang/String;)Landroid/app/Dialog;
    .locals 5

    .line 1257
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss "

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 1258
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 1259
    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 1262
    new-instance v1, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    invoke-static {}, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f1000cd

    .line 1264
    invoke-virtual {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->style(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 1265
    invoke-virtual {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->cancelTouchout(Z)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    const/16 v3, 0x12c

    .line 1266
    invoke-virtual {v1, v3}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->widthdp(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    const/16 v3, 0x1ae

    .line 1267
    invoke-virtual {v1, v3}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->heightdp(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    const v3, 0x7f0b0038

    .line 1268
    invoke-virtual {v1, v3}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->view(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    .line 1270
    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->build()Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;

    move-result-object v1

    .line 1271
    new-instance v3, Lcom/lenzetech/isearchingtwo/application/MyApplication$7;

    invoke-direct {v3, p0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication$7;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/content/DialogInterface;)V

    const v4, 0x7f080079

    invoke-virtual {v1, v4, v3}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->addViewOnclick(ILcom/lenzetech/isearchingtwo/application/MyApplication$DialogClick;)V

    .line 1289
    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->show()V

    .line 1291
    invoke-virtual {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->setCancelable(Z)V

    .line 1295
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1296
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBleNickName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "iTAG"

    :goto_0
    const v2, 0x7f08007e

    .line 1301
    invoke-virtual {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->dialog_new_session:Landroid/widget/TextView;

    .line 1302
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const p1, 0x7f0f0040

    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x7f08007d

    .line 1303
    invoke-virtual {v1, p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->dialog_new_message:Landroid/widget/TextView;

    .line 1304
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v1
.end method

.method public dialogbledoubleclick(Ljava/lang/String;)Landroid/app/Dialog;
    .locals 5

    .line 1334
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss "

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 1335
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 1336
    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 1339
    new-instance v1, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    invoke-static {}, Lcom/blankj/utilcode/util/ActivityUtils;->getTopActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f1000cd

    .line 1341
    invoke-virtual {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->style(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 1342
    invoke-virtual {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->cancelTouchout(Z)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    const/16 v3, 0x12c

    .line 1343
    invoke-virtual {v1, v3}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->widthdp(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    const/16 v3, 0x1ae

    .line 1344
    invoke-virtual {v1, v3}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->heightdp(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    const v3, 0x7f0b0038

    .line 1345
    invoke-virtual {v1, v3}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->view(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;

    move-result-object v1

    .line 1347
    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->build()Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;

    move-result-object v1

    .line 1348
    new-instance v3, Lcom/lenzetech/isearchingtwo/application/MyApplication$8;

    invoke-direct {v3, p0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication$8;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/content/DialogInterface;)V

    const v4, 0x7f080079

    invoke-virtual {v1, v4, v3}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->addViewOnclick(ILcom/lenzetech/isearchingtwo/application/MyApplication$DialogClick;)V

    .line 1364
    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->show()V

    .line 1366
    invoke-virtual {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->setCancelable(Z)V

    .line 1369
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1370
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBleNickName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "iTAG"

    :goto_0
    const v2, 0x7f08007e

    .line 1373
    invoke-virtual {v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->dialog_new_session:Landroid/widget/TextView;

    .line 1374
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const p1, 0x7f0f0041

    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x7f08007d

    .line 1375
    invoke-virtual {v1, p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->dialog_new_message:Landroid/widget/TextView;

    .line 1376
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v1
.end method

.method public getBleItemByMac(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;
    .locals 1

    .line 724
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    return-object p1
.end method

.method public getBleItemByid(Ljava/lang/Integer;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;
    .locals 1

    .line 585
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aget-object p1, v0, p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    return-object p1
.end method

.method public initByCloseBl()V
    .locals 1

    .line 179
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    .line 181
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleDeviceMap:Ljava/util/HashMap;

    .line 183
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleWrireCharaterMap:Ljava/util/HashMap;

    .line 185
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleGattMap:Ljava/util/HashMap;

    .line 187
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleAlarmWrireCharaterMap:Ljava/util/HashMap;

    .line 188
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->LoadFromDisk()V

    return-void
.end method

.method public isWifi()Z
    .locals 2

    .line 1132
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    .line 1133
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 1134
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1136
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onCreate()V
    .locals 2

    .line 115
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 117
    invoke-static {p0}, Lcom/blankj/utilcode/util/Utils;->init(Landroid/app/Application;)V

    .line 118
    invoke-virtual {p0, p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->setEventCallbackZ(Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;)V

    .line 121
    invoke-static {p0}, Lorg/litepal/LitePal;->initialize(Landroid/content/Context;)V

    .line 124
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->InitUserSetting()V

    .line 125
    sput-object p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->myApplication:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    .line 127
    new-instance v0, Lcom/lenzetech/isearchingtwo/application/MyApplication$1;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication$1;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mHandler:Landroid/os/Handler;

    const-string v0, "MyApplication\u4ee3\u7801\u542f\u52a8\u4e86\uff01"

    .line 136
    invoke-static {v0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-static {p0}, Lcom/jianjin/camera/CustomCameraAgent;->init(Landroid/app/Application;)V

    .line 146
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->LoadFromDisk()V

    .line 149
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 152
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lenzetech/isearchingtwo/MyService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 153
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 157
    :goto_0
    new-instance v0, Lcom/lenzetech/isearchingtwo/BluetoothMonitorReceiver;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/BluetoothMonitorReceiver;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bluetoothMonitorReceiver:Lcom/lenzetech/isearchingtwo/BluetoothMonitorReceiver;

    .line 158
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 159
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 160
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bluetoothMonitorReceiver:Lcom/lenzetech/isearchingtwo/BluetoothMonitorReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public onDeviceSucceedWrite(Ljava/lang/String;)V
    .locals 4

    .line 607
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBtnShowText()Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0f0023

    .line 608
    invoke-virtual {p0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const v3, 0x7f0f0027

    if-eqz v2, :cond_0

    .line 609
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p0, v3}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBtnShowText(Ljava/lang/String;)V

    goto :goto_0

    .line 610
    :cond_0
    invoke-virtual {p0, v3}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 611
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBtnShowText(Ljava/lang/String;)V

    .line 613
    :cond_1
    :goto_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    return-void
.end method

.method public onEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V
    .locals 3

    .line 1215
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->getmDialogState()Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    move-result-object v0

    sget-object v1, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_DISMISS:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    const-string v2, "MyApplication"

    if-ne v0, v1, :cond_1

    const-string v0, "onEvent: DialogState.DIALOG_DISMISS"

    .line 1216
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1222
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->isDoubleClick()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1223
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog2:Landroid/app/Dialog;

    if-eqz p1, :cond_5

    .line 1224
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 1225
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog2:Landroid/app/Dialog;

    goto :goto_1

    .line 1228
    :cond_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog:Landroid/app/Dialog;

    if-eqz p1, :cond_5

    .line 1229
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 1230
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog:Landroid/app/Dialog;

    goto :goto_1

    .line 1233
    :cond_1
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->getmDialogState()Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    move-result-object v0

    sget-object v1, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_SHOW:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    if-ne v0, v1, :cond_5

    .line 1236
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->isDoubleClick()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1237
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog2:Landroid/app/Dialog;

    if-nez v0, :cond_2

    .line 1238
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->dialogbledoubleclick(Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog2:Landroid/app/Dialog;

    goto :goto_0

    :cond_2
    const-string p1, "onEvent: mDialog2\u4e0d\u505a\u5904\u7406"

    .line 1240
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1243
    :cond_3
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog:Landroid/app/Dialog;

    if-nez v0, :cond_4

    .line 1244
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->dialogbleconnect(Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mDialog:Landroid/app/Dialog;

    goto :goto_0

    :cond_4
    const-string p1, "onEvent: \u4e0d\u505a\u5904\u7406"

    .line 1246
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const-string p1, "onEvent: DialogState.DIALOG_SHOW "

    .line 1249
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    :goto_1
    return-void
.end method

.method public sendDialogEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V
    .locals 2

    .line 1202
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/lenzetech/isearchingtwo/application/MyApplication$6;

    invoke-direct {v1, p0, p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication$6;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public setBtnTextById(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 1

    .line 592
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aget-object p1, v0, p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->setBtnShowText(Ljava/lang/String;)V

    .line 594
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    return-void
.end method

.method public setEventCallbackZ(Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;)V
    .locals 0

    .line 1157
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mEventCallback:Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;

    return-void
.end method

.method public startDiscovery()V
    .locals 5

    .line 409
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->checkNOpenGps()Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->checkNOpenBl()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 413
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    const-string v1, "\u84dd\u7259"

    if-nez v0, :cond_1

    const-string v0, "\u84dd\u7259\u641c\u7d22\u5931\u8d25"

    .line 414
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    const-string v0, "\u5f00\u59cb\u641c\u7d22\u84dd\u7259"

    .line 417
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    .line 424
    :cond_2
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 426
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 v2, 0x0

    .line 428
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 429
    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isMine()Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_1

    .line 432
    :cond_3
    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 450
    :cond_4
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    .line 457
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_5

    return-void

    :cond_5
    const-string v0, "\u5f00\u59cb\u626b\u63cf"

    .line 460
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 463
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 464
    new-instance v1, Landroid/bluetooth/le/ScanFilter$Builder;

    invoke-direct {v1}, Landroid/bluetooth/le/ScanFilter$Builder;-><init>()V

    const-string v2, "0000ffe0-0000-1000-8000-00805f9b34fb"

    .line 465
    invoke-static {v2}, Landroid/os/ParcelUuid;->fromString(Ljava/lang/String;)Landroid/os/ParcelUuid;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/bluetooth/le/ScanFilter$Builder;->setServiceUuid(Landroid/os/ParcelUuid;)Landroid/bluetooth/le/ScanFilter$Builder;

    .line 466
    invoke-virtual {v1}, Landroid/bluetooth/le/ScanFilter$Builder;->build()Landroid/bluetooth/le/ScanFilter;

    move-result-object v1

    .line 467
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 470
    new-instance v0, Landroid/bluetooth/le/ScanSettings$Builder;

    invoke-direct {v0}, Landroid/bluetooth/le/ScanSettings$Builder;-><init>()V

    const/4 v2, 0x2

    .line 471
    invoke-virtual {v0, v2}, Landroid/bluetooth/le/ScanSettings$Builder;->setScanMode(I)Landroid/bluetooth/le/ScanSettings$Builder;

    .line 472
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    const/4 v4, 0x1

    if-lt v2, v3, :cond_6

    .line 473
    invoke-virtual {v0, v4}, Landroid/bluetooth/le/ScanSettings$Builder;->setMatchMode(I)Landroid/bluetooth/le/ScanSettings$Builder;

    .line 475
    :cond_6
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v3, :cond_7

    .line 476
    invoke-virtual {v0, v4}, Landroid/bluetooth/le/ScanSettings$Builder;->setCallbackType(I)Landroid/bluetooth/le/ScanSettings$Builder;

    .line 478
    :cond_7
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_8

    .line 479
    invoke-virtual {v0, v4}, Landroid/bluetooth/le/ScanSettings$Builder;->setLegacy(Z)Landroid/bluetooth/le/ScanSettings$Builder;

    .line 481
    :cond_8
    invoke-virtual {v0}, Landroid/bluetooth/le/ScanSettings$Builder;->build()Landroid/bluetooth/le/ScanSettings;

    move-result-object v0

    .line 484
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcom/lenzetech/isearchingtwo/application/MyApplication$3;

    invoke-direct {v3, p0, v1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication$3;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/bluetooth/le/ScanFilter;Landroid/bluetooth/le/ScanSettings;)V

    const-wide/16 v0, 0xc8

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const-string v0, "\u626b\u63cf"

    const-string v1, "\u626b\u63cf\u4e00\u6bb5\u65f6\u95f4\u540e\u505c\u6b62"

    .line 494
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/lenzetech/isearchingtwo/application/MyApplication$4;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/application/MyApplication$4;-><init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;)V

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_9
    :goto_2
    const-string v0, "MyApplication"

    const-string v1, "scan fail"

    .line 410
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
