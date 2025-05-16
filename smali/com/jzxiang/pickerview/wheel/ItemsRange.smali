.class public Lcom/jzxiang/pickerview/wheel/ItemsRange;
.super Ljava/lang/Object;
.source "ItemsRange.java"


# instance fields
.field private count:I

.field private first:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, v0, v0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput p1, p0, Lcom/jzxiang/pickerview/wheel/ItemsRange;->first:I

    .line 47
    iput p2, p0, Lcom/jzxiang/pickerview/wheel/ItemsRange;->count:I

    return-void
.end method


# virtual methods
.method public contains(I)Z
    .locals 1

    .line 84
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getFirst()I

    move-result v0

    if-lt p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getLast()I

    move-result v0

    if-gt p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getCount()I
    .locals 1

    .line 74
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/ItemsRange;->count:I

    return v0
.end method

.method public getFirst()I
    .locals 1

    .line 56
    iget v0, p0, Lcom/jzxiang/pickerview/wheel/ItemsRange;->first:I

    return v0
.end method

.method public getLast()I
    .locals 2

    .line 65
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getFirst()I

    move-result v0

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/wheel/ItemsRange;->getCount()I

    move-result v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    return v0
.end method
