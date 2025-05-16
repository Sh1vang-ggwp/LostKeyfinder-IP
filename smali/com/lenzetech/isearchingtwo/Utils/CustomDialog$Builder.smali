.class public final Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
.super Ljava/lang/Object;
.source "CustomDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private cancelTouchout:Z

.field private context:Landroid/content/Context;

.field private height:I

.field private resStyle:I

.field private view:Landroid/view/View;

.field private width:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 68
    iput v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->resStyle:I

    .line 72
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Landroid/content/Context;
    .locals 0

    .line 62
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->context:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)I
    .locals 0

    .line 62
    iget p0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->height:I

    return p0
.end method

.method static synthetic access$200(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)I
    .locals 0

    .line 62
    iget p0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->width:I

    return p0
.end method

.method static synthetic access$300(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Z
    .locals 0

    .line 62
    iget-boolean p0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->cancelTouchout:Z

    return p0
.end method

.method static synthetic access$400(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)Landroid/view/View;
    .locals 0

    .line 62
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->view:Landroid/view/View;

    return-object p0
.end method


# virtual methods
.method public addViewOnclick(ILandroid/view/View$OnClickListener;)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->view:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p0
.end method

.method public build()Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;
    .locals 3

    .line 127
    iget v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->resStyle:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 128
    new-instance v0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;

    iget v1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->resStyle:I

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;-><init>(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;ILcom/lenzetech/isearchingtwo/Utils/CustomDialog$1;)V

    return-object v0

    .line 130
    :cond_0
    new-instance v0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog;-><init>(Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;)V

    return-object v0
.end method

.method public cancelTouchout(Z)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 0

    .line 116
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->cancelTouchout:Z

    return-object p0
.end method

.method public heightDimenRes(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->height:I

    return-object p0
.end method

.method public heightdp(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->context:Landroid/content/Context;

    int-to-float p1, p1

    invoke-static {v0, p1}, Lcom/lenzetech/isearchingtwo/Utils/Utils;->dp2px(Landroid/content/Context;F)I

    move-result p1

    iput p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->height:I

    return-object p0
.end method

.method public heightpx(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 0

    .line 81
    iput p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->height:I

    return-object p0
.end method

.method public style(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 0

    .line 111
    iput p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->resStyle:I

    return-object p0
.end method

.method public view(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 2

    .line 76
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->view:Landroid/view/View;

    return-object p0
.end method

.method public widthDimenRes(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->width:I

    return-object p0
.end method

.method public widthdp(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->context:Landroid/content/Context;

    int-to-float p1, p1

    invoke-static {v0, p1}, Lcom/lenzetech/isearchingtwo/Utils/Utils;->dp2px(Landroid/content/Context;F)I

    move-result p1

    iput p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->width:I

    return-object p0
.end method

.method public widthpx(I)Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;
    .locals 0

    .line 86
    iput p1, p0, Lcom/lenzetech/isearchingtwo/Utils/CustomDialog$Builder;->width:I

    return-object p0
.end method
