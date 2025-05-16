.class Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$1;
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

    .line 111
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 114
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->setWifiDisTr(Z)V

    .line 115
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->save()Z

    return-void
.end method
