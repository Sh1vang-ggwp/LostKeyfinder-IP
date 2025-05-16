.class public Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;
.super Landroidx/fragment/app/Fragment;
.source "SettingFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/lenzetech/isearchingtwo/fragment/FragmentChangedCallback;


# static fields
.field private static final TAG:Ljava/lang/String; = "SettingFragment"

.field private static settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;


# instance fields
.field private mContentView:Landroid/view/View;

.field recBtn:Landroid/widget/Button;

.field recording_switch:Landroid/widget/Switch;

.field timeSwith:Landroid/widget/Switch;

.field timeText:Landroid/widget/TextView;

.field private tvVersion:Landroid/widget/TextView;

.field wifiSwith:Landroid/widget/Switch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 55
    sput-object p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    return-void
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;
    .locals 1

    .line 45
    sget-object v0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;-><init>()V

    sput-object v0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    .line 50
    :cond_0
    sget-object v0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->settingFragment:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    return-object v0
.end method

.method public static getVerName(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 65
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 66
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 68
    invoke-virtual {p0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    const-string p0, ""

    :goto_0
    return-object p0
.end method


# virtual methods
.method public InitView()V
    .locals 3

    .line 103
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f080174

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->tvVersion:Landroid/widget/TextView;

    .line 104
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->getVerName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f08015d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->timeText:Landroid/widget/TextView;

    .line 108
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f080181

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->wifiSwith:Landroid/widget/Switch;

    .line 110
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->isWifiDisTr()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 111
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->wifiSwith:Landroid/widget/Switch;

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$1;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$1;-><init>(Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 120
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f08015c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->timeSwith:Landroid/widget/Switch;

    .line 121
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->isTimeDisTr()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 122
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->timeSwith:Landroid/widget/Switch;

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$2;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$2;-><init>(Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 146
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f0800f6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->recBtn:Landroid/widget/Button;

    .line 147
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->timeSwith:Landroid/widget/Switch;

    invoke-virtual {v0}, Landroid/widget/Switch;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->timeText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->getTimeText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f0800f9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->recording_switch:Landroid/widget/Switch;

    .line 157
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->isDoubleClickIsRecording()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 158
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->recording_switch:Landroid/widget/Switch;

    new-instance v1, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$3;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$3;-><init>(Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void
.end method

.method public getTimeText()Ljava/lang/String;
    .locals 7

    .line 189
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getStartHour()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 190
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getStartMin()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 191
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getEndHour()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 192
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getEndMin()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 194
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const-string v5, "0"

    const/4 v6, 0x1

    if-gt v4, v6, :cond_0

    .line 196
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 198
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v4, v6, :cond_1

    .line 200
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 202
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v4, v6, :cond_2

    .line 204
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 206
    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v4, v6, :cond_3

    .line 208
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 211
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 180
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p1, 0x64

    if-ne p2, p1, :cond_0

    .line 183
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->InitView()V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0800f6

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 79
    :cond_0
    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 80
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->startActivity(Landroid/content/Intent;)V

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 30
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b003f

    const/4 v0, 0x0

    .line 35
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->mContentView:Landroid/view/View;

    .line 37
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->InitView()V

    .line 38
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->mContentView:Landroid/view/View;

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    .line 232
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    const-string v0, "SettingFragment"

    const-string v1, "onDestroy: onDestroy"

    .line 233
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onHideFc()V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 226
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    const-string v0, "SettingFragment"

    const-string v1, "onPause: onPause"

    .line 227
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 220
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    const-string v0, "SettingFragment"

    const-string v1, "onResume: onResume"

    .line 221
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onStart()V
    .locals 0

    .line 88
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    .line 89
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->InitView()V

    return-void
.end method
