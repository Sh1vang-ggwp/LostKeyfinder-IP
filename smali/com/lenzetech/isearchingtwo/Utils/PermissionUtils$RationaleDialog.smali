.class public Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "PermissionUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RationaleDialog"
.end annotation


# static fields
.field private static final ARGUMENT_FINISH_ACTIVITY:Ljava/lang/String; = "finish"

.field private static final ARGUMENT_PERMISSION_REQUEST_CODE:Ljava/lang/String; = "requestCode"


# instance fields
.field private mFinishActivity:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 105
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    const/4 v0, 0x0

    .line 111
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->mFinishActivity:Z

    return-void
.end method

.method static synthetic access$002(Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;Z)Z
    .locals 0

    .line 105
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->mFinishActivity:Z

    return p1
.end method

.method public static newInstance(IZ)Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;
    .locals 2

    .line 126
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "requestCode"

    .line 127
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "finish"

    .line 128
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 129
    new-instance p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;

    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;-><init>()V

    .line 130
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 136
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "requestCode"

    .line 137
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "finish"

    .line 138
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->mFinishActivity:Z

    .line 140
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0f0063

    .line 141
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog$1;

    invoke-direct {v1, p0, v0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog$1;-><init>(Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;I)V

    const v0, 0x104000a

    .line 142
    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 153
    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 154
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 159
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 160
    iget-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->mFinishActivity:Z

    if-eqz p1, :cond_0

    .line 161
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Utils/PermissionUtils$RationaleDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :cond_0
    return-void
.end method
