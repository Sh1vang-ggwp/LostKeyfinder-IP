.class Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog$1;
.super Ljava/lang/Object;
.source "PermissionUtils.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 142
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog$1;->this$0:Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;

    iput p2, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog$1;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 146
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog$1;->this$0:Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const-string p2, "android.permission.ACCESS_FINE_LOCATION"

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    iget v0, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog$1;->val$requestCode:I

    invoke-static {p1, p2, v0}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 150
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog$1;->this$0:Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->access$002(Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;Z)Z

    return-void
.end method
