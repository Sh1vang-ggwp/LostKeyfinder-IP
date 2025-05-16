.class Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$2;
.super Ljava/lang/Object;
.source "SettingFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->InitView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;)V
    .locals 0

    .line 122
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 125
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->setTimeDisTr(Z)V

    .line 126
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->save()Z

    if-eqz p2, :cond_0

    .line 130
    new-instance p1, Landroid/content/Intent;

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    const-class v0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/TimeSetting;

    invoke-direct {p1, p2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 134
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    const/16 v0, 0x6e

    invoke-virtual {p2, p1, v0}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 136
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    iget-object p1, p1, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->timeText:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->getTimeText()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 140
    :cond_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    iget-object p1, p1, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;->timeText:Landroid/widget/TextView;

    const-string p2, ""

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method
