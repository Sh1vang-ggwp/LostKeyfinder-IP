.class Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$1;
.super Ljava/lang/Object;
.source "GeocoderHandler.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$1;->this$0:Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 5

    .line 45
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;

    .line 46
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$1;->this$0:Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->access$100(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;)D

    move-result-wide v1

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->access$200(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;)D

    move-result-wide v3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->access$300(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;DD)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->access$002(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;Ljava/lang/String;)Ljava/lang/String;

    .line 48
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$1;->this$0:Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;

    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;->onResult(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;)V

    const/4 p1, 0x0

    return p1
.end method
