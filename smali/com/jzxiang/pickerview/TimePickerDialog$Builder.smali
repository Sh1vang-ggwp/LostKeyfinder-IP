.class public Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
.super Ljava/lang/Object;
.source "TimePickerDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jzxiang/pickerview/TimePickerDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    new-instance v0, Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-direct {v0}, Lcom/jzxiang/pickerview/config/PickerConfig;-><init>()V

    iput-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    return-void
.end method


# virtual methods
.method public build()Lcom/jzxiang/pickerview/TimePickerDialog;
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-static {v0}, Lcom/jzxiang/pickerview/TimePickerDialog;->access$000(Lcom/jzxiang/pickerview/config/PickerConfig;)Lcom/jzxiang/pickerview/TimePickerDialog;

    move-result-object v0

    return-object v0
.end method

.method public setCallBack(Lcom/jzxiang/pickerview/listener/OnDateSetListener;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mCallBack:Lcom/jzxiang/pickerview/listener/OnDateSetListener;

    return-object p0
.end method

.method public setCancelStringId(Ljava/lang/String;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mCancelString:Ljava/lang/String;

    return-object p0
.end method

.method public setCurrentMillseconds(J)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 2

    .line 204
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    new-instance v1, Lcom/jzxiang/pickerview/data/WheelCalendar;

    invoke-direct {v1, p1, p2}, Lcom/jzxiang/pickerview/data/WheelCalendar;-><init>(J)V

    iput-object v1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mCurrentCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

    return-object p0
.end method

.method public setCyclic(Z)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-boolean p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->cyclic:Z

    return-object p0
.end method

.method public setDayText(Ljava/lang/String;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mDay:Ljava/lang/String;

    return-object p0
.end method

.method public setHourText(Ljava/lang/String;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 224
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mHour:Ljava/lang/String;

    return-object p0
.end method

.method public setMaxMillseconds(J)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 2

    .line 199
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    new-instance v1, Lcom/jzxiang/pickerview/data/WheelCalendar;

    invoke-direct {v1, p1, p2}, Lcom/jzxiang/pickerview/data/WheelCalendar;-><init>(J)V

    iput-object v1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mMaxCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

    return-object p0
.end method

.method public setMinMillseconds(J)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 2

    .line 194
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    new-instance v1, Lcom/jzxiang/pickerview/data/WheelCalendar;

    invoke-direct {v1, p1, p2}, Lcom/jzxiang/pickerview/data/WheelCalendar;-><init>(J)V

    iput-object v1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mMinCalendar:Lcom/jzxiang/pickerview/data/WheelCalendar;

    return-object p0
.end method

.method public setMinuteText(Ljava/lang/String;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 229
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mMinute:Ljava/lang/String;

    return-object p0
.end method

.method public setMonthText(Ljava/lang/String;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 214
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mMonth:Ljava/lang/String;

    return-object p0
.end method

.method public setSureStringId(Ljava/lang/String;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mSureString:Ljava/lang/String;

    return-object p0
.end method

.method public setThemeColor(I)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mThemeColor:I

    return-object p0
.end method

.method public setTitleStringId(Ljava/lang/String;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mTitleString:Ljava/lang/String;

    return-object p0
.end method

.method public setToolBarTextColor(I)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mToolBarTVColor:I

    return-object p0
.end method

.method public setType(Lcom/jzxiang/pickerview/data/Type;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mType:Lcom/jzxiang/pickerview/data/Type;

    return-object p0
.end method

.method public setWheelItemTextNormalColor(I)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVNormalColor:I

    return-object p0
.end method

.method public setWheelItemTextSelectorColor(I)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVSelectorColor:I

    return-object p0
.end method

.method public setWheelItemTextSize(I)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVSize:I

    return-object p0
.end method

.method public setYearText(Ljava/lang/String;)Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog$Builder;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iput-object p1, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mYear:Ljava/lang/String;

    return-object p0
.end method
