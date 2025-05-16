.class public Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;
.super Landroid/widget/ArrayAdapter;
.source "RecordAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Lcom/lenzetech/isearchingtwo/Bean/RecItem;",
        ">;"
    }
.end annotation


# instance fields
.field private dataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/RecItem;",
            ">;"
        }
    .end annotation
.end field

.field private mListener:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;

.field mTextView:Landroid/widget/TextView;

.field private resourceId:I

.field swipeMenuLayout:Lcom/mcxtzhang/swipemenulib/SwipeMenuLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/RecItem;",
            ">;)V"
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 28
    iput p2, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->resourceId:I

    .line 29
    iput-object p3, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->dataList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->mListener:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)Ljava/util/List;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->dataList:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    .line 37
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/lenzetech/isearchingtwo/Bean/RecItem;

    .line 38
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->resourceId:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p3

    if-eqz p2, :cond_2

    const v0, 0x7f08010a

    .line 41
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f08014e

    .line 42
    invoke-virtual {p3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 44
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->getFileIte()Ljava/io/File;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->getFileIte()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    const-string v3, "1111"

    .line 47
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    :goto_0
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->isPlay()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 52
    invoke-virtual {p3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f050020

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {v1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_1

    .line 54
    :cond_1
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    invoke-virtual {p3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0700ca

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 58
    :goto_1
    new-instance p2, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$1;

    invoke-direct {p2, p0}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$1;-><init>(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)V

    invoke-virtual {v1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const p2, 0x7f080055

    .line 68
    invoke-virtual {p3, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 69
    new-instance v0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$2;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$2;-><init>(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :cond_2
    return-object p3
.end method

.method public setAllUnplay()V
    .locals 3

    .line 113
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->dataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/Bean/RecItem;

    const/4 v2, 0x0

    .line 114
    invoke-virtual {v1, v2}, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->setIsPlay(Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setListener(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;)V
    .locals 0

    .line 119
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->mListener:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;

    return-void
.end method

.method public setPlay(I)V
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->dataList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/RecItem;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->setIsPlay(Z)V

    return-void
.end method
