.class Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$2;
.super Ljava/lang/Object;
.source "GoogleMapFragment.java"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getGoogleLocation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnSuccessListener<",
        "Landroid/location/Location;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;)V
    .locals 0

    .line 492
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess(Landroid/location/Location;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 492
    check-cast p1, Landroid/location/Location;

    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$2;->onSuccess(Landroid/location/Location;)V

    return-void
.end method
