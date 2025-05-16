.class public final synthetic Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$$ExternalSyntheticLambda0;->f$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment$$ExternalSyntheticLambda0;->f$0:Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;

    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/fragment/GoogleMapFragment;->lambda$enableMyLocation$0$com-lenzetech-isearchingtwo-fragment-GoogleMapFragment(Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
