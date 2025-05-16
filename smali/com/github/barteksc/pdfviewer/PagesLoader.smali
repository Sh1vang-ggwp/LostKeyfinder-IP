.class Lcom/github/barteksc/pdfviewer/PagesLoader;
.super Ljava/lang/Object;
.source "PagesLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;,
        Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;
    }
.end annotation


# instance fields
.field private cacheOrder:I

.field private final firstGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

.field private final firstHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

.field private final lastGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

.field private final lastHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

.field private final middleGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

.field private pageRelativePartHeight:F

.field private pageRelativePartWidth:F

.field private partRenderHeight:F

.field private partRenderWidth:F

.field private pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

.field private final preloadOffset:I

.field private final thumbnailRect:Landroid/graphics/RectF;

.field private xOffset:F

.field private yOffset:F


# direct methods
.method constructor <init>(Lcom/github/barteksc/pdfviewer/PDFView;)V
    .locals 3

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Landroid/graphics/RectF;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v2, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->thumbnailRect:Landroid/graphics/RectF;

    .line 40
    new-instance v0, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;-><init>(Lcom/github/barteksc/pdfviewer/PagesLoader;Lcom/github/barteksc/pdfviewer/PagesLoader$1;)V

    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    .line 41
    new-instance v0, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    invoke-direct {v0, p0, v1}, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;-><init>(Lcom/github/barteksc/pdfviewer/PagesLoader;Lcom/github/barteksc/pdfviewer/PagesLoader$1;)V

    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    .line 42
    new-instance v0, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    invoke-direct {v0, p0, v1}, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;-><init>(Lcom/github/barteksc/pdfviewer/PagesLoader;Lcom/github/barteksc/pdfviewer/PagesLoader$1;)V

    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    .line 43
    new-instance v0, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    invoke-direct {v0, p0, v1}, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;-><init>(Lcom/github/barteksc/pdfviewer/PagesLoader;Lcom/github/barteksc/pdfviewer/PagesLoader$1;)V

    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    .line 44
    new-instance v0, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    invoke-direct {v0, p0, v1}, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;-><init>(Lcom/github/barteksc/pdfviewer/PagesLoader;Lcom/github/barteksc/pdfviewer/PagesLoader$1;)V

    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->middleGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    .line 58
    iput-object p1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    .line 59
    invoke-virtual {p1}, Lcom/github/barteksc/pdfviewer/PDFView;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lcom/github/barteksc/pdfviewer/util/Constants;->PRELOAD_OFFSET:I

    invoke-static {p1, v0}, Lcom/github/barteksc/pdfviewer/util/Util;->getDP(Landroid/content/Context;I)I

    move-result p1

    iput p1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->preloadOffset:I

    return-void
.end method

.method private calculatePartSize(Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;)V
    .locals 2

    .line 103
    iget v0, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->cols:I

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float v0, v1, v0

    iput v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pageRelativePartWidth:F

    .line 104
    iget p1, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->rows:I

    int-to-float p1, p1

    div-float/2addr v1, p1

    iput v1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pageRelativePartHeight:F

    .line 105
    sget p1, Lcom/github/barteksc/pdfviewer/util/Constants;->PART_SIZE:F

    iget v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pageRelativePartWidth:F

    div-float/2addr p1, v0

    iput p1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->partRenderWidth:F

    .line 106
    sget p1, Lcom/github/barteksc/pdfviewer/util/Constants;->PART_SIZE:F

    iget v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pageRelativePartHeight:F

    div-float/2addr p1, v0

    iput p1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->partRenderHeight:F

    return-void
.end method

