.class public Lcom/jzxiang/pickerview/wheel/WheelView;
.super Landroid/view/View;
.source "WheelView.java"


# static fields
.field private static final DEF_VISIBLE_ITEMS:I = 0x5

.field private static final ITEM_OFFSET_PERCENT:I = 0xa

.field private static final PADDING:I = 0xa


# instance fields
.field private changingListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field private clickingListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/jzxiang/pickerview/wheel/OnWheelClickedListener;",
            ">;"
        }
    .end annotation
.end field

.field private currentItem:I

.field private dataObserver:Landroid/database/DataSetObserver;

.field defaultColor:I

.field private firstItem:I

.field isCyclic:Z

.field private isScrollingPerformed:Z

.field private itemHeight:I

.field private itemsLayout:Landroid/widget/LinearLayout;

.field private mLineRightMar:I

.field private mPaintLineCenter:Landroid/graphics/Paint;

.field private mPaintLineRight:Landroid/graphics/Paint;

.field private mPaintRectCenter:Landroid/graphics/Paint;

.field private recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

.field private scroller:Lcom/jzxiang/pickerview/wheel/WheelScroller;

.field scrollingListener:Lcom/jzxiang/pickerview/wheel/WheelScroller$ScrollingListener;

.field private scrollingListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/jzxiang/pickerview/wheel/OnWheelScrollListener;",
            ">;"
        }
    .end annotation
.end field

.field private scrollingOffset:I

.field selectorColor:I

.field private viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

