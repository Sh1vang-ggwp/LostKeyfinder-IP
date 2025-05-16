.class public Lcom/jzxiang/pickerview/data/WheelCalendar;
.super Ljava/lang/Object;
.source "WheelCalendar.java"


# instance fields
.field public day:I

.field public hour:I

.field public minute:I

.field public month:I

.field private noRange:Z

.field public year:I


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/jzxiang/pickerview/data/WheelCalendar;->initData(J)V

    return-void
.end method

.method private initData(J)V
    .locals 4

    const/4 v0, 0x1

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-nez v3, :cond_0

    .line 20
    iput-boolean v0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->noRange:Z

    return-void

    .line 23
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ljava/util/Calendar;->clear()V

    .line 25
    invoke-virtual {v1, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 27
    invoke-virtual {v1, v0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    iput p1, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->year:I

    const/4 p1, 0x2

    .line 28
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    add-int/2addr p1, v0

    iput p1, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->month:I

    const/4 p1, 0x5

    .line 29
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    iput p1, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->day:I

    const/16 p1, 0xb

    .line 30
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    iput p1, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->hour:I

    const/16 p1, 0xc

    .line 31
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    iput p1, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->minute:I

    return-void
.end method


# virtual methods
.method public isNoRange()Z
    .locals 1

    .line 35
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/WheelCalendar;->noRange:Z

    return v0
.end method