.method private getPageAndCoordsByOffset(Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;FFZ)Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;
    .locals 6

    const/4 v0, 0x0

    .line 74
    invoke-static {p3, v0}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->max(FF)F

    move-result p3

    neg-float p3, p3

    .line 75
    invoke-static {p4, v0}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->max(FF)F

    move-result p4

    neg-float p4, p4

    .line 76
    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v1}, Lcom/github/barteksc/pdfviewer/PDFView;->isSwipeVertical()Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, p4

    goto :goto_0

    :cond_0
    move v1, p3

    .line 77
    :goto_0
    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v2, v2, Lcom/github/barteksc/pdfviewer/PDFView;->pdfFile:Lcom/github/barteksc/pdfviewer/PdfFile;

    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v3}, Lcom/github/barteksc/pdfviewer/PDFView;->getZoom()F

    move-result v3

    invoke-virtual {v2, v1, v3}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPageAtOffset(FF)I

    move-result v1

    iput v1, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    .line 78
    iget v1, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    invoke-direct {p0, p2, v1}, Lcom/github/barteksc/pdfviewer/PagesLoader;->getPageColsRows(Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)V

    .line 79
    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v1, v1, Lcom/github/barteksc/pdfviewer/PDFView;->pdfFile:Lcom/github/barteksc/pdfviewer/PdfFile;

    iget v2, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v3}, Lcom/github/barteksc/pdfviewer/PDFView;->getZoom()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/github/barteksc/pdfviewer/PdfFile;->getScaledPageSize(IF)Lcom/shockwave/pdfium/util/SizeF;

    move-result-object v1

    .line 80
    invoke-virtual {v1}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result v2

    iget v3, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->rows:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    .line 81
    invoke-virtual {v1}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result v1

    iget p2, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->cols:I

    int-to-float p2, p2

    div-float/2addr v1, p2

    .line 83
    iget-object p2, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object p2, p2, Lcom/github/barteksc/pdfviewer/PDFView;->pdfFile:Lcom/github/barteksc/pdfviewer/PdfFile;

    iget v3, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v4}, Lcom/github/barteksc/pdfviewer/PDFView;->getZoom()F

    move-result v4

    invoke-virtual {p2, v3, v4}, Lcom/github/barteksc/pdfviewer/PdfFile;->getSecondaryPageOffset(IF)F

    move-result p2

    .line 84
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v3}, Lcom/github/barteksc/pdfviewer/PDFView;->isSwipeVertical()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 85
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v3, v3, Lcom/github/barteksc/pdfviewer/PDFView;->pdfFile:Lcom/github/barteksc/pdfviewer/PdfFile;

    iget v4, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    iget-object v5, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v5}, Lcom/github/barteksc/pdfviewer/PDFView;->getZoom()F

    move-result v5

    invoke-virtual {v3, v4, v5}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPageOffset(IF)F

    move-result v3

    sub-float/2addr p4, v3

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p4

    div-float/2addr p4, v2

    sub-float/2addr p3, p2

    .line 86
    invoke-static {p3, v0}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->min(FF)F

    move-result p2

    div-float/2addr p2, v1

    goto :goto_1

    .line 88
    :cond_1
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v3, v3, Lcom/github/barteksc/pdfviewer/PDFView;->pdfFile:Lcom/github/barteksc/pdfviewer/PdfFile;

    iget v4, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    iget-object v5, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v5}, Lcom/github/barteksc/pdfviewer/PDFView;->getZoom()F

    move-result v5

    invoke-virtual {v3, v4, v5}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPageOffset(IF)F

    move-result v3

    sub-float/2addr p3, v3

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p3

    div-float/2addr p3, v1

    sub-float/2addr p4, p2

    .line 89
    invoke-static {p4, v0}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->min(FF)F

    move-result p2

    div-float p4, p2, v2

    move p2, p3

    :goto_1
    if-eqz p5, :cond_2

    .line 93
    invoke-static {p4}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->ceil(F)I

    move-result p3

    iput p3, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->row:I

    .line 94
    invoke-static {p2}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->ceil(F)I

    move-result p2

    iput p2, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->col:I

    goto :goto_2

    .line 96
    :cond_2
    invoke-static {p4}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->floor(F)I

    move-result p3

    iput p3, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->row:I

    .line 97
    invoke-static {p2}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->floor(F)I

    move-result p2

    iput p2, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->col:I

    :goto_2
    return-object p1
.end method

.method private getPageColsRows(Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)V
    .locals 3

    .line 63
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v0, v0, Lcom/github/barteksc/pdfviewer/PDFView;->pdfFile:Lcom/github/barteksc/pdfviewer/PdfFile;

    invoke-virtual {v0, p2}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPageSize(I)Lcom/shockwave/pdfium/util/SizeF;

    move-result-object p2

    .line 64
    invoke-virtual {p2}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float v0, v1, v0

    .line 65
    invoke-virtual {p2}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result p2

    div-float p2, v1, p2

    .line 66
    sget v2, Lcom/github/barteksc/pdfviewer/util/Constants;->PART_SIZE:F

    mul-float v2, v2, p2

    iget-object p2, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {p2}, Lcom/github/barteksc/pdfviewer/PDFView;->getZoom()F

    move-result p2

    div-float/2addr v2, p2

    .line 67
    sget p2, Lcom/github/barteksc/pdfviewer/util/Constants;->PART_SIZE:F

    mul-float p2, p2, v0

    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v0}, Lcom/github/barteksc/pdfviewer/PDFView;->getZoom()F

    move-result v0

    div-float/2addr p2, v0

    div-float v0, v1, v2

    .line 68
    invoke-static {v0}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->ceil(F)I

    move-result v0

    iput v0, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->rows:I

    div-float/2addr v1, p2

    .line 69
    invoke-static {v1}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->ceil(F)I

    move-result p2

    iput p2, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->cols:I

    return-void
