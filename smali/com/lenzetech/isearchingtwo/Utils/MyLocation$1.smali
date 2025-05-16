.class Lcom/lenzetech/isearchingtwo/Utils/MyLocation$1;
.super Lcom/google/android/gms/location/LocationCallback;
.source "MyLocation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->getLocation()V
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

    .line 108
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation$1;->this$0:Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    invoke-direct {p0}, Lcom/google/android/gms/location/LocationCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onLocationResult(Lcom/google/android/gms/location/LocationResult;)V
    .locals 1

    .line 111
    invoke-super {p0, p1}, Lcom/google/android/gms/location/LocationCallback;->onLocationResult(Lcom/google/android/gms/location/LocationResult;)V

    .line 112
    invoke-virtual {p1}, Lcom/google/android/gms/location/LocationResult;->getLastLocation()Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyLocation$1;->this$0:Lcom/lenzetech/isearchingtwo/Utils/MyLocation;

    invoke-virtual {p1}, Lcom/google/android/gms/location/LocationResult;->getLastLocation()Landroid/location/Location;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/lenzetech/isearchingtwo/Utils/MyLocation;->access$000(Lcom/lenzetech/isearchingtwo/Utils/MyLocation;Landroid/location/Location;)V

    :cond_0
    return-void
.end method
