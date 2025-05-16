.class public Lcom/jianjin/camera/widget/FocusImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "FocusImageView.java"


# static fields
.field private static final NO_ID:I = -0x1

.field public static final TAG:Ljava/lang/String; = "FocusImageView"


# instance fields
.field private mAnimation:Landroid/view/animation/Animation;

.field private mFocusFailedImg:I

.field private mFocusImg:I

.field private mFocusSucceedImg:I

.field private mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/jianjin/camera/widget/FocusImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1, p2, v0}, Lcom/jianjin/camera/widget/FocusImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, -0x1

    .line 24
    iput p3, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusImg:I

    .line 25
    iput p3, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusSucceedImg:I

    .line 26
    iput p3, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusFailedImg:I

    .line 40
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/FocusImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/jianjin/camera/R$anim;->focusview_show:I

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mAnimation:Landroid/view/animation/Animation;

    const/16 v0, 0x8

    .line 41
    invoke-virtual {p0, v0}, Lcom/jianjin/camera/widget/FocusImageView;->setVisibility(I)V

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mHandler:Landroid/os/Handler;

    .line 44
    sget-object v0, Lcom/jianjin/camera/R$styleable;->FocusImageView:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 45
    sget p2, Lcom/jianjin/camera/R$styleable;->FocusImageView_focus_focusing_id:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusImg:I

    .line 46
    sget p2, Lcom/jianjin/camera/R$styleable;->FocusImageView_focus_success_id:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusSucceedImg:I

    .line 47
    sget p2, Lcom/jianjin/camera/R$styleable;->FocusImageView_focus_fail_id:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusFailedImg:I

    .line 48
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 51
    iget p1, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusImg:I

    if-eq p1, p3, :cond_0

    iget p1, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusSucceedImg:I

    if-eq p1, p3, :cond_0

    iget p1, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusFailedImg:I

    if-eq p1, p3, :cond_0

    return-void

    .line 52
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "mFocusImg,mFocusSucceedImg,mFocusFailedImg is null"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public onFocusFailed()V
    .locals 4

    .line 101
    iget v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusFailedImg:I

    invoke-virtual {p0, v0}, Lcom/jianjin/camera/widget/FocusImageView;->setImageResource(I)V

    .line 103
    iget-object v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 104
    iget-object v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/jianjin/camera/widget/FocusImageView$3;

    invoke-direct {v1, p0}, Lcom/jianjin/camera/widget/FocusImageView$3;-><init>(Lcom/jianjin/camera/widget/FocusImageView;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public onFocusSuccess()V
    .locals 4

    .line 85
    iget v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusSucceedImg:I

    invoke-virtual {p0, v0}, Lcom/jianjin/camera/widget/FocusImageView;->setImageResource(I)V

    .line 87
    iget-object v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 88
    iget-object v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/jianjin/camera/widget/FocusImageView$2;

    invoke-direct {v1, p0}, Lcom/jianjin/camera/widget/FocusImageView$2;-><init>(Lcom/jianjin/camera/widget/FocusImageView;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public setFocusImg(I)V
    .locals 0

    .line 118
    iput p1, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusImg:I

    return-void
.end method

.method public setFocusSucceedImg(I)V
    .locals 0

    .line 127
    iput p1, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusSucceedImg:I

    return-void
.end method

.method public startFocus(Landroid/graphics/Point;)V
    .locals 3

    .line 61
    iget v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusImg:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusSucceedImg:I

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusFailedImg:I

    if-eq v0, v1, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/FocusImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 65
    iget v1, p1, Landroid/graphics/Point;->y:I

    invoke-virtual {p0}, Lcom/jianjin/camera/widget/FocusImageView;->getMeasuredHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 66
    iget p1, p1, Landroid/graphics/Point;->x:I

    invoke-virtual {p0}, Lcom/jianjin/camera/widget/FocusImageView;->getMeasuredWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr p1, v1

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 67
    invoke-virtual {p0, v0}, Lcom/jianjin/camera/widget/FocusImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x0

    .line 69
    invoke-virtual {p0, p1}, Lcom/jianjin/camera/widget/FocusImageView;->setVisibility(I)V

    .line 70
    iget p1, p0, Lcom/jianjin/camera/widget/FocusImageView;->mFocusImg:I

    invoke-virtual {p0, p1}, Lcom/jianjin/camera/widget/FocusImageView;->setImageResource(I)V

    .line 71
    iget-object p1, p0, Lcom/jianjin/camera/widget/FocusImageView;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p0, p1}, Lcom/jianjin/camera/widget/FocusImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 73
    iget-object p1, p0, Lcom/jianjin/camera/widget/FocusImageView;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/jianjin/camera/widget/FocusImageView$1;

    invoke-direct {v0, p0}, Lcom/jianjin/camera/widget/FocusImageView$1;-><init>(Lcom/jianjin/camera/widget/FocusImageView;)V

    const-wide/16 v1, 0xdac

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 62
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "focus image is null"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