.end method

.method private loadCell(IIIFF)Z
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p3

    int-to-float v1, v1

    mul-float v1, v1, p4

    move/from16 v2, p2

    int-to-float v2, v2

    mul-float v2, v2, p5

    .line 217
    iget v3, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->partRenderWidth:F

    .line 218
    iget v4, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->partRenderHeight:F

    add-float v5, v1, p4

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_0

    sub-float v5, v6, v1

    goto :goto_0

    :cond_0
    move/from16 v5, p4

    :goto_0
    add-float v7, v2, p5

    cmpl-float v7, v7, v6

    if-lez v7, :cond_1

    sub-float/2addr v6, v2

    goto :goto_1

    :cond_1
    move/from16 v6, p5

    :goto_1
    mul-float v9, v3, v5

    mul-float v10, v4, v6

    .line 227
    new-instance v11, Landroid/graphics/RectF;

    add-float/2addr v5, v1

    add-float/2addr v6, v2

    invoke-direct {v11, v1, v2, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v1, 0x0

    cmpl-float v2, v9, v1

    if-lez v2, :cond_3

    cmpl-float v1, v10, v1

    if-lez v1, :cond_3

    .line 230
    iget-object v1, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v1, v1, Lcom/github/barteksc/pdfviewer/PDFView;->cacheManager:Lcom/github/barteksc/pdfviewer/CacheManager;

    iget v2, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->cacheOrder:I

    move/from16 v3, p1

    invoke-virtual {v1, v3, v11, v2}, Lcom/github/barteksc/pdfviewer/CacheManager;->upPartIfContained(ILandroid/graphics/RectF;I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 231
    iget-object v1, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v7, v1, Lcom/github/barteksc/pdfviewer/PDFView;->renderingHandler:Lcom/github/barteksc/pdfviewer/RenderingHandler;

    const/4 v12, 0x0

    iget v13, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->cacheOrder:I

    iget-object v1, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    .line 232
    invoke-virtual {v1}, Lcom/github/barteksc/pdfviewer/PDFView;->isBestQuality()Z

    move-result v14

    iget-object v1, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    .line 233
    invoke-virtual {v1}, Lcom/github/barteksc/pdfviewer/PDFView;->isAnnotationRendering()Z

    move-result v15

    move/from16 v8, p1

    .line 231
    invoke-virtual/range {v7 .. v15}, Lcom/github/barteksc/pdfviewer/RenderingHandler;->addRenderingTask(IFFLandroid/graphics/RectF;ZIZZ)V

    .line 236
    :cond_2
    iget v1, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->cacheOrder:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, v0, Lcom/github/barteksc/pdfviewer/PagesLoader;->cacheOrder:I

    return v2

    :cond_3
    const/4 v1, 0x0

    return v1
.end method

.method private loadPage(IIIIII)I
    .locals 8

    const/4 v0, 0x0

    :goto_0
    if-gt p2, p3, :cond_3

    move v7, p4

    :goto_1
    if-gt v7, p5, :cond_2

    .line 199
    iget v5, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pageRelativePartWidth:F

    iget v6, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pageRelativePartHeight:F

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, v7

    invoke-direct/range {v1 .. v6}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadCell(IIIFF)Z

    move-result v1

    if-eqz v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    :cond_0
    if-lt v0, p6, :cond_1

    return v0

    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    return v0
.end method

.method private loadPageCenter(Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)I
    .locals 7

    .line 157
    invoke-direct {p0, p3}, Lcom/github/barteksc/pdfviewer/PagesLoader;->calculatePartSize(Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;)V

    .line 158
    iget v1, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    iget v2, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->row:I

    iget v3, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->row:I

    iget v4, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->col:I

    iget v5, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->col:I

    move-object v0, p0

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadPage(IIIIII)I

    move-result p1

    return p1
.end method

.method private loadPageEnd(Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)I
    .locals 8

    .line 167
    invoke-direct {p0, p2}, Lcom/github/barteksc/pdfviewer/PagesLoader;->calculatePartSize(Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;)V

    .line 168
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v0}, Lcom/github/barteksc/pdfviewer/PDFView;->isSwipeVertical()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget v3, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->row:I

    .line 170
    iget v2, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    iget p1, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->rows:I

    add-int/lit8 v4, p1, -0x1

    const/4 v5, 0x0

    iget p1, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->cols:I

    add-int/lit8 v6, p1, -0x1

    move-object v1, p0

    move v7, p3

    invoke-direct/range {v1 .. v7}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadPage(IIIIII)I

    move-result p1

    return p1

    .line 172
    :cond_0
    iget v4, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->col:I

    .line 173
    iget v1, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    const/4 v2, 0x0

    iget p1, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->rows:I

    add-int/lit8 v3, p1, -0x1

    iget p1, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->cols:I

    add-int/lit8 v5, p1, -0x1

    move-object v0, p0

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadPage(IIIIII)I

    move-result p1

    return p1
.end method

.method private loadPageStart(Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)I
    .locals 8

    .line 183
    invoke-direct {p0, p2}, Lcom/github/barteksc/pdfviewer/PagesLoader;->calculatePartSize(Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;)V

    .line 184
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v0}, Lcom/github/barteksc/pdfviewer/PDFView;->isSwipeVertical()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    iget v4, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->row:I

    .line 186
    iget v2, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    const/4 v3, 0x0

    const/4 v5, 0x0

    iget p1, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->cols:I

    add-int/lit8 v6, p1, -0x1

    move-object v1, p0

    move v7, p3

    invoke-direct/range {v1 .. v7}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadPage(IIIIII)I

    move-result p1

    return p1

    .line 188
    :cond_0
    iget v5, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->col:I

    .line 189
    iget v1, p1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    const/4 v2, 0x0

    iget p1, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->rows:I

    add-int/lit8 v3, p1, -0x1

    const/4 v4, 0x0

    move-object v0, p0

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadPage(IIIIII)I

    move-result p1

    return p1
