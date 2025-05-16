.class public Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "PermissionUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PermissionDeniedDialog"
.end annotation


# static fields
.field private static final ARGUMENT_FINISH_ACTIVITY:Ljava/lang/String; = "finish"


# instance fields
.field private mFinishActivity:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 57
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    const/4 v0, 0x0

    .line 61
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->mFinishActivity:Z

    return-void
.end method

.method public static newInstance(Z)Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;
    .locals 2

    .line 68
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "finish"

    .line 69
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 71
    new-instance p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;

    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;-><init>()V

    .line 72
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 78
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "finish"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->mFinishActivity:Z

    .line 80
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f0f0058

    .line 81
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x104000a

    const/4 v1, 0x0

    .line 82
    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 83
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 88
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 89
    iget-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->mFinishActivity:Z

    if-eqz p1, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f0f0064

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 91
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 92
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$PermissionDeniedDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :cond_0
    return-void
.end method
