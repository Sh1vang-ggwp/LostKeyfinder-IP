.class final enum Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;
.super Ljava/lang/Enum;
.source "PDFView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/barteksc/pdfviewer/PDFView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ScrollDir"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

.field public static final enum END:Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

.field public static final enum NONE:Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

.field public static final enum START:Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 111
    new-instance v0, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;->NONE:Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    new-instance v1, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    const-string v3, "START"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;->START:Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    new-instance v3, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    const-string v5, "END"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;->END:Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 110
    sput-object v5, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;->$VALUES:[Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 110
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;
    .locals 1

    .line 110
    const-class v0, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    return-object p0
.end method

.method public static values()[Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;
    .locals 1

    .line 110
    sget-object v0, Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;->$VALUES:[Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    invoke-virtual {v0}, [Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/barteksc/pdfviewer/PDFView$ScrollDir;

    return-object v0
.end method
