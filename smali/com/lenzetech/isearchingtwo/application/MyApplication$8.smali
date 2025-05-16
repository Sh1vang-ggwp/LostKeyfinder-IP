.class Lcom/lenzetech/isearchingtwo/application/MyApplication$8;
.super Lcom/lenzetech/isearchingtwo/application/MyApplication$DialogClick;
.source "MyApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/application/MyApplication;->dialogbledoubleclick(Ljava/lang/String;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1348
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$8;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-direct {p0, p2}, Lcom/lenzetech/isearchingtwo/application/MyApplication$DialogClick;-><init>(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1352
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f080079

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 1355
    :cond_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$8;->mDialogInterface:Landroid/content/DialogInterface;

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1356
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$8;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$702(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 1357
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->Pause()V

    :goto_0
    return-void
.end method
