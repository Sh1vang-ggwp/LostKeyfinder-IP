.class public Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;
.super Landroid/app/Dialog;
.source "CustomDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    }
.end annotation


# instance fields
.field private cancelTouchout:Z

.field private context:Landroid/content/Context;

.field private height:I

.field private view:Landroid/view/View;

.field private width:I


# direct methods
.method public constructor <init>(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)V
    .locals 1

    .line 24
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$000(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 25
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$000(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->context:Landroid/content/Context;

    .line 26
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$100(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)I

    move-result v0

    iput v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->height:I

    .line 27
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$200(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)I

    move-result v0

    iput v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->width:I

    .line 28
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$300(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->cancelTouchout:Z

    .line 29
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$400(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->view:Landroid/view/View;

    return-void
.end method

.method private constructor <init>(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;I)V
    .locals 1

    .line 34
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$000(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 35
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$000(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->context:Landroid/content/Context;

    .line 36
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$100(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)I

    move-result p2

    iput p2, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->height:I

    .line 37
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$200(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)I

    move-result p2

    iput p2, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->width:I

    .line 38
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$300(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->cancelTouchout:Z

    .line 39
    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->access$400(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->view:Landroid/view/View;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;ILcom/lenzetech/isearchingtwo/Utils/CustomDialog$1;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;-><init>(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;I)V

    return-void
.end method


# virtual methods
.method public addViewOnclick(ILcom/lenzetech/isearchingtwo/application/MyApplication$DialogClick;)V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->view:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 44
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 46
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->view:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->setContentView(Landroid/view/View;)V

    .line 48
    iget-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->cancelTouchout:Z

    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->setCanceledOnTouchOutside(Z)V

    .line 50
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    .line 51
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/16 v1, 0x11

    .line 52
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 53
    iget v1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->height:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 54
    iget v1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;->width:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 55
    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method
