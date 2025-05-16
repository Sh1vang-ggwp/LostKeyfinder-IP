.class Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;
.super Ljava/lang/Object;
.source "SettingRingActivity.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->InitView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;)V
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 7

    packed-switch p2, :pswitch_data_0

    goto/16 :goto_0

    .line 100
    :pswitch_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    const/16 p2, 0x8

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySoundOnceByIndex(Ljava/lang/Integer;)V

    .line 101
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    iget-object v2, p1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    goto/16 :goto_0

    .line 96
    :pswitch_1
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    const/4 p2, 0x7

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySoundOnceByIndex(Ljava/lang/Integer;)V

    .line 97
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    iget-object v2, p1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    goto/16 :goto_0

    .line 92
    :pswitch_2
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    const/4 p2, 0x6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySoundOnceByIndex(Ljava/lang/Integer;)V

    .line 93
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    iget-object v2, p1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    goto/16 :goto_0

    .line 88
    :pswitch_3
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    const/4 p2, 0x5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySoundOnceByIndex(Ljava/lang/Integer;)V

    .line 89
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    iget-object v2, p1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    goto/16 :goto_0

    .line 84
    :pswitch_4
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    const/4 p2, 0x4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySoundOnceByIndex(Ljava/lang/Integer;)V

    .line 85
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    iget-object v2, p1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    goto/16 :goto_0

    .line 80
    :pswitch_5
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    const/4 p2, 0x3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySoundOnceByIndex(Ljava/lang/Integer;)V

    .line 81
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    iget-object v2, p1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    goto :goto_0

    .line 76
    :pswitch_6
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    const/4 p2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySoundOnceByIndex(Ljava/lang/Integer;)V

    .line 77
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    iget-object v2, p1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    goto :goto_0

    .line 72
    :pswitch_7
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySoundOnceByIndex(Ljava/lang/Integer;)V

    .line 73
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    iget-object v2, p1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    goto :goto_0

    .line 68
    :pswitch_8
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySoundOnceByIndex(Ljava/lang/Integer;)V

    .line 69
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    iget-object v2, p1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f080100
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
