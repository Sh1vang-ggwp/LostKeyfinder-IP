.class public Lcom/jzxiang/pickerview/TimeWheel;
.super Ljava/lang/Object;
.source "TimeWheel.java"


# instance fields
.field day:Lcom/jzxiang/pickerview/wheel/WheelView;

.field dayListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

.field hour:Lcom/jzxiang/pickerview/wheel/WheelView;

.field mContext:Landroid/content/Context;

.field mDayAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

.field mHourAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

.field mMinuteAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

.field mMonthAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

.field mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

.field mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

.field mYearAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

.field minute:Lcom/jzxiang/pickerview/wheel/WheelView;

.field minuteListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

.field month:Lcom/jzxiang/pickerview/wheel/WheelView;

.field monthListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

.field year:Lcom/jzxiang/pickerview/wheel/WheelView;

.field yearListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/jzxiang/pickerview/config/PickerConfig;)V
    .locals 1

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/jzxiang/pickerview/TimeWheel$1;

    invoke-direct {v0, p0}, Lcom/jzxiang/pickerview/TimeWheel$1;-><init>(Lcom/jzxiang/pickerview/TimeWheel;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->yearListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    .line 33
    new-instance v0, Lcom/jzxiang/pickerview/TimeWheel$2;

    invoke-direct {v0, p0}, Lcom/jzxiang/pickerview/TimeWheel$2;-><init>(Lcom/jzxiang/pickerview/TimeWheel;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->monthListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    .line 39
    new-instance v0, Lcom/jzxiang/pickerview/TimeWheel$3;

    invoke-direct {v0, p0}, Lcom/jzxiang/pickerview/TimeWheel$3;-><init>(Lcom/jzxiang/pickerview/TimeWheel;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->dayListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    .line 45
    new-instance v0, Lcom/jzxiang/pickerview/TimeWheel$4;

    invoke-direct {v0, p0}, Lcom/jzxiang/pickerview/TimeWheel$4;-><init>(Lcom/jzxiang/pickerview/TimeWheel;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minuteListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    .line 53
    iput-object p2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    .line 55
    new-instance v0, Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-direct {v0, p2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;-><init>(Lcom/jzxiang/pickerview/config/PickerConfig;)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mContext:Landroid/content/Context;

    .line 57
    invoke-virtual {p0, p1}, Lcom/jzxiang/pickerview/TimeWheel;->initialize(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public getCurrentDay()I
    .locals 4

    .line 254
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 255
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    .line 256
    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->getCurrentItem()I

    move-result v2

    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v3, v0, v1}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinDay(II)I

    move-result v0

    add-int/2addr v2, v0

    return v2
.end method

.method public getCurrentHour()I
    .locals 5

    .line 260
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 261
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    .line 262
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentDay()I

    move-result v2

    .line 263
    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v3}, Lcom/jzxiang/pickerview/wheel/WheelView;->getCurrentItem()I

    move-result v3

    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v4, v0, v1, v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinHour(III)I

    move-result v0

    add-int/2addr v3, v0

    return v3
.end method

.method public getCurrentMinute()I
    .locals 6

    .line 267
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 268
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    .line 269
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentDay()I

    move-result v2

    .line 270
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentHour()I

    move-result v3

    .line 272
    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v4}, Lcom/jzxiang/pickerview/wheel/WheelView;->getCurrentItem()I

    move-result v4

    iget-object v5, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v5, v0, v1, v2, v3}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinMinute(IIII)I

    move-result v0

    add-int/2addr v4, v0

    return v4
.end method

.method public getCurrentMonth()I
    .locals 3

    .line 249
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 250
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->getCurrentItem()I

    move-result v1

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2, v0}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinMonth(I)I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public getCurrentYear()I
    .locals 2

    .line 245
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getCurrentItem()I

    move-result v0

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinYear()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method initDay()V
    .locals 3

    .line 129
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->updateDays()V

    .line 130
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 131
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    .line 133
    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2, v0, v1}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinDay(II)I

    move-result v0

    .line 134
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getDefaultCalendar()Lcom/jzxiang/pickerview/data/WheelCalendar;

    move-result-object v2

    iget v2, v2, Lcom/jzxiang/pickerview/data/WheelCalendar;->day:I

    sub-int/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(I)V

    .line 135
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-boolean v1, v1, Lcom/jzxiang/pickerview/config/PickerConfig;->cyclic:Z

    invoke-virtual {v0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCyclic(Z)V

    return-void
.end method

.method initHour()V
    .locals 4

    .line 139
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->updateHours()V

    .line 140
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 141
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    .line 142
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentDay()I

    move-result v2

    .line 144
    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v3, v0, v1, v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinHour(III)I

    move-result v0

    .line 145
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getDefaultCalendar()Lcom/jzxiang/pickerview/data/WheelCalendar;

    move-result-object v2

    iget v2, v2, Lcom/jzxiang/pickerview/data/WheelCalendar;->hour:I

    sub-int/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(I)V

    .line 146
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-boolean v1, v1, Lcom/jzxiang/pickerview/config/PickerConfig;->cyclic:Z

    invoke-virtual {v0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCyclic(Z)V

    return-void
.end method

.method initMinute()V
    .locals 5

    .line 150
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->updateMinutes()V

    .line 151
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 152
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    .line 153
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentDay()I

    move-result v2

    .line 154
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentHour()I

    move-result v3

    .line 155
    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinMinute(IIII)I

    move-result v0

    .line 157
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getDefaultCalendar()Lcom/jzxiang/pickerview/data/WheelCalendar;

    move-result-object v2

    iget v2, v2, Lcom/jzxiang/pickerview/data/WheelCalendar;->minute:I

    sub-int/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(I)V

    .line 158
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-boolean v1, v1, Lcom/jzxiang/pickerview/config/PickerConfig;->cyclic:Z

    invoke-virtual {v0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCyclic(Z)V

    return-void
.end method

.method initMonth()V
    .locals 3

    .line 121
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->updateMonths()V

    .line 122
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 123
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v1, v0}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinMonth(I)I

    move-result v0

    .line 124
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getDefaultCalendar()Lcom/jzxiang/pickerview/data/WheelCalendar;

    move-result-object v2

    iget v2, v2, Lcom/jzxiang/pickerview/data/WheelCalendar;->month:I

    sub-int/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(I)V

    .line 125
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-boolean v1, v1, Lcom/jzxiang/pickerview/config/PickerConfig;->cyclic:Z

    invoke-virtual {v0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCyclic(Z)V

    return-void
.end method

.method initView(Landroid/view/View;)V
    .locals 6

    .line 71
    sget v0, Lcom/jzxiang/pickerview/R$id;->year:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/jzxiang/pickerview/wheel/WheelView;

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    .line 72
    sget v0, Lcom/jzxiang/pickerview/R$id;->month:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/jzxiang/pickerview/wheel/WheelView;

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    .line 73
    sget v0, Lcom/jzxiang/pickerview/R$id;->day:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/jzxiang/pickerview/wheel/WheelView;

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    .line 74
    sget v0, Lcom/jzxiang/pickerview/R$id;->hour:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/jzxiang/pickerview/wheel/WheelView;

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    .line 75
    sget v0, Lcom/jzxiang/pickerview/R$id;->minute:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/jzxiang/pickerview/wheel/WheelView;

    iput-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    .line 77
    sget-object p1, Lcom/jzxiang/pickerview/TimeWheel$5;->$SwitchMap$com$jzxiang$pickerview$data$Type:[I

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v0, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mType:Lcom/jzxiang/pickerview/data/Type;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/data/Type;->ordinal()I

    move-result v0

    aget p1, p1, v0

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eq p1, v2, :cond_4

    const/4 v3, 0x3

    if-eq p1, v3, :cond_3

    const/4 v4, 0x4

    if-eq p1, v4, :cond_2

    const/4 v5, 0x5

    if-eq p1, v5, :cond_1

    const/4 v5, 0x6

    if-eq p1, v5, :cond_0

    goto :goto_0

    :cond_0
    new-array p1, v4, [Landroid/view/View;

    .line 94
    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v4, p1, v1

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v1, p1, v0

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v0, p1, v2

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v0, p1, v3

    invoke-static {p1}, Lcom/jzxiang/pickerview/utils/Utils;->hideViews([Landroid/view/View;)V

    goto :goto_0

    :cond_1
    new-array p1, v3, [Landroid/view/View;

    .line 91
    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v3, p1, v1

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v1, p1, v0

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v0, p1, v2

    invoke-static {p1}, Lcom/jzxiang/pickerview/utils/Utils;->hideViews([Landroid/view/View;)V

    goto :goto_0

    :cond_2
    new-array p1, v0, [Landroid/view/View;

    .line 88
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v0, p1, v1

    invoke-static {p1}, Lcom/jzxiang/pickerview/utils/Utils;->hideViews([Landroid/view/View;)V

    goto :goto_0

    :cond_3
    new-array p1, v3, [Landroid/view/View;

    .line 85
    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v3, p1, v1

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v1, p1, v0

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v0, p1, v2

    invoke-static {p1}, Lcom/jzxiang/pickerview/utils/Utils;->hideViews([Landroid/view/View;)V

    goto :goto_0

    :cond_4
    new-array p1, v2, [Landroid/view/View;

    .line 82
    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v2, p1, v1

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    aput-object v1, p1, v0

    invoke-static {p1}, Lcom/jzxiang/pickerview/utils/Utils;->hideViews([Landroid/view/View;)V

    .line 98
    :goto_0
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->yearListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    .line 99
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->monthListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    .line 100
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->dayListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    .line 101
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minuteListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    .line 102
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->monthListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    .line 103
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->dayListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    .line 104
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minuteListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    .line 105
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->dayListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    .line 106
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minuteListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    .line 107
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minuteListener:Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;

    invoke-virtual {p1, v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->addChangingListener(Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;)V

    return-void
.end method

.method initYear()V
    .locals 8

    .line 111
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinYear()I

    move-result v0

    .line 112
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMaxYear()I

    move-result v4

    .line 114
    new-instance v7, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v6, v1, Lcom/jzxiang/pickerview/config/PickerConfig;->mYear:Ljava/lang/String;

    const-string v5, "%02d"

    move-object v1, v7

    move v3, v0

    invoke-direct/range {v1 .. v6}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    iput-object v7, p0, Lcom/jzxiang/pickerview/TimeWheel;->mYearAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    .line 115
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-virtual {v7, v1}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->setConfig(Lcom/jzxiang/pickerview/config/PickerConfig;)V

    .line 116
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mYearAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    invoke-virtual {v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->setViewAdapter(Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;)V

    .line 117
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getDefaultCalendar()Lcom/jzxiang/pickerview/data/WheelCalendar;

    move-result-object v2

    iget v2, v2, Lcom/jzxiang/pickerview/data/WheelCalendar;->year:I

    sub-int/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(I)V

    return-void
.end method

.method public initialize(Landroid/view/View;)V
    .locals 0

    .line 61
    invoke-virtual {p0, p1}, Lcom/jzxiang/pickerview/TimeWheel;->initView(Landroid/view/View;)V

    .line 62
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->initYear()V

    .line 63
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->initMonth()V

    .line 64
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->initDay()V

    .line 65
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->initHour()V

    .line 66
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->initMinute()V

    return-void
.end method

.method updateDays()V
    .locals 10

    .line 179
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    return-void

    .line 182
    :cond_0
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 183
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    .line 185
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    const/4 v3, 0x1

    .line 186
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v4

    iget-object v5, p0, Lcom/jzxiang/pickerview/TimeWheel;->year:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v5}, Lcom/jzxiang/pickerview/wheel/WheelView;->getCurrentItem()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    const/4 v4, 0x2

    .line 187
    invoke-virtual {v2, v4, v1}, Ljava/util/Calendar;->set(II)V

    .line 189
    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2, v0, v1}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMaxDay(II)I

    move-result v7

    .line 190
    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2, v0, v1}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinDay(II)I

    move-result v6

    .line 191
    new-instance v2, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    iget-object v5, p0, Lcom/jzxiang/pickerview/TimeWheel;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v9, v4, Lcom/jzxiang/pickerview/config/PickerConfig;->mDay:Ljava/lang/String;

    const-string v8, "%02d"

    move-object v4, v2

    invoke-direct/range {v4 .. v9}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mDayAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    .line 192
    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-virtual {v2, v4}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->setConfig(Lcom/jzxiang/pickerview/config/PickerConfig;)V

    .line 193
    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mDayAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    invoke-virtual {v2, v4}, Lcom/jzxiang/pickerview/wheel/WheelView;->setViewAdapter(Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;)V

    .line 195
    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v2, v0, v1}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->isMinMonth(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 196
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(IZ)V

    .line 199
    :cond_1
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->mDayAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->getItemsCount()I

    move-result v0

    .line 200
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->getCurrentItem()I

    move-result v1

    if-lt v1, v0, :cond_2

    .line 201
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->day:Lcom/jzxiang/pickerview/wheel/WheelView;

    sub-int/2addr v0, v3

    invoke-virtual {v1, v0, v3}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(IZ)V

    :cond_2
    return-void
.end method

.method updateHours()V
    .locals 10

    .line 206
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    return-void

    .line 209
    :cond_0
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 210
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    .line 211
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentDay()I

    move-result v2

    .line 213
    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v3, v0, v1, v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinHour(III)I

    move-result v6

    .line 214
    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v3, v0, v1, v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMaxHour(III)I

    move-result v7

    .line 216
    new-instance v3, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    iget-object v5, p0, Lcom/jzxiang/pickerview/TimeWheel;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v9, v4, Lcom/jzxiang/pickerview/config/PickerConfig;->mHour:Ljava/lang/String;

    const-string v8, "%02d"

    move-object v4, v3

    invoke-direct/range {v4 .. v9}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->mHourAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    .line 217
    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-virtual {v3, v4}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->setConfig(Lcom/jzxiang/pickerview/config/PickerConfig;)V

    .line 218
    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mHourAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    invoke-virtual {v3, v4}, Lcom/jzxiang/pickerview/wheel/WheelView;->setViewAdapter(Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;)V

    .line 220
    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v3, v0, v1, v2}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->isMinDay(III)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 221
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->hour:Lcom/jzxiang/pickerview/wheel/WheelView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(IZ)V

    :cond_1
    return-void
.end method

.method updateMinutes()V
    .locals 11

    .line 225
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    return-void

    .line 228
    :cond_0
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 229
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    .line 230
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentDay()I

    move-result v2

    .line 231
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentHour()I

    move-result v3

    .line 233
    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinMinute(IIII)I

    move-result v7

    .line 234
    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMaxMinute(IIII)I

    move-result v8

    .line 236
    new-instance v4, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    iget-object v6, p0, Lcom/jzxiang/pickerview/TimeWheel;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v10, v5, Lcom/jzxiang/pickerview/config/PickerConfig;->mMinute:Ljava/lang/String;

    const-string v9, "%02d"

    move-object v5, v4

    invoke-direct/range {v5 .. v10}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    iput-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mMinuteAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    .line 237
    iget-object v5, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-virtual {v4, v5}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->setConfig(Lcom/jzxiang/pickerview/config/PickerConfig;)V

    .line 238
    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v5, p0, Lcom/jzxiang/pickerview/TimeWheel;->mMinuteAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    invoke-virtual {v4, v5}, Lcom/jzxiang/pickerview/wheel/WheelView;->setViewAdapter(Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;)V

    .line 240
    iget-object v4, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->isMinHour(IIII)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 241
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->minute:Lcom/jzxiang/pickerview/wheel/WheelView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(IZ)V

    :cond_1
    return-void
.end method

.method updateMonths()V
    .locals 8

    .line 163
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    return-void

    .line 166
    :cond_0
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v0

    .line 167
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v1, v0}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMinMonth(I)I

    move-result v4

    .line 168
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v1, v0}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->getMaxMonth(I)I

    move-result v5

    .line 169
    new-instance v1, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    iget-object v3, p0, Lcom/jzxiang/pickerview/TimeWheel;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v7, v2, Lcom/jzxiang/pickerview/config/PickerConfig;->mMonth:Ljava/lang/String;

    const-string v6, "%02d"

    move-object v2, v1

    invoke-direct/range {v2 .. v7}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mMonthAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    .line 170
    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-virtual {v1, v2}, Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;->setConfig(Lcom/jzxiang/pickerview/config/PickerConfig;)V

    .line 171
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimeWheel;->mMonthAdapter:Lcom/jzxiang/pickerview/adapters/NumericWheelAdapter;

    invoke-virtual {v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelView;->setViewAdapter(Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;)V

    .line 173
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimeWheel;->mRepository:Lcom/jzxiang/pickerview/data/source/TimeRepository;

    invoke-virtual {v1, v0}, Lcom/jzxiang/pickerview/data/source/TimeRepository;->isMinYear(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 174
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimeWheel;->month:Lcom/jzxiang/pickerview/wheel/WheelView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->setCurrentItem(IZ)V

    :cond_1
    return-void
.end method
