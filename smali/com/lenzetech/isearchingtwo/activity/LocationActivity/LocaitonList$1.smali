.class Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$1;
.super Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;
.source "LocaitonList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;Landroid/content/Context;)V
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;

    invoke-direct {p0, p2}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onResult(Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;)V
    .locals 3

    .line 51
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->getObj()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/GeocoderHandler$GeoResult;->getResult()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->access$000(Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;Ljava/lang/String;)V

    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onResult: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "GeocoderHandler"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
