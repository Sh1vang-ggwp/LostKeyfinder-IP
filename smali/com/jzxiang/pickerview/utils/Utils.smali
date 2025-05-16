.class public Lcom/jzxiang/pickerview/utils/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs hideViews([Landroid/view/View;)V
    .locals 3

    const/4 v0, 0x0

    .line 33
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 34
    aget-object v1, p0, v0

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static varargs isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z
    .locals 6

    .line 13
    array-length v0, p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_6

    const/4 v3, 0x2

    if-eq v0, v3, :cond_4

    const/4 v4, 0x3

    if-eq v0, v4, :cond_2

    const/4 v5, 0x4

    if-eq v0, v5, :cond_0

    return v2

    .line 24
    :cond_0
    iget v0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->year:I

    aget v5, p1, v2

    if-ne v0, v5, :cond_1

    iget v0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->month:I

    aget v5, p1, v1

    if-ne v0, v5, :cond_1

    iget v0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->day:I

    aget v3, p1, v3

    if-ne v0, v3, :cond_1

    iget p0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->hour:I

    aget p1, p1, v4

    if-ne p0, p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 20
    :cond_2
    iget v0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->year:I

    aget v4, p1, v2

    if-ne v0, v4, :cond_3

    iget v0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->month:I

    aget v4, p1, v1

    if-ne v0, v4, :cond_3

    iget p0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->day:I

    aget p1, p1, v3

    if-ne p0, p1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    return v1

    .line 17
    :cond_4
    iget v0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->year:I

    aget v3, p1, v2

    if-ne v0, v3, :cond_5

    iget p0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->month:I

    aget p1, p1, v1

    if-ne p0, p1, :cond_5

    goto :goto_2

    :cond_5
    const/4 v1, 0x0

    :goto_2
    return v1

    .line 15
    :cond_6
    iget p0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->year:I

    aget p1, p1, v2

    if-ne p0, p1, :cond_7

    goto :goto_3

    :cond_7
    const/4 v1, 0x0

    :goto_3
    return v1
.end method
