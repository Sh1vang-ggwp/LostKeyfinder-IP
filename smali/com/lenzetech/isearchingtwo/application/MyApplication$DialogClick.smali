.class public abstract Lcom/lenzetech/isearchingtwo/application/MyApplication$DialogClick;
.super Ljava/lang/Object;
.source "MyApplication.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/application/MyApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "DialogClick"
.end annotation


# instance fields
.field mDialogInterface:Landroid/content/DialogInterface;


# direct methods
.method public constructor <init>(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1326
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1327
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$DialogClick;->mDialogInterface:Landroid/content/DialogInterface;

    return-void
.end method
