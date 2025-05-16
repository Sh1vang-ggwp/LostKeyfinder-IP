.class public Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;
.super Landroid/os/ResultReceiver;
.source "GoogleMapFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AddressResultReceiver"
.end annotation


# instance fields
.field private mAddressOutput:Ljava/lang/String;

.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;


# direct methods
.method public constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;Landroid/os/Handler;)V
    .locals 0

    .line 465
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;->this$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    .line 466
    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 1

    const-string v0, "com.example.mylocationdemo.RESULT_DATA_KEY"

    .line 472
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;->mAddressOutput:Ljava/lang/String;

    if-nez p1, :cond_0

    .line 474
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "mAddressOutput-->"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$AddressResultReceiver;->mAddressOutput:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "MapsActivity"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method