.end method

.method private loadThumbnail(I)V
    .locals 12

    .line 243
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v0, v0, Lcom/github/barteksc/pdfviewer/PDFView;->pdfFile:Lcom/github/barteksc/pdfviewer/PdfFile;

    invoke-virtual {v0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPageSize(I)Lcom/shockwave/pdfium/util/SizeF;

    move-result-object v0

    .line 244
    invoke-virtual {v0}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result v1

    sget v2, Lcom/github/barteksc/pdfviewer/util/Constants;->THUMBNAIL_RATIO:F

    mul-float v5, v1, v2

    .line 245
    invoke-virtual {v0}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result v0

    sget v1, Lcom/github/barteksc/pdfviewer/util/Constants;->THUMBNAIL_RATIO:F

    mul-float v6, v0, v1

    .line 246
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v0, v0, Lcom/github/barteksc/pdfviewer/PDFView;->cacheManager:Lcom/github/barteksc/pdfviewer/CacheManager;

    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->thumbnailRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, v1}, Lcom/github/barteksc/pdfviewer/CacheManager;->containsThumbnail(ILandroid/graphics/RectF;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    iget-object v3, v0, Lcom/github/barteksc/pdfviewer/PDFView;->renderingHandler:Lcom/github/barteksc/pdfviewer/RenderingHandler;

    iget-object v7, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->thumbnailRect:Landroid/graphics/RectF;

    const/4 v8, 0x1

    const/4 v9, 0x0

    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    .line 249
    invoke-virtual {v0}, Lcom/github/barteksc/pdfviewer/PDFView;->isBestQuality()Z

    move-result v10

    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v0}, Lcom/github/barteksc/pdfviewer/PDFView;->isAnnotationRendering()Z

    move-result v11

    move v4, p1

    .line 247
    invoke-virtual/range {v3 .. v11}, Lcom/github/barteksc/pdfviewer/RenderingHandler;->addRenderingTask(IFFLandroid/graphics/RectF;ZIZZ)V

    :cond_0
    return-void
.end method

