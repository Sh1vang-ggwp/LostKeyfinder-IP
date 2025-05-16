.class Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$3;
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

    .line 158
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/SettingFragment$3;->this$0:Lcom/lenzetech/isearchingtwo/fragment/SettingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 162
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->setDoubleClickIsRecording(Z)V

    .line 163
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->save()Z

    const-string p1, "\u53cc\u51fb\u662f\u5426\u5f55\u97f3"

    if-eqz p2, :cond_0

    const-string p2, "\u53cc\u51fb\u5f55\u97f3"

    .line 167
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string p2, "\u53cc\u51fb\u4e0d\u8fdb\u884c\u5f55\u97f3"

    .line 171
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method
