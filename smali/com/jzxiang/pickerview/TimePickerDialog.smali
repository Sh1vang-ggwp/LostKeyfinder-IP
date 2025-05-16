.class public Lcom/jzxiang/pickerview/TimePickerDialog;
.super Landroidx/fragment/app/DialogFragment;
.source "TimePickerDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jzxiang/pickerview/TimePickerDialog$Builder;
    }
.end annotation


# instance fields
.field private mCurrentMillSeconds:J

.field mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

.field private mTimeWheel:Lcom/jzxiang/pickerview/TimeWheel;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/jzxiang/pickerview/config/PickerConfig;)Lcom/jzxiang/pickerview/TimePickerDialog;
    .locals 0

    .line 27
    invoke-static {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->newIntance(Lcom/jzxiang/pickerview/config/PickerConfig;)Lcom/jzxiang/pickerview/TimePickerDialog;

    move-result-object p0

    return-object p0
.end method

.method private initialize(Lcom/jzxiang/pickerview/config/PickerConfig;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    return-void
.end method

.method private static newIntance(Lcom/jzxiang/pickerview/config/PickerConfig;)Lcom/jzxiang/pickerview/TimePickerDialog;
    .locals 1

    .line 33
    new-instance v0, Lcom/jzxiang/pickerview/TimePickerDialog;

    invoke-direct {v0}, Lcom/jzxiang/pickerview/TimePickerDialog;-><init>()V

    .line 34
    invoke-direct {v0, p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->initialize(Lcom/jzxiang/pickerview/config/PickerConfig;)V

    return-object v0
.end method


# virtual methods
.method public getCurrentMillSeconds()J
    .locals 5

    .line 107
    iget-wide v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mCurrentMillSeconds:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 108
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    :cond_0
    return-wide v0
.end method

.method initView()Landroid/view/View;
    .locals 6

    .line 72
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 73
    sget v1, Lcom/jzxiang/pickerview/R$layout;->timepicker_layout:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 74
    sget v1, Lcom/jzxiang/pickerview/R$id;->tv_cancel:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 75
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    sget v2, Lcom/jzxiang/pickerview/R$id;->tv_sure:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 77
    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    sget v3, Lcom/jzxiang/pickerview/R$id;->tv_title:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 79
    sget v4, Lcom/jzxiang/pickerview/R$id;->toolbar:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 81
    iget-object v5, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v5, v5, Lcom/jzxiang/pickerview/config/PickerConfig;->mTitleString:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    iget-object v3, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v3, v3, Lcom/jzxiang/pickerview/config/PickerConfig;->mCancelString:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v1, v1, Lcom/jzxiang/pickerview/config/PickerConfig;->mSureString:Ljava/lang/String;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget v1, v1, Lcom/jzxiang/pickerview/config/PickerConfig;->mThemeColor:I

    invoke-virtual {v4, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 86
    new-instance v1, Lcom/jzxiang/pickerview/TimeWheel;

    iget-object v2, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-direct {v1, v0, v2}, Lcom/jzxiang/pickerview/TimeWheel;-><init>(Landroid/view/View;Lcom/jzxiang/pickerview/config/PickerConfig;)V

    iput-object v1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mTimeWheel:Lcom/jzxiang/pickerview/TimeWheel;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 92
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    .line 93
    sget v0, Lcom/jzxiang/pickerview/R$id;->tv_cancel:I

    if-ne p1, v0, :cond_0

    .line 94
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->dismiss()V

    goto :goto_0

    .line 95
    :cond_0
    sget v0, Lcom/jzxiang/pickerview/R$id;->tv_sure:I

    if-ne p1, v0, :cond_1

    .line 96
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->sureClicked()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 40
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 41
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 42
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 63
    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/jzxiang/pickerview/R$style;->Dialog_NoTitle:I

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const/4 v0, 0x1

    .line 64
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 65
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 66
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 67
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->initView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    return-object p1
.end method

.method public onResume()V
    .locals 3

    .line 48
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onResume()V

    .line 49
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/jzxiang/pickerview/R$dimen;->picker_height:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 51
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, -0x1

    .line 52
    invoke-virtual {v1, v2, v0}, Landroid/view/Window;->setLayout(II)V

    const/16 v0, 0x50

    .line 53
    invoke-virtual {v1, v0}, Landroid/view/Window;->setGravity(I)V

    return-void
.end method

.method sureClicked()V
    .locals 3

    .line 120
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 121
    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    .line 123
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mTimeWheel:Lcom/jzxiang/pickerview/TimeWheel;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentYear()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 124
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mTimeWheel:Lcom/jzxiang/pickerview/TimeWheel;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMonth()I

    move-result v1

    sub-int/2addr v1, v2

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 125
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mTimeWheel:Lcom/jzxiang/pickerview/TimeWheel;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentDay()I

    move-result v1

    const/4 v2, 0x5

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 126
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mTimeWheel:Lcom/jzxiang/pickerview/TimeWheel;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentHour()I

    move-result v1

    const/16 v2, 0xb

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 127
    iget-object v1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mTimeWheel:Lcom/jzxiang/pickerview/TimeWheel;

    invoke-virtual {v1}, Lcom/jzxiang/pickerview/TimeWheel;->getCurrentMinute()I

    move-result v1

    const/16 v2, 0xc

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 129
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mCurrentMillSeconds:J

    .line 130
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v0, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mCallBack:Lcom/jzxiang/pickerview/listener/OnDateSetListener;

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget-object v0, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mCallBack:Lcom/jzxiang/pickerview/listener/OnDateSetListener;

    iget-wide v1, p0, Lcom/jzxiang/pickerview/TimePickerDialog;->mCurrentMillSeconds:J

    invoke-interface {v0, p0, v1, v2}, Lcom/jzxiang/pickerview/listener/OnDateSetListener;->onDateSet(Lcom/jzxiang/pickerview/TimePickerDialog;J)V

    .line 133
    :cond_0
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/TimePickerDialog;->dismiss()V

    return-void
.end method
