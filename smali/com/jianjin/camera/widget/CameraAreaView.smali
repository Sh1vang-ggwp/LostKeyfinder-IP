.class public Lcom/jianjin/camera/widget/CameraAreaView;
.super Landroid/view/View;
.source "CameraAreaView.java"


# instance fields
.field private CORNER_LENGTH:I

.field private CORNER_WIDTH:I

.field private height:I

.field private mPaint:Landroid/graphics/Paint;

.field private width:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, v0}, Lcom/jianjin/camera/widget/CameraAreaView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, p2, v0}, Lcom/jianjin/camera/widget/CameraAreaView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0xc

    .line 19
    iput p1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_WIDTH:I

    const/16 p1, 0x2c

    .line 20
    iput p1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_LENGTH:I

    const p1, 0x106000d

    .line 32
    invoke-virtual {p0, p1}, Lcom/jianjin/camera/widget/CameraAreaView;->setBackgroundResource(I)V

    .line 33
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->mPaint:Landroid/graphics/Paint;

    const/4 p2, -0x1

    .line 34
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 53
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 56
    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_WIDTH:I

    int-to-float v4, v0

    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_LENGTH:I

    int-to-float v5, v0

    iget-object v6, p0, Lcom/jianjin/camera/widget/CameraAreaView;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 58
    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_LENGTH:I

    int-to-float v4, v0

    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_WIDTH:I

    int-to-float v5, v0

    iget-object v6, p0, Lcom/jianjin/camera/widget/CameraAreaView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 61
    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->width:I

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_LENGTH:I

    sub-int v1, v0, v1

    int-to-float v3, v1

    int-to-float v5, v0

    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_WIDTH:I

    int-to-float v6, v0

    iget-object v7, p0, Lcom/jianjin/camera/widget/CameraAreaView;->mPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 63
    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->width:I

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_WIDTH:I

    sub-int v1, v0, v1

    int-to-float v3, v1

    int-to-float v5, v0

    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_LENGTH:I

    int-to-float v6, v0

    iget-object v7, p0, Lcom/jianjin/camera/widget/CameraAreaView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 66
    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->height:I

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_LENGTH:I

    sub-int v1, v0, v1

    int-to-float v4, v1

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_WIDTH:I

    int-to-float v5, v1

    int-to-float v6, v0

    iget-object v7, p0, Lcom/jianjin/camera/widget/CameraAreaView;->mPaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 68
    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->height:I

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_WIDTH:I

    sub-int v1, v0, v1

    int-to-float v4, v1

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_LENGTH:I

    int-to-float v5, v1

    int-to-float v6, v0

    iget-object v7, p0, Lcom/jianjin/camera/widget/CameraAreaView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 71
    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->width:I

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_LENGTH:I

    sub-int v1, v0, v1

    int-to-float v3, v1

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->height:I

    iget v2, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_WIDTH:I

    sub-int v2, v1, v2

    int-to-float v4, v2

    int-to-float v5, v0

    int-to-float v6, v1

    iget-object v7, p0, Lcom/jianjin/camera/widget/CameraAreaView;->mPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 73
    iget v0, p0, Lcom/jianjin/camera/widget/CameraAreaView;->width:I

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_WIDTH:I

    sub-int v1, v0, v1

    int-to-float v3, v1

    iget v1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->height:I

    iget v2, p0, Lcom/jianjin/camera/widget/CameraAreaView;->CORNER_LENGTH:I

    sub-int v2, v1, v2

    int-to-float v4, v2

    int-to-float v5, v0

    int-to-float v6, v1

    iget-object v7, p0, Lcom/jianjin/camera/widget/CameraAreaView;->mPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 48
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 39
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 41
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraAreaView;->getMeasuredWidth()I

    move-result p1

    iput p1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->width:I

    .line 42
    invoke-virtual {p0}, Lcom/jianjin/camera/widget/CameraAreaView;->getMeasuredHeight()I

    move-result p1

    iput p1, p0, Lcom/jianjin/camera/widget/CameraAreaView;->height:I

    return-void
.end method
