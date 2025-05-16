.class public final synthetic Lcom/lenzetech/isearchingtwo/activity/MainActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

.field public final synthetic f$1:Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;


# direct methods
.method public synthetic constructor <init>(Lcom/lenzetech/isearchingtwo/activity/MainActivity;Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$$ExternalSyntheticLambda0;->f$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$$ExternalSyntheticLambda0;->f$1:Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$$ExternalSyntheticLambda0;->f$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$$ExternalSyntheticLambda0;->f$1:Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;

    invoke-virtual {v0, v1, p1, p2}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->lambda$showAlertDialog$0$com-lenzetech-isearchingtwo-activity-MainActivity(Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;Landroid/content/DialogInterface;I)V

    return-void
.end method
