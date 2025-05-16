.class Lcom/github/barteksc/pdfviewer/PdfFile;
.super Ljava/lang/Object;
.source "PdfFile.java"


# static fields
.field private static final lock:Ljava/lang/Object;


# instance fields
.field private autoSpacing:Z

.field private documentLength:F

.field private isVertical:Z

.field private maxHeightPageSize:Lcom/shockwave/pdfium/util/SizeF;

.field private maxWidthPageSize:Lcom/shockwave/pdfium/util/SizeF;

.field private openedPages:Landroid/util/SparseBooleanArray;

.field private originalMaxHeightPageSize:Lcom/shockwave/pdfium/util/Size;

.field private originalMaxWidthPageSize:Lcom/shockwave/pdfium/util/Size;

.field private originalPageSizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/shockwave/pdfium/util/Size;",
            ">;"
        }
    .end annotation
.end field

.field private originalUserPages:[I

.field private final pageFitPolicy:Lcom/github/barteksc/pdfviewer/util/FitPolicy;

.field private pageOffsets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private pageSizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/shockwave/pdfium/util/SizeF;",
            ">;"
        }
    .end annotation
.end field

.field private pageSpacing:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private pagesCount:I

.field private pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

.field private pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

.field private spacingPx:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/github/barteksc/pdfviewer/PdfFile;->lock:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Lcom/shockwave/pdfium/PdfiumCore;Lcom/shockwave/pdfium/PdfDocument;Lcom/github/barteksc/pdfviewer/util/FitPolicy;Lcom/shockwave/pdfium/util/Size;[IZIZ)V
    .locals 3

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 39
    iput v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pagesCount:I

    .line 41
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalPageSizes:Ljava/util/List;

    .line 43
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSizes:Ljava/util/List;

    .line 45
    new-instance v1, Landroid/util/SparseBooleanArray;

    invoke-direct {v1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->openedPages:Landroid/util/SparseBooleanArray;

    .line 47
    new-instance v1, Lcom/shockwave/pdfium/util/Size;

    invoke-direct {v1, v0, v0}, Lcom/shockwave/pdfium/util/Size;-><init>(II)V

    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalMaxWidthPageSize:Lcom/shockwave/pdfium/util/Size;

    .line 49
    new-instance v1, Lcom/shockwave/pdfium/util/Size;

    invoke-direct {v1, v0, v0}, Lcom/shockwave/pdfium/util/Size;-><init>(II)V

    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalMaxHeightPageSize:Lcom/shockwave/pdfium/util/Size;

    .line 51
    new-instance v1, Lcom/shockwave/pdfium/util/SizeF;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2}, Lcom/shockwave/pdfium/util/SizeF;-><init>(FF)V

    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->maxHeightPageSize:Lcom/shockwave/pdfium/util/SizeF;

    .line 53
    new-instance v1, Lcom/shockwave/pdfium/util/SizeF;

    invoke-direct {v1, v2, v2}, Lcom/shockwave/pdfium/util/SizeF;-><init>(FF)V

    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->maxWidthPageSize:Lcom/shockwave/pdfium/util/SizeF;

    const/4 v1, 0x1

    .line 55
    iput-boolean v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->isVertical:Z

    .line 57
    iput v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->spacingPx:I

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageOffsets:Ljava/util/List;

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSpacing:Ljava/util/List;

    .line 65
    iput v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->documentLength:F

    .line 75
    iput-object p1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    .line 76
    iput-object p2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    .line 77
    iput-object p3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageFitPolicy:Lcom/github/barteksc/pdfviewer/util/FitPolicy;

    .line 78
    iput-object p5, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalUserPages:[I

    .line 79
    iput-boolean p6, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->isVertical:Z

    .line 80
    iput p7, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->spacingPx:I

    .line 81
    iput-boolean p8, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->autoSpacing:Z

    .line 82
    invoke-direct {p0, p4}, Lcom/github/barteksc/pdfviewer/PdfFile;->setup(Lcom/shockwave/pdfium/util/Size;)V

    return-void
.end method

.method private prepareAutoSpacing(Lcom/shockwave/pdfium/util/Size;)V
    .locals 4

    .line 163
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSpacing:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    .line 164
    :goto_0
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 165
    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSizes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/shockwave/pdfium/util/SizeF;

    const/4 v2, 0x0

    .line 166
    iget-boolean v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->isVertical:Z

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Lcom/shockwave/pdfium/util/Size;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result v1

    goto :goto_1

    .line 167
    :cond_0
    invoke-virtual {p1}, Lcom/shockwave/pdfium/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result v1

    :goto_1
    sub-float/2addr v3, v1

    .line 166
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 168
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_1

    .line 169
    iget v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->spacingPx:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    .line 171
    :cond_1
    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSpacing:Ljava/util/List;

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private prepareDocLen()V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 177
    :goto_0
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 178
    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSizes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/shockwave/pdfium/util/SizeF;

    .line 179
    iget-boolean v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->isVertical:Z

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result v2

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result v2

    :goto_1
    add-float/2addr v0, v2

    .line 180
    iget-boolean v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->autoSpacing:Z

    if-eqz v2, :cond_1

    .line 181
    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSpacing:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    :goto_2
    add-float/2addr v0, v2

    goto :goto_3

    .line 182
    :cond_1
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_2

    .line 183
    iget v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->spacingPx:I

    int-to-float v2, v2

    goto :goto_2

    :cond_2
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 186
    :cond_3
    iput v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->documentLength:F

    return-void
.end method

.method private preparePagesOffset()V
    .locals 6

    .line 190
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageOffsets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 192
    :goto_0
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 193
    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSizes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/shockwave/pdfium/util/SizeF;

    .line 194
    iget-boolean v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->isVertical:Z

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result v2

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result v2

    .line 195
    :goto_1
    iget-boolean v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->autoSpacing:Z

    if-eqz v3, :cond_3

    .line 196
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSpacing:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float/2addr v0, v3

    if-nez v1, :cond_1

    .line 198
    iget v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->spacingPx:I

    int-to-float v3, v3

    div-float/2addr v3, v4

    sub-float/2addr v0, v3

    goto :goto_2

    .line 199
    :cond_1
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v1, v3, :cond_2

    .line 200
    iget v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->spacingPx:I

    int-to-float v3, v3

    div-float/2addr v3, v4

    add-float/2addr v0, v3

    .line 202
    :cond_2
    :goto_2
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageOffsets:Ljava/util/List;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSpacing:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    div-float/2addr v3, v4

    goto :goto_3

    .line 205
    :cond_3
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageOffsets:Ljava/util/List;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    iget v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->spacingPx:I

    int-to-float v3, v3

    :goto_3
    add-float/2addr v2, v3

    add-float/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private setup(Lcom/shockwave/pdfium/util/Size;)V
    .locals 4

    .line 86
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalUserPages:[I

    if-eqz v0, :cond_0

    .line 87
    array-length v0, v0

    iput v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pagesCount:I

    goto :goto_0

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    invoke-virtual {v0, v1}, Lcom/shockwave/pdfium/PdfiumCore;->getPageCount(Lcom/shockwave/pdfium/PdfDocument;)I

    move-result v0

    iput v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pagesCount:I

    :goto_0
    const/4 v0, 0x0

    .line 92
    :goto_1
    iget v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pagesCount:I

    if-ge v0, v1, :cond_3

    .line 93
    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    invoke-virtual {p0, v0}, Lcom/github/barteksc/pdfviewer/PdfFile;->documentPage(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/shockwave/pdfium/PdfiumCore;->getPageSize(Lcom/shockwave/pdfium/PdfDocument;I)Lcom/shockwave/pdfium/util/Size;

    move-result-object v1

    .line 94
    invoke-virtual {v1}, Lcom/shockwave/pdfium/util/Size;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalMaxWidthPageSize:Lcom/shockwave/pdfium/util/Size;

    invoke-virtual {v3}, Lcom/shockwave/pdfium/util/Size;->getWidth()I

    move-result v3

    if-le v2, v3, :cond_1

    .line 95
    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalMaxWidthPageSize:Lcom/shockwave/pdfium/util/Size;

    .line 97
    :cond_1
    invoke-virtual {v1}, Lcom/shockwave/pdfium/util/Size;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalMaxHeightPageSize:Lcom/shockwave/pdfium/util/Size;

    invoke-virtual {v3}, Lcom/shockwave/pdfium/util/Size;->getHeight()I

    move-result v3

    if-le v2, v3, :cond_2

    .line 98
    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalMaxHeightPageSize:Lcom/shockwave/pdfium/util/Size;

    .line 100
    :cond_2
    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalPageSizes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 103
    :cond_3
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->recalculatePageSizes(Lcom/shockwave/pdfium/util/Size;)V

    return-void
.end method


# virtual methods
.method public determineValidPageNumberFrom(I)I
    .locals 2

    if-gtz p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 339
    :cond_0
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalUserPages:[I

    if-eqz v0, :cond_1

    .line 340
    array-length v1, v0

    if-lt p1, v1, :cond_2

    .line 341
    array-length p1, v0

    :goto_0
    add-int/lit8 p1, p1, -0x1

    return p1

    .line 344
    :cond_1
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result v0

    if-lt p1, v0, :cond_2

    .line 345
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result p1

    goto :goto_0

    :cond_2
    return p1
.end method

.method public dispose()V
    .locals 2

    .line 319
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    if-eqz v1, :cond_0

    .line 320
    invoke-virtual {v0, v1}, Lcom/shockwave/pdfium/PdfiumCore;->closeDocument(Lcom/shockwave/pdfium/PdfDocument;)V

    :cond_0
    const/4 v0, 0x0

    .line 323
    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    .line 324
    iput-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalUserPages:[I

    return-void
.end method

.method public documentPage(I)I
    .locals 3

    .line 353
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalUserPages:[I

    const/4 v1, -0x1

    if-eqz v0, :cond_2

    if-ltz p1, :cond_1

    .line 354
    array-length v2, v0

    if-lt p1, v2, :cond_0

    goto :goto_0

    .line 357
    :cond_0
    aget v0, v0, p1

    goto :goto_1

    :cond_1
    :goto_0
    return v1

    :cond_2
    move v0, p1

    :goto_1
    if-ltz v0, :cond_4

    .line 361
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result v2

    if-lt p1, v2, :cond_3

    goto :goto_2

    :cond_3
    return v0

    :cond_4
    :goto_2
    return v1
.end method

.method public getBookmarks()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/shockwave/pdfium/PdfDocument$Bookmark;",
            ">;"
        }
    .end annotation

    .line 301
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    if-nez v0, :cond_0

    .line 302
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0

    .line 304
    :cond_0
    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    invoke-virtual {v1, v0}, Lcom/shockwave/pdfium/PdfiumCore;->getTableOfContents(Lcom/shockwave/pdfium/PdfDocument;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDocLen(F)F
    .locals 1

    .line 212
    iget v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->documentLength:F

    mul-float v0, v0, p1

    return v0
.end method

.method public getMaxPageHeight()F
    .locals 1

    .line 159
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getMaxPageSize()Lcom/shockwave/pdfium/util/SizeF;

    move-result-object v0

    invoke-virtual {v0}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result v0

    return v0
.end method

.method public getMaxPageSize()Lcom/shockwave/pdfium/util/SizeF;
    .locals 1

    .line 151
    iget-boolean v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->isVertical:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->maxWidthPageSize:Lcom/shockwave/pdfium/util/SizeF;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->maxHeightPageSize:Lcom/shockwave/pdfium/util/SizeF;

    :goto_0
    return-object v0
.end method

.method public getMaxPageWidth()F
    .locals 1

    .line 155
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getMaxPageSize()Lcom/shockwave/pdfium/util/SizeF;

    move-result-object v0

    invoke-virtual {v0}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result v0

    return v0
.end method

.method public getMetaData()Lcom/shockwave/pdfium/PdfDocument$Meta;
    .locals 2

    .line 294
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 297
    :cond_0
    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    invoke-virtual {v1, v0}, Lcom/shockwave/pdfium/PdfiumCore;->getDocumentMeta(Lcom/shockwave/pdfium/PdfDocument;)Lcom/shockwave/pdfium/PdfDocument$Meta;

    move-result-object v0

    return-object v0
.end method

.method public getPageAtOffset(FF)I
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 251
    :goto_0
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPagesCount()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 252
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageOffsets:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    mul-float v3, v3, p2

    invoke-virtual {p0, v1, p2}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPageSpacing(IF)F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    sub-float/2addr v3, v4

    cmpl-float v3, v3, p1

    if-ltz v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_2

    move v0, v2

    :cond_2
    return v0
.end method

.method public getPageLength(IF)F
    .locals 1

    .line 219
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPageSize(I)Lcom/shockwave/pdfium/util/SizeF;

    move-result-object p1

    .line 220
    iget-boolean v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->isVertical:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result p1

    :goto_0
    mul-float p1, p1, p2

    return p1
.end method

.method public getPageLinks(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/shockwave/pdfium/PdfDocument$Link;",
            ">;"
        }
    .end annotation

    .line 308
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->documentPage(I)I

    move-result p1

    .line 309
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    invoke-virtual {v0, v1, p1}, Lcom/shockwave/pdfium/PdfiumCore;->getPageLinks(Lcom/shockwave/pdfium/PdfDocument;I)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getPageOffset(IF)F
    .locals 1

    .line 230
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->documentPage(I)I

    move-result v0

    if-gez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageOffsets:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    mul-float p1, p1, p2

    return p1
.end method

.method public getPageSize(I)Lcom/shockwave/pdfium/util/SizeF;
    .locals 1

    .line 133
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->documentPage(I)I

    move-result v0

    if-gez v0, :cond_0

    .line 135
    new-instance p1, Lcom/shockwave/pdfium/util/SizeF;

    const/4 v0, 0x0

    invoke-direct {p1, v0, v0}, Lcom/shockwave/pdfium/util/SizeF;-><init>(FF)V

    return-object p1

    .line 137
    :cond_0
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSizes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/shockwave/pdfium/util/SizeF;

    return-object p1
.end method

.method public getPageSpacing(IF)F
    .locals 1

    .line 224
    iget-boolean v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->autoSpacing:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSpacing:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->spacingPx:I

    int-to-float p1, p1

    :goto_0
    mul-float p1, p1, p2

    return p1
.end method

.method public getPagesCount()I
    .locals 1

    .line 129
    iget v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pagesCount:I

    return v0
.end method

.method public getScaledPageSize(IF)Lcom/shockwave/pdfium/util/SizeF;
    .locals 2

    .line 141
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPageSize(I)Lcom/shockwave/pdfium/util/SizeF;

    move-result-object p1

    .line 142
    new-instance v0, Lcom/shockwave/pdfium/util/SizeF;

    invoke-virtual {p1}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result v1

    mul-float v1, v1, p2

    invoke-virtual {p1}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result p1

    mul-float p1, p1, p2

    invoke-direct {v0, v1, p1}, Lcom/shockwave/pdfium/util/SizeF;-><init>(FF)V

    return-object v0
.end method

.method public getSecondaryPageOffset(IF)F
    .locals 2

    .line 239
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->getPageSize(I)Lcom/shockwave/pdfium/util/SizeF;

    move-result-object p1

    .line 240
    iget-boolean v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->isVertical:Z

    const/high16 v1, 0x40000000    # 2.0f

    if-eqz v0, :cond_0

    .line 241
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getMaxPageWidth()F

    move-result v0

    .line 242
    invoke-virtual {p1}, Lcom/shockwave/pdfium/util/SizeF;->getWidth()F

    move-result p1

    :goto_0
    sub-float/2addr v0, p1

    mul-float p2, p2, v0

    div-float/2addr p2, v1

    return p2

    .line 244
    :cond_0
    invoke-virtual {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->getMaxPageHeight()F

    move-result v0

    .line 245
    invoke-virtual {p1}, Lcom/shockwave/pdfium/util/SizeF;->getHeight()F

    move-result p1

    goto :goto_0
.end method

.method public mapRectToDevice(IIIIILandroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 9

    .line 314
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->documentPage(I)I

    move-result v2

    .line 315
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    const/4 v7, 0x0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move-object v8, p6

    invoke-virtual/range {v0 .. v8}, Lcom/shockwave/pdfium/PdfiumCore;->mapRectToDevice(Lcom/shockwave/pdfium/PdfDocument;IIIIIILandroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object p1

    return-object p1
.end method

.method public openPage(I)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/barteksc/pdfviewer/exception/PageRenderingException;
        }
    .end annotation

    .line 262
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->documentPage(I)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_0

    return v1

    .line 267
    :cond_0
    sget-object v2, Lcom/github/barteksc/pdfviewer/PdfFile;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 268
    :try_start_0
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->openedPages:Landroid/util/SparseBooleanArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gez v3, :cond_1

    .line 270
    :try_start_1
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    invoke-virtual {v3, v4, v0}, Lcom/shockwave/pdfium/PdfiumCore;->openPage(Lcom/shockwave/pdfium/PdfDocument;I)J

    .line 271
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->openedPages:Landroid/util/SparseBooleanArray;

    const/4 v4, 0x1

    invoke-virtual {v3, v0, v4}, Landroid/util/SparseBooleanArray;->put(IZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 272
    :try_start_2
    monitor-exit v2

    return v4

    :catch_0
    move-exception v3

    .line 274
    iget-object v4, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->openedPages:Landroid/util/SparseBooleanArray;

    invoke-virtual {v4, v0, v1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 275
    new-instance v0, Lcom/github/barteksc/pdfviewer/exception/PageRenderingException;

    invoke-direct {v0, p1, v3}, Lcom/github/barteksc/pdfviewer/exception/PageRenderingException;-><init>(ILjava/lang/Throwable;)V

    throw v0

    .line 278
    :cond_1
    monitor-exit v2

    return v1

    :catchall_0
    move-exception p1

    .line 279
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public pageHasError(I)Z
    .locals 2

    .line 283
    invoke-virtual {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->documentPage(I)I

    move-result p1

    .line 284
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->openedPages:Landroid/util/SparseBooleanArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public recalculatePageSizes(Lcom/shockwave/pdfium/util/Size;)V
    .locals 4

    .line 112
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSizes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 113
    new-instance v0, Lcom/github/barteksc/pdfviewer/util/PageSizeCalculator;

    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageFitPolicy:Lcom/github/barteksc/pdfviewer/util/FitPolicy;

    iget-object v2, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalMaxWidthPageSize:Lcom/shockwave/pdfium/util/Size;

    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalMaxHeightPageSize:Lcom/shockwave/pdfium/util/Size;

    invoke-direct {v0, v1, v2, v3, p1}, Lcom/github/barteksc/pdfviewer/util/PageSizeCalculator;-><init>(Lcom/github/barteksc/pdfviewer/util/FitPolicy;Lcom/shockwave/pdfium/util/Size;Lcom/shockwave/pdfium/util/Size;Lcom/shockwave/pdfium/util/Size;)V

    .line 115
    invoke-virtual {v0}, Lcom/github/barteksc/pdfviewer/util/PageSizeCalculator;->getOptimalMaxWidthPageSize()Lcom/shockwave/pdfium/util/SizeF;

    move-result-object v1

    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->maxWidthPageSize:Lcom/shockwave/pdfium/util/SizeF;

    .line 116
    invoke-virtual {v0}, Lcom/github/barteksc/pdfviewer/util/PageSizeCalculator;->getOptimalMaxHeightPageSize()Lcom/shockwave/pdfium/util/SizeF;

    move-result-object v1

    iput-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->maxHeightPageSize:Lcom/shockwave/pdfium/util/SizeF;

    .line 118
    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->originalPageSizes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/shockwave/pdfium/util/Size;

    .line 119
    iget-object v3, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pageSizes:Ljava/util/List;

    invoke-virtual {v0, v2}, Lcom/github/barteksc/pdfviewer/util/PageSizeCalculator;->calculate(Lcom/shockwave/pdfium/util/Size;)Lcom/shockwave/pdfium/util/SizeF;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 121
    :cond_0
    iget-boolean v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->autoSpacing:Z

    if-eqz v0, :cond_1

    .line 122
    invoke-direct {p0, p1}, Lcom/github/barteksc/pdfviewer/PdfFile;->prepareAutoSpacing(Lcom/shockwave/pdfium/util/Size;)V

    .line 124
    :cond_1
    invoke-direct {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->prepareDocLen()V

    .line 125
    invoke-direct {p0}, Lcom/github/barteksc/pdfviewer/PdfFile;->preparePagesOffset()V

    return-void
.end method

.method public renderPageBitmap(Landroid/graphics/Bitmap;ILandroid/graphics/Rect;Z)V
    .locals 9

    .line 288
    invoke-virtual {p0, p2}, Lcom/github/barteksc/pdfviewer/PdfFile;->documentPage(I)I

    move-result v3

    .line 289
    iget-object v0, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfiumCore:Lcom/shockwave/pdfium/PdfiumCore;

    iget-object v1, p0, Lcom/github/barteksc/pdfviewer/PdfFile;->pdfDocument:Lcom/shockwave/pdfium/PdfDocument;

    iget v4, p3, Landroid/graphics/Rect;->left:I

    iget v5, p3, Landroid/graphics/Rect;->top:I

    .line 290
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v6

    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result v7

    move-object v2, p1

    move v8, p4

    .line 289
    invoke-virtual/range {v0 .. v8}, Lcom/shockwave/pdfium/PdfiumCore;->renderPageBitmap(Lcom/shockwave/pdfium/PdfDocument;Landroid/graphics/Bitmap;IIIIIZ)V

    return-void
.end method
