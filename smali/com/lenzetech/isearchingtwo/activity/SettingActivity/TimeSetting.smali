.class public Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "TimeSetting.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# instance fields
.field backBtn:Landroid/widget/Button;

.field endBtn:Landroid/widget/Button;

.field resultId:Ljava/lang/Integer;

.field startBtn:Landroid/widget/Button;

.field textViewEnd:Landroid/widget/TextView;

.field textViewStart:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, -0x1

    .line 81
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->resultId:Ljava/lang/Integer;

    return-void
.end method

.method private InitView()V
    .locals 1

    const v0, 0x7f08013a

    .line 34
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->startBtn:Landroid/widget/Button;

    const v0, 0x7f080087

    .line 35
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->endBtn:Landroid/widget/Button;

    .line 37
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->startBtn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->endBtn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f08013c

    .line 41
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->textViewStart:Landroid/widget/TextView;

    const v0, 0x7f080088

    .line 42
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->textViewEnd:Landroid/widget/TextView;

    const v0, 0x7f080127

    .line 44
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->backBtn:Landroid/widget/Button;

    .line 45
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->UpdateLables()V

    return-void
.end method

.method private UpdateLables()V
    .locals 7

    .line 54
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getStartHour()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 55
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getStartMin()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 56
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getEndHour()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 57
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getEndMin()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 59
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const-string v5, "0"

    const/4 v6, 0x1

    if-gt v4, v6, :cond_0

    .line 61
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 63
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v4, v6, :cond_1

    .line 65
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 67
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v4, v6, :cond_2

    .line 69
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 71
    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v4, v6, :cond_3

    .line 73
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 77
    :cond_3
    iget-object v4, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->textViewStart:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const v6, 0x7f0f0091

    invoke-virtual {p0, v6}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "    :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->textViewEnd:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const v5, 0x7f0f0047

    invoke-virtual {p0, v5}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10

    .line 85
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getStartHour()Ljava/lang/Integer;

    move-result-object v0

    .line 86
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getStartMin()Ljava/lang/Integer;

    move-result-object v1

    .line 87
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getEndHour()Ljava/lang/Integer;

    move-result-object v2

    .line 88
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getEndMin()Ljava/lang/Integer;

    move-result-object v3

    .line 91
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v4, 0x7f080087

    if-eq p1, v4, :cond_2

    const v2, 0x7f080127

    if-eq p1, v2, :cond_1

    const v2, 0x7f08013a

    if-eq p1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 93
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->resultId:Ljava/lang/Integer;

    .line 94
    new-instance p1, Landroid/app/TimePickerDialog;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v7, 0x1

    move-object v2, p1

    move-object v3, p0

    move-object v4, p0

    invoke-direct/range {v2 .. v7}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;Landroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 95
    invoke-virtual {p1}, Landroid/app/TimePickerDialog;->show()V

    goto :goto_0

    .line 103
    :cond_1
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->finish()V

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    .line 98
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->resultId:Ljava/lang/Integer;

    .line 99
    new-instance p1, Landroid/app/TimePickerDialog;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/4 v9, 0x1

    move-object v4, p1

    move-object v5, p0

    move-object v6, p0

    invoke-direct/range {v4 .. v9}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;Landroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 100
    invoke-virtual {p1}, Landroid/app/TimePickerDialog;->show()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 19
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0024

    .line 20
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->setContentView(I)V

    .line 22
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->InitView()V

    return-void
.end method

.method public onTimeSet(Landroid/widget/TimePicker;II)V
    .locals 1

    .line 111
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->resultId:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-gez p1, :cond_0

    return-void

    .line 116
    :cond_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->resultId:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_1

    .line 118
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->setStartHour(Ljava/lang/Integer;)V

    .line 119
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->setStartMin(Ljava/lang/Integer;)V

    goto :goto_0

    .line 122
    :cond_1
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->resultId:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 124
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->setEndHour(Ljava/lang/Integer;)V

    .line 125
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->setEndMin(Ljava/lang/Integer;)V

    .line 129
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;->UpdateLables()V

    .line 131
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->InitView()V

    return-void
.end method
