.class public Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;
.super Landroidx/fragment/app/Fragment;
.source "PdfFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/lenzetech/isearchingtwo/fragment/FragmentChangedCallback;


# static fields
.field private static final TAG:Ljava/lang/String; = "SettingFragment"

.field private static settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;


# instance fields
.field private mContentView:Landroid/view/View;

.field recBtn:Landroid/widget/Button;

.field recording_switch:Landroid/widget/Switch;

.field timeSwith:Landroid/widget/Switch;

.field timeText:Landroid/widget/TextView;

.field wifiSwith:Landroid/widget/Switch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;
    .locals 1

    .line 68
    sget-object v0, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    if-nez v0, :cond_0

    .line 70
    new-instance v0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;-><init>()V

    sput-object v0, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    .line 73
    :cond_0
    sget-object v0, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    return-object v0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 109
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 82
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0800f6

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 86
    :cond_0
    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 87
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;->startActivity(Landroid/content/Intent;)V

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 25
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b003e

    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;->mContentView:Landroid/view/View;

    const p2, 0x7f0800ec

    .line 35
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/github/barteksc/pdfviewer/PDFView;

    .line 39
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;->mContentView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const p3, 0x7f0f003d

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    const-string p3, "\u8bbe\u5907"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 p3, 0x1

    const-string v0, "PDF"

    if-eqz p2, :cond_0

    const-string p2, "\u4e2d\u6587PDF"

    .line 41
    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string p2, "userguidch.pdf"

    .line 43
    invoke-virtual {p1, p2}, Lcom/github/barteksc/pdfviewer/PDFView;->fromAsset(Ljava/lang/String;)Lcom/github/barteksc/pdfviewer/PDFView$Configurator;

    move-result-object p1

    .line 44
    invoke-virtual {p1, p3}, Lcom/github/barteksc/pdfviewer/PDFView$Configurator;->defaultPage(I)Lcom/github/barteksc/pdfviewer/PDFView$Configurator;

    move-result-object p1

    .line 45
    invoke-virtual {p1}, Lcom/github/barteksc/pdfviewer/PDFView$Configurator;->load()V

    goto :goto_0

    :cond_0
    const-string p2, "\u82f1\u6587PDF"

    .line 49
    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string p2, "userguiden.pdf"

    .line 51
    invoke-virtual {p1, p2}, Lcom/github/barteksc/pdfviewer/PDFView;->fromAsset(Ljava/lang/String;)Lcom/github/barteksc/pdfviewer/PDFView$Configurator;

    move-result-object p1

    .line 52
    invoke-virtual {p1, p3}, Lcom/github/barteksc/pdfviewer/PDFView$Configurator;->defaultPage(I)Lcom/github/barteksc/pdfviewer/PDFView$Configurator;

    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/github/barteksc/pdfviewer/PDFView$Configurator;->load()V

    .line 61
    :goto_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/PdfFragment;->mContentView:Landroid/view/View;

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    .line 132
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    const-string v0, "SettingFragment"

    const-string v1, "onDestroy: onDestroy"

    .line 133
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onHideFc()V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 126
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    const-string v0, "SettingFragment"

    const-string v1, "onPause: onPause"

    .line 127
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 120
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    const-string v0, "SettingFragment"

    const-string v1, "onResume: onResume"

    .line 121
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onStart()V
    .locals 0

    .line 95
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    return-void
.end method
