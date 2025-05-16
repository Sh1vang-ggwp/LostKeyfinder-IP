.class Lcom/lenzetech/isearchingtwo/Utils/MyLocation$2;
.super Ljava/lang/Object;
.source "MyLocation.java"

# interfaces
.implements Landroid/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/Utils/MyLocation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/Utils/MyLocation;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/Utils/MyLocation;)V
    .locals 0

    .line 125
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation$2;->this$0:Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation$2;->this$0:Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    invoke-static {v0, p1}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->access$000(Lcom/lenzetech/isearchingtwo/Utils/MyLocation;Landroid/location/Location;)V

    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    return-void
.end method
