.class public Lcom/jzxiang/pickerview/config/PickerConfig;
.super Ljava/lang/Object;
.source "PickerConfig.java"


# instance fields
.field public cyclic:Z

.field public mCallBack:Lcom/jzxiang/pickerview/listener/OnDateSetListener;

.field public mCancelString:Ljava/lang/String;

.field public mCurrentCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

.field public mDay:Ljava/lang/String;

.field public mHour:Ljava/lang/String;

.field public mMaxCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

.field public mMinCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

.field public mMinute:Ljava/lang/String;

.field public mMonth:Ljava/lang/String;

.field public mSureString:Ljava/lang/String;

.field public mThemeColor:I

.field public mTitleString:Ljava/lang/String;

.field public mToolBarTVColor:I

.field public mType:Lcom/jzxiang/pickerview/data/Type;

.field public mWheelTVNormalColor:I

.field public mWheelTVSelectorColor:I

.field public mWheelTVSize:I

.field public mYear:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    sget-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->TYPE:Lcom/jzxiang/pickerview/data/Type;

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mType:Lcom/jzxiang/pickerview/data/Type;

    const v0, -0x19ffee

    .line 14
    iput v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mThemeColor:I

    .line 16
    sget-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->CANCEL:Ljava/lang/String;

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mCancelString:Ljava/lang/String;

    .line 17
    sget-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->SURE:Ljava/lang/String;

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mSureString:Ljava/lang/String;

    .line 18
    sget-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->TITLE:Ljava/lang/String;

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mTitleString:Ljava/lang/String;

    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mToolBarTVColor:I

    const v0, -0x666667

    .line 21
    iput v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVNormalColor:I

    const v0, -0xbfbfc0

    .line 22
    iput v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVSelectorColor:I

    const/16 v0, 0xc

    .line 23
    iput v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVSize:I

    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->cyclic:Z

    .line 26
    sget-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->YEAR:Ljava/lang/String;

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mYear:Ljava/lang/String;

    .line 27
    sget-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->MONTH:Ljava/lang/String;

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mMonth:Ljava/lang/String;

    .line 28
    sget-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->DAY:Ljava/lang/String;

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mDay:Ljava/lang/String;

    .line 29
    sget-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->HOUR:Ljava/lang/String;

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mHour:Ljava/lang/String;

    .line 30
    sget-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->MINUTE:Ljava/lang/String;

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mMinute:Ljava/lang/String;

    .line 35
    new-instance v0, Lcom/jzxiang/pickerview/data/WheelCalendar;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lcom/jzxiang/pickerview/data/WheelCalendar;-><init>(J)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mMinCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

    .line 40
    new-instance v0, Lcom/jzxiang/pickerview/data/WheelCalendar;

    invoke-direct {v0, v1, v2}, Lcom/jzxiang/pickerview/data/WheelCalendar;-><init>(J)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mMaxCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

    .line 45
    new-instance v0, Lcom/jzxiang/pickerview/data/WheelCalendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/jzxiang/pickerview/data/WheelCalendar;-><init>(J)V

    iput-object v0, p0, Lcom/jzxiang/pickerview/config/PickerConfig;->mCurrentCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

    return-void
.end method
