.class Lcom/lenzetech/isearchingtwo/application/MyApplication$5$1;
.super Ljava/lang/Object;
.source "MyApplication.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/application/MyApplication$5;->onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/lenzetech/isearchingtwo/application/MyApplication$5;

.field final synthetic val$verifyDevice:Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/application/MyApplication$5;Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 990
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5$1;->this$1:Lcom/lenzetech/isearchingtwo/application/MyApplication$5;

    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5$1;->val$verifyDevice:Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 0

    .line 993
    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    const-string p1, "onFailure"

    const-string p2, "fail"

    .line 994
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1000
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p1

    const-string p2, "onResponse"

    .line 1001
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1002
    new-instance p2, Lcom/google/gson/Gson;

    invoke-direct {p2}, Lcom/google/gson/Gson;-><init>()V

    .line 1005
    :try_start_0
    new-instance v0, Lcom/google/gson/JsonParser;

    invoke-direct {v0}, Lcom/google/gson/JsonParser;-><init>()V

    invoke-virtual {v0, p1}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    .line 1006
    const-class v0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;

    invoke-virtual {p2, p1, v0}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;

    const-string p2, "responseBean == "

    .line 1007
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->getVerify()Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1008
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->getVerify()Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_0

    .line 1009
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object p2

    new-instance v0, Lcom/lenzetech/isearchingtwo/application/MessageEvent;

    sget-object v1, Lcom/lenzetech/isearchingtwo/application/EventType;->DEVICE_VERIFY:Lcom/lenzetech/isearchingtwo/application/EventType;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$5$1;->val$verifyDevice:Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Bean/VerifyDevice;->getDeviceMac()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, p1, v3}, Lcom/lenzetech/isearchingtwo/application/MessageEvent;-><init>(Lcom/lenzetech/isearchingtwo/application/EventType;[BLcom/lenzetech/isearchingtwo/Bean/ResponseBean;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "JsonSyntaxException"

    const-string p2, "\u89e3\u6790\u9519\u8bef"

    .line 1012
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void
.end method
