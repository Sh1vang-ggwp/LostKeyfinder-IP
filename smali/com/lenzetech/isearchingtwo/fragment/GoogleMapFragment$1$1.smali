.class Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1$1;
.super Ljava/lang/Object;
.source "GoogleMapFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;)V
    .locals 0

    .line 373
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1$1;->this$1:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 376
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1$1;->this$1:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;

    iget-object v0, v0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->access$000(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;)Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1$1;->this$1:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;

    iget-object v1, v1, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;->val$sydney:Lcom/google/android/gms/maps/model/LatLng;

    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {v1, v2}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;)V

    return-void
.end method
