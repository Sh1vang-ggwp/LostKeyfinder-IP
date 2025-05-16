.class public Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;
.super Ljava/lang/Object;
.source "ProgressDialogUtil.java"


# static fields
.field private static mAlertDialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dismiss()V
    .locals 1

    .line 62
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public static showProgressDialog(Landroid/content/Context;)V
    .locals 8

    .line 25
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const v1, 0x7f1000cc

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    .line 29
    :cond_0
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const v0, 0x7f0b0054

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    .line 30
    sget-object v2, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p0

    invoke-virtual/range {v2 .. v7}, Landroid/app/AlertDialog;->setView(Landroid/view/View;IIII)V

    .line 31
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    const v0, 0x7f08016c

    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    const-string v0, "\u52a0\u8f7d\u4e2d..."

    .line 34
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    sget-object p0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method public static showProgressDialog(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8

    .line 40
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "\u52a0\u8f7d\u4e2d..."

    .line 44
    :cond_0
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    if-nez v0, :cond_1

    .line 45
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const v1, 0x7f1000cc

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    .line 48
    :cond_1
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const v0, 0x7f0b0054

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    .line 49
    sget-object v2, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p0

    invoke-virtual/range {v2 .. v7}, Landroid/app/AlertDialog;->setView(Landroid/view/View;IIII)V

    .line 50
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    const v0, 0x7f08016c

    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    .line 53
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    sget-object p0, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