.method private loadVisible()V
    .locals 13

    .line 111
    iget v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->preloadOffset:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v1}, Lcom/github/barteksc/pdfviewer/PDFView;->getZoom()F

    move-result v1

    mul-float v0, v0, v1

    .line 112
    iget v1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->xOffset:F

    neg-float v2, v1

    add-float v6, v2, v0

    neg-float v1, v1

    .line 113
    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v2}, Lcom/github/barteksc/pdfviewer/PDFView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    sub-float v10, v1, v0

    .line 114
    iget v1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->yOffset:F

    neg-float v2, v1

    add-float v7, v2, v0

    neg-float v1, v1

    .line 115
    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v2}, Lcom/github/barteksc/pdfviewer/PDFView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    sub-float v11, v1, v0

    .line 117
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget-object v5, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    const/4 v8, 0x0

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/github/barteksc/pdfviewer/PagesLoader;->getPageAndCoordsByOffset(Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;FFZ)Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    .line 118
    iget-object v8, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget-object v9, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    const/4 v12, 0x1

    move-object v7, p0

    invoke-direct/range {v7 .. v12}, Lcom/github/barteksc/pdfviewer/PagesLoader;->getPageAndCoordsByOffset(Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;FFZ)Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    .line 120
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget v0, v0, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    :goto_0
    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget v1, v1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    if-gt v0, v1, :cond_0

    .line 121
    invoke-direct {p0, v0}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadThumbnail(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget v0, v0, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget v1, v1, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    sub-int/2addr v0, v1

    const/4 v1, 0x1

    add-int/2addr v0, v1

    .line 125
    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget v2, v2, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    const/4 v3, 0x0

    :goto_1
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget v4, v4, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    if-gt v2, v4, :cond_4

    sget v4, Lcom/github/barteksc/pdfviewer/util/Constants$Cache;->CACHE_SIZE:I

    if-ge v3, v4, :cond_4

    .line 127
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget v4, v4, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    if-ne v2, v4, :cond_1

    if-le v0, v1, :cond_1

    .line 128
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget-object v5, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    sget v6, Lcom/github/barteksc/pdfviewer/util/Constants$Cache;->CACHE_SIZE:I

    sub-int/2addr v6, v3

    invoke-direct {p0, v4, v5, v6}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadPageEnd(Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)I

    move-result v4

    :goto_2
    add-int/2addr v3, v4

    goto :goto_3

    .line 129
    :cond_1
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget v4, v4, Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;->page:I

    if-ne v2, v4, :cond_2

    if-le v0, v1, :cond_2

    .line 130
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget-object v5, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    sget v6, Lcom/github/barteksc/pdfviewer/util/Constants$Cache;->CACHE_SIZE:I

    sub-int/2addr v6, v3

    invoke-direct {p0, v4, v5, v6}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadPageStart(Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)I

    move-result v4

    goto :goto_2

    :cond_2
    if-ne v0, v1, :cond_3

    .line 132
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget-object v5, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->lastHolder:Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;

    iget-object v6, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->firstGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    sget v7, Lcom/github/barteksc/pdfviewer/util/Constants$Cache;->CACHE_SIZE:I

    sub-int/2addr v7, v3

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadPageCenter(Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$Holder;Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)I

    move-result v4

    goto :goto_2

    .line 134
    :cond_3
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->middleGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    invoke-direct {p0, v4, v2}, Lcom/github/barteksc/pdfviewer/PagesLoader;->getPageColsRows(Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)V

    .line 135
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->middleGrid:Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;

    sget v5, Lcom/github/barteksc/pdfviewer/util/Constants$Cache;->CACHE_SIZE:I

    sub-int/2addr v5, v3

    invoke-direct {p0, v2, v4, v5}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadWholePage(ILcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)I

    move-result v4

    goto :goto_2

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    return-void
.end method

.method private loadWholePage(ILcom/github/barteksc/pdfviewer/PagesLoader$GridSize;I)I
    .locals 8

    .line 147
    invoke-direct {p0, p2}, Lcom/github/barteksc/pdfviewer/PagesLoader;->calculatePartSize(Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;)V

    .line 148
    iget v0, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->rows:I

    add-int/lit8 v4, v0, -0x1

    iget p2, p2, Lcom/github/barteksc/pdfviewer/PagesLoader$GridSize;->cols:I

    add-int/lit8 v6, p2, -0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move v7, p3

    invoke-direct/range {v1 .. v7}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadPage(IIIIII)I

    move-result p1

    return p1
.end method


# virtual methods
.method loadPages()V
    .locals 2

    const/4 v0, 0x1

    .line 254
    iput v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->cacheOrder:I

    .line 255
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v0}, Lcom/github/barteksc/pdfviewer/PDFView;->getCurrentXOffset()F

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->max(FF)F

    move-result v0

    neg-float v0, v0

    iput v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->xOffset:F

    .line 256
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->pdfView:Lcom/github/barteksc/pdfviewer/PDFView;

    invoke-virtual {v0}, Lcom/github/barteksc/pdfviewer/PDFView;->getCurrentYOffset()F

    move-result v0

    invoke-static {v0, v1}, Lcom/github/barteksc/pdfviewer/util/MathUtils;->max(FF)F

    move-result v0

    neg-float v0, v0

    iput v0, p0, Lcom/github/barteksc/pdfviewer/PagesLoader;->yOffset:F

    .line 258
    invoke-direct {p0}, Lcom/github/barteksc/pdfviewer/PagesLoader;->loadVisible()V

    return-void
.end method
