.class public Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SettingRingActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field backBtn:Landroid/widget/Button;

.field currentBleMac:Ljava/lang/String;

.field private myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

.field radioGroup:Landroid/widget/RadioGroup;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    return-void
.end method

.method private InitView()V
    .locals 3

    const v0, 0x7f080127

    .line 58
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->backBtn:Landroid/widget/Button;

    .line 59
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0800f5

    .line 60
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f080100

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 63
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    new-instance v2, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;

    invoke-direct {v2, p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;-><init>(Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getRingIndex()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "xinxi "

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getRingIndex()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 139
    :pswitch_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f080108

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 136
    :pswitch_1
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f080107

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 133
    :pswitch_2
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f080106

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 130
    :pswitch_3
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f080105

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 127
    :pswitch_4
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f080104

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 124
    :pswitch_5
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f080103

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 121
    :pswitch_6
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f080102

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 118
    :pswitch_7
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    const v1, 0x7f080101

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_0

    .line 115
    :pswitch_8
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->radioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 147
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f080127

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 150
    :cond_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->OnRingPageBack()V

    .line 151
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->finish()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 23
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0022

    .line 24
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->setContentView(I)V

    .line 28
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "mac"

    .line 29
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    .line 30
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u5f97\u5230MAC\u5730\u5740"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u8fdb\u5165\u84dd\u7259\u8bbe\u7f6e"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 36
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getBleItemByMac(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 37
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getBleItemByMac(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    .line 46
    :cond_0
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->InitView()V

    return-void
.end method
