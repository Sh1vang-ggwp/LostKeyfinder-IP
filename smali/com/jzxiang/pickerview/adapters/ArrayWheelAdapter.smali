.class public Lcom/jzxiang/pickerview/adapters/ArrayWheelAdapter;
.super Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;
.source "ArrayWheelAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;"
    }
.end annotation


# instance fields
.field private items:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;[Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[TT;)V"
        }
    .end annotation

    .line 37
    invoke-direct {p0, p1}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;-><init>(Landroid/content/Context;)V

    .line 40
    iput-object p2, p0, Lcom/jzxiang/pickerview/adapters/ArrayWheelAdapter;->items:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getItemText(I)Ljava/lang/CharSequence;
    .locals 2

    if-ltz p1, :cond_1

    .line 45
    iget-object v0, p0, Lcom/jzxiang/pickerview/adapters/ArrayWheelAdapter;->items:[Ljava/lang/Object;

    array-length v1, v0

    if-ge p1, v1, :cond_1

    .line 46
    aget-object p1, v0, p1

    .line 47
    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    .line 48
    check-cast p1, Ljava/lang/CharSequence;

    return-object p1

    .line 50
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemsCount()I
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/jzxiang/pickerview/adapters/ArrayWheelAdapter;->items:[Ljava/lang/Object;

    array-length v0, v0

    return v0
.end method
