.class Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;
.super Ljava/lang/Object;
.source "GoogleMapFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->initCamera(Lcom/google/android/gms/maps/model/LatLng;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

.field final synthetic val$sydney:Lcom/google/android/gms/maps/model/LatLng;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 365
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;->val$sydney:Lcom/google/android/gms/maps/model/LatLng;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-wide/16 v0, 0x320

    .line 369
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 371
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 373
    :goto_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1$1;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1$1;-><init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$1;)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