.field private visibleItems:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 161
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 65
    iput-boolean v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isCyclic:Z

    .line 68
    iput v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    const/4 v1, 0x5

    .line 70
    iput v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->visibleItems:I

    .line 72
    iput v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemHeight:I

    .line 85
    new-instance v0, Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    invoke-direct {v0, p0}, Lcom/jzxiang/pickerview/wheel/WheelRecycle;-><init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    .line 89
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->changingListeners:Ljava/util/List;

    .line 90
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListeners:Ljava/util/List;

    .line 92
    new-instance v0, Lcom/jzxiang/pickerview/wheel/WheelView$1;

    invoke-direct {v0, p0}, Lcom/jzxiang/pickerview/wheel/WheelView$1;-><init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListener:Lcom/jzxiang/pickerview/wheel/WheelScroller$ScrollingListener;

    .line 127
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->clickingListeners:Ljava/util/List;

    .line 129
    new-instance v0, Lcom/jzxiang/pickerview/wheel/WheelView$2;

    invoke-direct {v0, p0}, Lcom/jzxiang/pickerview/wheel/WheelView$2;-><init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    .line 162
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->initData(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 153
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 65
    iput-boolean p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isCyclic:Z

    .line 68
    iput p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    const/4 v0, 0x5

    .line 70
    iput v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->visibleItems:I

    .line 72
    iput p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemHeight:I

    .line 85
    new-instance p2, Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    invoke-direct {p2, p0}, Lcom/jzxiang/pickerview/wheel/WheelRecycle;-><init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    .line 89
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->changingListeners:Ljava/util/List;

    .line 90
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListeners:Ljava/util/List;

    .line 92
    new-instance p2, Lcom/jzxiang/pickerview/wheel/WheelView$1;

    invoke-direct {p2, p0}, Lcom/jzxiang/pickerview/wheel/WheelView$1;-><init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListener:Lcom/jzxiang/pickerview/wheel/WheelScroller$ScrollingListener;

    .line 127
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->clickingListeners:Ljava/util/List;

    .line 129
    new-instance p2, Lcom/jzxiang/pickerview/wheel/WheelView$2;

    invoke-direct {p2, p0}, Lcom/jzxiang/pickerview/wheel/WheelView$2;-><init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    .line 154
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->initData(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 145
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 65
    iput-boolean p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isCyclic:Z

    .line 68
    iput p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    const/4 p3, 0x5

    .line 70
    iput p3, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->visibleItems:I

    .line 72
    iput p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemHeight:I

    .line 85
    new-instance p2, Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    invoke-direct {p2, p0}, Lcom/jzxiang/pickerview/wheel/WheelRecycle;-><init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    .line 89
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->changingListeners:Ljava/util/List;

    .line 90
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListeners:Ljava/util/List;

    .line 92
    new-instance p2, Lcom/jzxiang/pickerview/wheel/WheelView$1;

    invoke-direct {p2, p0}, Lcom/jzxiang/pickerview/wheel/WheelView$1;-><init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListener:Lcom/jzxiang/pickerview/wheel/WheelScroller$ScrollingListener;

    .line 127
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->clickingListeners:Ljava/util/List;

    .line 129
    new-instance p2, Lcom/jzxiang/pickerview/wheel/WheelView$2;

    invoke-direct {p2, p0}, Lcom/jzxiang/pickerview/wheel/WheelView$2;-><init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    iput-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    .line 146
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->initData(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/jzxiang/pickerview/wheel/WheelView;)Z
    .locals 0

    .line 48
    iget-boolean p0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isScrollingPerformed:Z

    return p0
.end method

.method static synthetic access$002(Lcom/jzxiang/pickerview/wheel/WheelView;Z)Z
    .locals 0

    .line 48
    iput-boolean p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isScrollingPerformed:Z

    return p1
.end method

.method static synthetic access$100(Lcom/jzxiang/pickerview/wheel/WheelView;I)V
    .locals 0

    .line 48
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->doScroll(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/jzxiang/pickerview/wheel/WheelView;)I
    .locals 0

    .line 48
    iget p0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    return p0
.end method

.method static synthetic access$202(Lcom/jzxiang/pickerview/wheel/WheelView;I)I
    .locals 0

    .line 48
    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    return p1
.end method

.method static synthetic access$300(Lcom/jzxiang/pickerview/wheel/WheelView;)Lcom/jzxiang/pickerview/wheel/WheelScroller;
    .locals 0

    .line 48
    iget-object p0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scroller:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    return-object p0
.end method

.method private addViewItem(IZ)Z
    .locals 1

    .line 872
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemView(I)Landroid/view/View;

    move-result-object v0

    .line 873
    invoke-virtual {p0, v0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->refreshTextStatus(Landroid/view/View;I)V

    const/4 p1, 0x0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    .line 876
    iget-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    goto :goto_0

    .line 878
    :cond_0
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :goto_0
    const/4 p1, 0x1

    :cond_1
    return p1
.end method

.method private buildViewForMeasuring()V
    .locals 5

    .line 849
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 850
    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    iget v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    new-instance v3, Lcom/jzxiang/pickerview/wheel/ItemsRange;

    invoke-direct {v3}, Lcom/jzxiang/pickerview/wheel/ItemsRange;-><init>()V

    iget v4, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/jzxiang/pickerview/wheel/WheelRecycle;->recycleItems(Landroid/widget/LinearLayout;ILcom/jzxiang/pickerview/wheel/ItemsRange;I)I

    goto :goto_0

    .line 852
    :cond_0
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->createItemsLayout()V

    .line 856
    :goto_0
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->visibleItems:I

    div-int/lit8 v0, v0, 0x2

    .line 857
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    add-int/2addr v1, v0

    :goto_1
    iget v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    sub-int/2addr v2, v0

    if-lt v1, v2, :cond_2

    const/4 v2, 0x1

    .line 858
    invoke-direct {p0, v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->addViewItem(IZ)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 859
    iput v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method private calculateLayoutWidth(II)I
    .locals 4

    .line 528
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->initResourcesIfNecessary()V

    .line 531
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 532
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 533
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 532
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->measure(II)V

    .line 534
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v0

    const/high16 v2, 0x40000000    # 2.0f

    if-ne p2, v2, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v0, 0x14

    .line 542
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getSuggestedMinimumWidth()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/high16 v3, -0x80000000

    if-ne p2, v3, :cond_1

    if-ge p1, v0, :cond_1

    goto :goto_0

    :cond_1
    move p1, v0

    .line 549
    :goto_0
    iget-object p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    add-int/lit8 v0, p1, -0x14

    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 550
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 549
    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->measure(II)V

    return p1
.end method

.method private createItemsLayout()V
    .locals 2

    .line 838
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    .line 839
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    .line 840
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    :cond_0
    return-void
.end method

.method private doScroll(I)V
    .locals 7

    .line 682
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    .line 684
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result p1

    .line 685
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    div-int/2addr v0, p1

    .line 687
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    sub-int/2addr v1, v0

    .line 688
    iget-object v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    invoke-interface {v2}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getItemsCount()I

    move-result v2

    .line 690
    iget v3, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    rem-int/2addr v3, p1

    .line 691
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v4

    div-int/lit8 v5, p1, 0x2

    const/4 v6, 0x0

    if-gt v4, v5, :cond_0

    const/4 v3, 0x0

    .line 694
    :cond_0
    iget-boolean v4, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isCyclic:Z

    if-eqz v4, :cond_4

    if-lez v2, :cond_4

    if-lez v3, :cond_1

    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    if-gez v3, :cond_2

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, -0x1

    :cond_2
    :goto_0
    if-gez v1, :cond_3

    add-int/2addr v1, v2

    goto :goto_0

    .line 706
    :cond_3
    rem-int/2addr v1, v2

    goto :goto_1

    :cond_4
    if-gez v1, :cond_5

    .line 710
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    const/4 v1, 0x0

    goto :goto_1

    :cond_5
    if-lt v1, v2, :cond_6

    .line 713
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    sub-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v2, -0x1

    goto :goto_1

    :cond_6
    if-lez v1, :cond_7

    if-lez v3, :cond_7

    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_7
    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_8

    if-gez v3, :cond_8

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, -0x1

    .line 724
    :cond_8
    :goto_1
    iget v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    .line 725
    iget v3, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    if-eq v1, v3, :cond_9

    .line 726
    invoke-virtual {p0, v1, v6}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(IZ)V

    goto :goto_2

    .line 728
    :cond_9
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->invalidate()V

    :goto_2
    mul-int v0, v0, p1

    sub-int/2addr v2, v0

    .line 732
    iput v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    .line 733
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result p1

    if-le v2, p1, :cond_a

    .line 734
    iget p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result v0

    rem-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result v0

    add-int/2addr p1, v0

    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    :cond_a
    return-void
.end method

.method private drawCenterRect(Landroid/graphics/Canvas;)V
    .locals 13

    .line 630
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 631
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-double v1, v1

    const-wide v3, 0x3ff3333333333333L    # 1.2

    mul-double v1, v1, v3

    double-to-int v1, v1

    sub-int v2, v0, v1

    int-to-float v2, v2

    .line 634
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getWidth()I

    move-result v3

    int-to-float v6, v3

    add-int/2addr v0, v1

    int-to-float v11, v0

    iget-object v8, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintRectCenter:Landroid/graphics/Paint;

    const/4 v4, 0x0

    move-object v3, p1

    move v5, v2

    move v7, v11

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 636
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getWidth()I

    move-result v0

    int-to-float v6, v0

    iget-object v8, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineCenter:Landroid/graphics/Paint;

    move v7, v2

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 637
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getWidth()I

    move-result v0

    int-to-float v10, v0

    iget-object v12, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineCenter:Landroid/graphics/Paint;

    const/4 v8, 0x0

    move-object v7, p1

    move v9, v11

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 639
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getWidth()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    int-to-float v4, v0

    .line 640
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mLineRightMar:I

    int-to-float v3, v0

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mLineRightMar:I

    sub-int/2addr v0, v1

    int-to-float v5, v0

    iget-object v6, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineRight:Landroid/graphics/Paint;

    move-object v1, p1

    move v2, v4

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawItems(Landroid/graphics/Canvas;)V
    .locals 3

    .line 614
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 616
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    sub-int/2addr v0, v1

    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v1

    mul-int v0, v0, v1

    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v1

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    neg-int v0, v0

    .line 617
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 619
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->draw(Landroid/graphics/Canvas;)V

    .line 621
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private getDesiredHeight(Landroid/widget/LinearLayout;)I
    .locals 2

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 493
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 494
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemHeight:I

    .line 497
    :cond_0
    iget p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemHeight:I

    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->visibleItems:I

    mul-int v0, v0, p1

    mul-int/lit8 p1, p1, 0xa

    div-int/lit8 p1, p1, 0x32

    sub-int/2addr v0, p1

    .line 499
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getSuggestedMinimumHeight()I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    return p1
.end method

.method private getItemHeight()I
    .locals 2

    .line 508
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemHeight:I

    if-eqz v0, :cond_0

    return v0

    .line 512
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 513
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemHeight:I

    return v0

    .line 517
    :cond_1
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->visibleItems:I

    div-int/2addr v0, v1

    return v0
.end method

.method private getItemView(I)Landroid/view/View;
    .locals 3

    .line 916
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getItemsCount()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 919
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    invoke-interface {v0}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getItemsCount()I

    move-result v0

    .line 920
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->isValidItemIndex(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 921
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelRecycle;->getEmptyItem()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-interface {p1, v0, v1}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getEmptyItem(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    if-gez p1, :cond_2

    add-int/2addr p1, v0

    goto :goto_0

    .line 928
    :cond_2
    rem-int/2addr p1, v0

    .line 930
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/wheel/WheelRecycle;->getItem()Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-interface {v0, p1, v1, v2}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getItem(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_3
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getItemsRange()Lcom/jzxiang/pickerview/wheel/ItemsRange;
    .locals 5

    .line 755
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 759
    :cond_0
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    const/4 v1, 0x1

    .line 762
    :goto_0
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v2

    mul-int v2, v2, v1

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result v3

    if-ge v2, v3, :cond_1

    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 767
    :cond_1
    iget v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    if-eqz v2, :cond_3

    if-lez v2, :cond_2

    add-int/lit8 v0, v0, -0x1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 774
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v3

    div-int/2addr v2, v3

    sub-int/2addr v0, v2

    int-to-double v3, v1

    int-to-double v1, v2

    .line 776
    invoke-static {v1, v2}, Ljava/lang/Math;->asin(D)D

    move-result-wide v1

    add-double/2addr v3, v1

    double-to-int v1, v3

    .line 778
    :cond_3
    new-instance v2, Lcom/jzxiang/pickerview/wheel/ItemsRange;

    invoke-direct {v2, v0, v1}, Lcom/jzxiang/pickerview/wheel/ItemsRange;-><init>(II)V

    return-object v2
.end method

.method private initData(Landroid/content/Context;)V
    .locals 5

    .line 171
    new-instance v0, Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListener:Lcom/jzxiang/pickerview/wheel/WheelScroller$ScrollingListener;

    invoke-direct {v0, v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelScroller;-><init>(Landroid/content/Context;Lcom/jzxiang/pickerview/wheel/WheelScroller$ScrollingListener;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scroller:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    .line 173
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineCenter:Landroid/graphics/Paint;

    const v1, -0x19ffee

    .line 174
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 175
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineCenter:Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 176
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineCenter:Landroid/graphics/Paint;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 177
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineCenter:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 179
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineRight:Landroid/graphics/Paint;

    const v4, -0x171718

    .line 180
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 181
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineRight:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 183
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineRight:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 184
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineRight:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 186
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintRectCenter:Landroid/graphics/Paint;

    .line 187
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 188
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintRectCenter:Landroid/graphics/Paint;

    const/16 v1, 0x19

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 189
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintRectCenter:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 190
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintRectCenter:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 192
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/jzxiang/pickerview/R$dimen;->picker_line_mar:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mLineRightMar:I

    const p1, -0x666667

    .line 195
    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->defaultColor:I

    const p1, -0xbfbfc0

    .line 196
    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->selectorColor:I

    return-void
.end method

.method private initResourcesIfNecessary()V
    .locals 1

    const v0, 0x106000b

    .line 483
    invoke-virtual {p0, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->setBackgroundResource(I)V

    return-void
.end method

.method private isValidItemIndex(I)Z
    .locals 1

    .line 905
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getItemsCount()I

    move-result v0

    if-lez v0, :cond_1

    iget-boolean v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isCyclic:Z

    if-nez v0, :cond_0

    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    .line 906
    invoke-interface {v0}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getItemsCount()I

    move-result v0

    if-ge p1, v0, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private layout(II)V
    .locals 2

    add-int/lit8 p1, p1, -0x14

    .line 594
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/widget/LinearLayout;->layout(IIII)V

    return-void
.end method

.method private rebuildItems()Z
    .locals 7

    .line 788
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemsRange()Lcom/jzxiang/pickerview/wheel/ItemsRange;

    move-result-object v0

    .line 789
    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    .line 790
    iget-object v4, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    iget v5, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    iget v6, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    invoke-virtual {v4, v1, v5, v0, v6}, Lcom/jzxiang/pickerview/wheel/WheelRecycle;->recycleItems(Landroid/widget/LinearLayout;ILcom/jzxiang/pickerview/wheel/ItemsRange;I)I

    move-result v1

    .line 791
    iget v4, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    if-eq v4, v1, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 792
    :goto_0
    iput v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    goto :goto_1

    .line 794
    :cond_1
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->createItemsLayout()V

    const/4 v4, 0x1

    :goto_1
    if-nez v4, :cond_4

    .line 799
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getFirst()I

    move-result v4

    if-ne v1, v4, :cond_3

    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getCount()I

    move-result v4

    if-eq v1, v4, :cond_2

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v4, 0x1

    .line 802
    :cond_4
    :goto_3
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getFirst()I

    move-result v5

    if-le v1, v5, :cond_6

    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getLast()I

    move-result v5

    if-gt v1, v5, :cond_6

    .line 803
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    sub-int/2addr v1, v3

    :goto_4
    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getFirst()I

    move-result v5

    if-lt v1, v5, :cond_7

    .line 804
    invoke-direct {p0, v1, v3}, Lcom/jzxiang/pickerview/wheel/WheelView;->addViewItem(IZ)Z

    move-result v5

    if-nez v5, :cond_5

    goto :goto_5

    .line 807
    :cond_5
    iput v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    add-int/lit8 v1, v1, -0x1

    goto :goto_4

    .line 810
    :cond_6
    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getFirst()I

    move-result v1

    iput v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    .line 813
    :cond_7
    :goto_5
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    .line 814
    iget-object v3, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    :goto_6
    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getCount()I

    move-result v5

    if-ge v3, v5, :cond_9

    .line 815
    iget v5, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    add-int/2addr v5, v3

    invoke-direct {p0, v5, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->addViewItem(IZ)Z

    move-result v5

    if-nez v5, :cond_8

    iget-object v5, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    if-nez v5, :cond_8

    add-int/lit8 v1, v1, 0x1

    :cond_8
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 819
    :cond_9
    iput v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    return v4
.end method

.method private updateView()V
    .locals 2

    .line 828
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->rebuildItems()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 829
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getWidth()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-direct {p0, v0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->calculateLayoutWidth(II)I

    .line 830
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->layout(II)V

    :cond_0
    return-void
.end method


# virtual methods
.method public addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V
    .locals 1

    .line 274
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->changingListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addClickingListener(Lcom/jzxiang/pickerview/wheel/OnWheelClickedListener;)V
    .locals 1

    .line 352
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->clickingListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addScrollingListener(Lcom/jzxiang/pickerview/wheel/OnWheelScrollListener;)V
    .locals 1

    .line 314
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getCurrentItem()I
    .locals 1

    .line 379
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    return v0
.end method

.method public getViewAdapter()Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;
    .locals 1

    .line 246
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    return-object v0
.end method

.method public getVisibleItems()I
    .locals 1

    .line 226
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->visibleItems:I

    return v0
.end method

.method public invalidateWheel(Z)V
    .locals 4

    if-eqz p1, :cond_1

    .line 466
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    invoke-virtual {p1}, Lcom/jzxiang/pickerview/wheel/WheelRecycle;->clearAll()V

    .line 467
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_0

    .line 468
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    :cond_0
    const/4 p1, 0x0

    .line 470
    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    goto :goto_0

    .line 471
    :cond_1
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_2

    .line 473
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->recycle:Lcom/jzxiang/pickerview/wheel/WheelRecycle;

    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    new-instance v2, Lcom/jzxiang/pickerview/wheel/ItemsRange;

    invoke-direct {v2}, Lcom/jzxiang/pickerview/wheel/ItemsRange;-><init>()V

    iget v3, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/jzxiang/pickerview/wheel/WheelRecycle;->recycleItems(Landroid/widget/LinearLayout;ILcom/jzxiang/pickerview/wheel/ItemsRange;I)I

    .line 476
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->invalidate()V

    return-void
.end method

.method public isCyclic()Z
    .locals 1

    .line 446
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isCyclic:Z

    return v0
.end method

.method protected notifyChangingListeners(II)V
    .locals 3

    .line 293
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->changingListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    .line 294
    invoke-interface {v1, p0, p1, p2}, Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;->onChanged(Lcom/jzxiang/pickerview/wheel/WheelView;II)V

    goto :goto_0

    :cond_0
    if-ltz p1, :cond_2

    if-ltz p2, :cond_2

    .line 297
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_1

    goto :goto_1

    .line 300
    :cond_1
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    sub-int v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 301
    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    iget v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->firstItem:I

    sub-int v2, p2, v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 303
    invoke-virtual {p0, v0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->refreshTextStatus(Landroid/view/View;I)V

    .line 304
    invoke-virtual {p0, v1, p2}, Lcom/jzxiang/pickerview/wheel/WheelView;->refreshTextStatus(Landroid/view/View;I)V

    :cond_2
    :goto_1
    return-void
.end method

.method protected notifyClickListenersAboutClick(I)V
    .locals 2

    .line 368
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->clickingListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jzxiang/pickerview/wheel/OnWheelClickedListener;

    .line 369
    invoke-interface {v1, p0, p1}, Lcom/jzxiang/pickerview/wheel/OnWheelClickedListener;->onItemClicked(Lcom/jzxiang/pickerview/wheel/WheelView;I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected notifyScrollingListenersAboutEnd()V
    .locals 2

    .line 339
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jzxiang/pickerview/wheel/OnWheelScrollListener;

    .line 340
    invoke-interface {v1, p0}, Lcom/jzxiang/pickerview/wheel/OnWheelScrollListener;->onScrollingFinished(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected notifyScrollingListenersAboutStart()V
    .locals 2

    .line 330
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jzxiang/pickerview/wheel/OnWheelScrollListener;

    .line 331
    invoke-interface {v1, p0}, Lcom/jzxiang/pickerview/wheel/OnWheelScrollListener;->onScrollingStarted(Lcom/jzxiang/pickerview/wheel/WheelView;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 599
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 600
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getItemsCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 601
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->updateView()V

    .line 602
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->drawItems(Landroid/graphics/Canvas;)V

    .line 603
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->drawCenterRect(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    sub-int/2addr p4, p2

    sub-int/2addr p5, p3

    .line 582
    invoke-direct {p0, p4, p5}, Lcom/jzxiang/pickerview/wheel/WheelView;->layout(II)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 3

    .line 557
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 558
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 559
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 560
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 562
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->buildViewForMeasuring()V

    .line 564
    invoke-direct {p0, p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->calculateLayoutWidth(II)I

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    if-ne v1, v0, :cond_0

    goto :goto_0

    .line 570
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getDesiredHeight(Landroid/widget/LinearLayout;)I

    move-result v0

    const/high16 v2, -0x80000000

    if-ne v1, v2, :cond_1

    .line 573
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    goto :goto_0

    :cond_1
    move p2, v0

    .line 577
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/jzxiang/pickerview/wheel/WheelView;->setMeasuredDimension(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 646
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->isEnabled()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getViewAdapter()Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 650
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v2, 0x2

    if-eq v0, v1, :cond_2

    if-eq v0, v2, :cond_1

    goto :goto_1

    .line 652
    :cond_1
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 653
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_1

    .line 658
    :cond_2
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isScrollingPerformed:Z

    if-nez v0, :cond_4

    .line 659
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result v1

    div-int/2addr v1, v2

    sub-int/2addr v0, v1

    if-lez v0, :cond_3

    .line 661
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v1

    div-int/2addr v1, v2

    add-int/2addr v0, v1

    goto :goto_0

    .line 663
    :cond_3
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v1

    div-int/2addr v1, v2

    sub-int/2addr v0, v1

    .line 665
    :goto_0
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v1

    div-int/2addr v0, v1

    if-eqz v0, :cond_4

    .line 666
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    add-int/2addr v1, v0

    invoke-direct {p0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->isValidItemIndex(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 667
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->notifyClickListenersAboutClick(I)V

    .line 673
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scroller:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-virtual {v0, p1}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_5
    :goto_2
    return v1
.end method

.method refreshTextStatus(Landroid/view/View;I)V
    .locals 1

    .line 888
    instance-of v0, p1, Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 890
    :cond_0
    check-cast p1, Landroid/widget/TextView;

    .line 891
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    if-ne p2, v0, :cond_1

    .line 892
    iget p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->selectorColor:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 894
    :cond_1
    iget p2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->defaultColor:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    :goto_0
    return-void
.end method

.method public removeChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V
    .locals 1

    .line 283
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->changingListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeClickingListener(Lcom/jzxiang/pickerview/wheel/OnWheelClickedListener;)V
    .locals 1

    .line 361
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->clickingListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeScrollingListener(Lcom/jzxiang/pickerview/wheel/OnWheelScrollListener;)V
    .locals 1

    .line 323
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public scroll(II)V
    .locals 1

    .line 745
    invoke-direct {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getItemHeight()I

    move-result v0

    mul-int p1, p1, v0

    iget v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    sub-int/2addr p1, v0

    .line 746
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scroller:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-virtual {v0, p1, p2}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->scroll(II)V

    return-void
.end method

.method public setConfig(Lcom/jzxiang/pickerview/config/PickerConfig;)V
    .locals 2

    .line 201
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintLineCenter:Landroid/graphics/Paint;

    iget v1, p1, Lcom/jzxiang/pickerview/config/PickerConfig;->mThemeColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 203
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintRectCenter:Landroid/graphics/Paint;

    iget v1, p1, Lcom/jzxiang/pickerview/config/PickerConfig;->mThemeColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 204
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->mPaintRectCenter:Landroid/graphics/Paint;

    const/16 v1, 0x19

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 206
    iget v0, p1, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVNormalColor:I

    iput v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->defaultColor:I

    .line 207
    iget p1, p1, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVSelectorColor:I

    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->selectorColor:I

    return-void
.end method

.method public setCurrentItem(I)V
    .locals 1

    const/4 v0, 0x0

    .line 388
    invoke-virtual {p0, p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(IZ)V

    return-void
.end method

.method public setCurrentItem(IZ)V
    .locals 4

    .line 398
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    if-eqz v0, :cond_7

    invoke-interface {v0}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getItemsCount()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 402
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    invoke-interface {v0}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getItemsCount()I

    move-result v0

    if-ltz p1, :cond_1

    if-lt p1, v0, :cond_3

    .line 404
    :cond_1
    iget-boolean v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isCyclic:Z

    if-eqz v1, :cond_7

    :goto_0
    if-gez p1, :cond_2

    add-int/2addr p1, v0

    goto :goto_0

    .line 408
    :cond_2
    rem-int/2addr p1, v0

    .line 415
    :cond_3
    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    if-eq p1, v1, :cond_7

    const/4 v2, 0x0

    if-eqz p2, :cond_6

    sub-int p2, p1, v1

    .line 418
    iget-boolean v3, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isCyclic:Z

    if-eqz v3, :cond_5

    .line 419
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    sub-int/2addr v0, p1

    .line 420
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-ge v0, p1, :cond_5

    if-gez p2, :cond_4

    move p2, v0

    goto :goto_1

    :cond_4
    neg-int p1, v0

    move p2, p1

    .line 424
    :cond_5
    :goto_1
    invoke-virtual {p0, p2, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->scroll(II)V

    goto :goto_2

    .line 426
    :cond_6
    iput v2, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scrollingOffset:I

    .line 429
    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->currentItem:I

    .line 431
    invoke-virtual {p0, v1, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->notifyChangingListeners(II)V

    .line 433
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/WheelView;->invalidate()V

    :cond_7
    :goto_2
    return-void
.end method

.method public setCyclic(Z)V
    .locals 0

    .line 455
    iput-boolean p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->isCyclic:Z

    const/4 p1, 0x0

    .line 456
    invoke-virtual {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->invalidateWheel(Z)V

    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scroller:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-virtual {v0, p1}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->setInterpolator(Landroid/view/animation/Interpolator;)V

    return-void
.end method

.method public setViewAdapter(Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;)V
    .locals 2

    .line 256
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    if-eqz v0, :cond_0

    .line 257
    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 259
    :cond_0
    iput-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->viewAdapter:Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;

    if-eqz p1, :cond_1

    .line 261
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 264
    :cond_1
    invoke-interface {p1}, Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;->getConfig()Lcom/jzxiang/pickerview/config/PickerConfig;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->setConfig(Lcom/jzxiang/pickerview/config/PickerConfig;)V

    const/4 p1, 0x1

    .line 265
    invoke-virtual {p0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->invalidateWheel(Z)V

    return-void
.end method

.method public setVisibleItems(I)V
    .locals 0

    .line 237
    iput p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->visibleItems:I

    return-void
.end method

.method public stopScrolling()V
    .locals 1

    .line 940
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView;->scroller:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->stopScrolling()V

    return-void
.end method
