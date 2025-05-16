.class public Lcom/jzxiang/pickerview/data/source/TimeRepository;
.super Ljava/lang/Object;
.source "TimeRepository.java"

# interfaces
.implements Lcom/jzxiang/pickerview/data/source/TimeDataSource;


# instance fields
.field mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

.field mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

.field mIsMaxNoRange:Z

.field mIsMinNoRange:Z

.field mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;


# direct methods
.method public constructor <init>(Lcom/jzxiang/pickerview/config/PickerConfig;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    .line 21
    iget-object v0, p1, Lcom/jzxiang/pickerview/config/PickerConfig;->mMinCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iput-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    .line 22
    iget-object p1, p1, Lcom/jzxiang/pickerview/config/PickerConfig;->mMaxCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iput-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    .line 24
    iget-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    invoke-virtual {p1}, Lcom/jzxiang/pickerview/data/WheelCalendar;->isNoRange()Z

    move-result p1

    iput-boolean p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMinNoRange:Z

    .line 25
    iget-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    invoke-virtual {p1}, Lcom/jzxiang/pickerview/data/WheelCalendar;->isNoRange()Z

    move-result p1

    iput-boolean p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMaxNoRange:Z

    return-void
.end method


# virtual methods
.method public getDefaultCalendar()Lcom/jzxiang/pickerview/data/WheelCalendar;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v0, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mCurrentCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

    return-object v0
.end method

.method public getMaxDay(II)I
    .locals 5

    .line 70
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMaxNoRange:Z

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    new-array v3, v1, [I

    const/4 v4, 0x0

    aput p1, v3, v4

    aput p2, v3, v2

    invoke-static {v0, v3}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    iget-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget p1, p1, Lcom/jzxiang/pickerview/data/WheelCalendar;->day:I

    return p1

    .line 73
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 74
    invoke-virtual {v0, v2, p1}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x5

    .line 75
    invoke-virtual {v0, p1, v2}, Ljava/util/Calendar;->set(II)V

    sub-int/2addr p2, v2

    .line 76
    invoke-virtual {v0, v1, p2}, Ljava/util/Calendar;->set(II)V

    .line 78
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result p1

    return p1
.end method

.method public getMaxHour(III)I
    .locals 3

    .line 91
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMaxNoRange:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v1, 0x3

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 p1, 0x1

    aput p2, v1, p1

    const/4 p1, 0x2

    aput p3, v1, p1

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 92
    iget-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget p1, p1, Lcom/jzxiang/pickerview/data/WheelCalendar;->hour:I

    return p1

    :cond_0
    const/16 p1, 0x17

    return p1
.end method

.method public getMaxMinute(IIII)I
    .locals 3

    .line 107
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMaxNoRange:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v1, 0x4

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 p1, 0x1

    aput p2, v1, p1

    const/4 p1, 0x2

    aput p3, v1, p1

    const/4 p1, 0x3

    aput p4, v1, p1

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 108
    iget-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget p1, p1, Lcom/jzxiang/pickerview/data/WheelCalendar;->minute:I

    return p1

    :cond_0
    const/16 p1, 0x3b

    return p1
.end method

.method public getMaxMonth(I)I
    .locals 3

    .line 54
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMaxNoRange:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 55
    iget-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget p1, p1, Lcom/jzxiang/pickerview/data/WheelCalendar;->month:I

    return p1

    :cond_0
    const/16 p1, 0xc

    return p1
.end method

.method public getMaxYear()I
    .locals 1

    .line 38
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMaxNoRange:Z

    if-eqz v0, :cond_0

    .line 39
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinYear()I

    move-result v0

    add-int/lit8 v0, v0, 0x32

    return v0

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMax:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget v0, v0, Lcom/jzxiang/pickerview/data/WheelCalendar;->year:I

    return v0
.end method

.method public getMinDay(II)I
    .locals 4

    .line 62
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMinNoRange:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput p1, v2, v3

    aput p2, v2, v1

    invoke-static {v0, v2}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 63
    iget-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget p1, p1, Lcom/jzxiang/pickerview/data/WheelCalendar;->day:I

    return p1

    :cond_0
    return v1
.end method

.method public getMinHour(III)I
    .locals 3

    .line 83
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMinNoRange:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v2, 0x3

    new-array v2, v2, [I

    aput p1, v2, v1

    const/4 p1, 0x1

    aput p2, v2, p1

    const/4 p1, 0x2

    aput p3, v2, p1

    invoke-static {v0, v2}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 84
    iget-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget p1, p1, Lcom/jzxiang/pickerview/data/WheelCalendar;->hour:I

    return p1

    :cond_0
    return v1
.end method

.method public getMinMinute(IIII)I
    .locals 3

    .line 99
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMinNoRange:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v2, 0x4

    new-array v2, v2, [I

    aput p1, v2, v1

    const/4 p1, 0x1

    aput p2, v2, p1

    const/4 p2, 0x2

    aput p3, v2, p2

    const/4 p2, 0x3

    aput p4, v2, p2

    invoke-static {v0, v2}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 100
    iget-object p2, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget p2, p2, Lcom/jzxiang/pickerview/data/WheelCalendar;->minute:I

    add-int/2addr p2, p1

    return p2

    :cond_0
    return v1
.end method

.method public getMinMonth(I)I
    .locals 4

    .line 46
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMinNoRange:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    new-array v2, v1, [I

    const/4 v3, 0x0

    aput p1, v2, v3

    invoke-static {v0, v2}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 47
    iget-object p1, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget p1, p1, Lcom/jzxiang/pickerview/data/WheelCalendar;->month:I

    return p1

    :cond_0
    return v1
.end method

.method public getMinYear()I
    .locals 1

    .line 30
    iget-boolean v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mIsMinNoRange:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x7df

    return v0

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    iget v0, v0, Lcom/jzxiang/pickerview/data/WheelCalendar;->year:I

    return v0
.end method

.method public isMinDay(III)Z
    .locals 3

    .line 125
    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v1, 0x3

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 p1, 0x1

    aput p2, v1, p1

    const/4 p1, 0x2

    aput p3, v1, p1

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    return p1
.end method

.method public isMinHour(IIII)Z
    .locals 3

    .line 130
    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v1, 0x4

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 p1, 0x1

    aput p2, v1, p1

    const/4 p1, 0x2

    aput p3, v1, p1

    const/4 p1, 0x3

    aput p4, v1, p1

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    return p1
.end method

.method public isMinMonth(II)Z
    .locals 3

    .line 120
    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v1, 0x2

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 p1, 0x1

    aput p2, v1, p1

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    return p1
.end method

.method public isMinYear(I)Z
    .locals 3

    .line 115
    iget-object v0, p0, Lcom/jzxiang/pickerview/data/source/TimeRepository;->mCalendarMin:Lcom/jzxiang/pickerview/data/WheelCalendar;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/utils/Utils;->isTimeEquals(Lcom/jzxiang/pickerview/data/WheelCalendar;[I)Z

    move-result p1

    return p1
.end method
