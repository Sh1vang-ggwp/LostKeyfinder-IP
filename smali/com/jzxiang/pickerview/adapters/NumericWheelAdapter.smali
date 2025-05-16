.class public Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;
.super Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;
.source "NumericWheelAdapter.java"


# static fields
.field public static final DEFAULT_MAX_VALUE:I = 0x9

.field private static final DEFAULT_MIN_VALUE:I


# instance fields
.field private format:Ljava/lang/String;

.field private maxValue:I

.field private minValue:I

.field private unit:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    const/16 v1, 0x9

    .line 53
    invoke-direct {p0, p1, v0, v1}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;-><init>(Landroid/content/Context;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/String;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    .line 76
    invoke-direct/range {v0 .. v5}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 89
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;-><init>(Landroid/content/Context;)V

    .line 90
    iput p2, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->minValue:I

    .line 91
    iput p3, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->maxValue:I

    .line 92
    iput-object p4, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->format:Ljava/lang/String;

    .line 93
    iput-object p5, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->unit:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getItemText(I)Ljava/lang/CharSequence;
    .locals 3

    if-ltz p1, :cond_2

    .line 98
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->getItemsCount()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 99
    iget v0, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->minValue:I

    add-int/2addr v0, p1

    .line 100
    iget-object p1, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->format:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->format:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v2

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    .line 101
    :goto_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->unit:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->unit:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_1
    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemsCount()I
    .locals 2

    .line 110
    iget v0, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->maxValue:I

    iget v1, p0, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->minValue:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method
