.class public Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;
.super Ljava/lang/Object;
.source "MediaPlayerTools.java"


# static fields
.field private static mediaPlayerTools:Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;


# instance fields
.field public isPlaying:Z

.field lastClickTime:J

.field mediaPlayer:Landroid/media/MediaPlayer;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 27
    iput-wide v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->lastClickTime:J

    const/4 v0, 0x0

    .line 96
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->isPlaying:Z

    return-void
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;
    .locals 1

    .line 21
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayerTools:Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    if-nez v0, :cond_0

    .line 22
    new-instance v0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;-><init>()V

    sput-object v0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayerTools:Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    .line 24
    :cond_0
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayerTools:Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;

    return-object v0
.end method


# virtual methods
.method public OnFDQClick(Ljava/lang/String;)V
    .locals 13

    .line 32
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/MyClickMode;->nowMode:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    sget-object v1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Photo:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    if-ne v0, v1, :cond_1

    .line 34
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/MyClickMode;->isApplicationInBackground(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "\u540e\u53f0\u6a21\u5f0f\uff0c\u4e0d\u5904\u7406"

    const-string v0, "\u540e\u53f0\u62cd\u7167"

    .line 35
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const-string p1, "\u524d\u53f0\u6a21\u5f0f"

    const-string v0, "\u524d\u53f0\u62cd\u7167"

    .line 37
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->takePhotots()V

    return-void

    .line 43
    :cond_1
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/MyClickMode;->nowMode:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    sget-object v1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Recording:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    const-string v2, "\u5f55\u97f3\u6216\u8005\u5f00\u59cb\u5f55\u97f3"

    if-ne v0, v1, :cond_2

    .line 45
    invoke-static {v2, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    invoke-static {}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->getInstance()Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->onFDQCLick()V

    return-void

    .line 50
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 52
    iget-wide v3, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->lastClickTime:J

    const-wide/16 v5, 0x0

    const-string v7, "\u70b9\u51fb"

    cmp-long v8, v3, v5

    if-nez v8, :cond_3

    .line 54
    iput-wide v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->lastClickTime:J

    const-string p1, "\u7b2c\u4e00\u6b21\u5355\u51fb"

    .line 55
    invoke-static {v7, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    sub-long v8, v0, v3

    const-wide/16 v10, 0x3e8

    cmp-long v12, v8, v10

    if-gez v12, :cond_6

    sub-long v3, v0, v3

    const-wide/16 v8, 0xa

    cmp-long v10, v3, v8

    if-lez v10, :cond_6

    .line 61
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->isDoubleClickIsRecording()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 63
    invoke-static {v2, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    invoke-static {}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getInstance()Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recordOnOff()V

    goto :goto_0

    :cond_4
    const-string v0, "\u53cc\u51fb"

    .line 68
    invoke-static {v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->isPlaying:Z

    const/4 v1, 0x1

    const-string v2, "\u64ad\u653e"

    if-eqz v0, :cond_5

    .line 70
    invoke-static {v2, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->Pause()V

    .line 72
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->SetIsAlarmingByMac(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 73
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    new-instance v2, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;

    sget-object v3, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_DISMISS:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v2, v3, p1, v1}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;-><init>(Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;Ljava/lang/String;Ljava/lang/Boolean;)V

    invoke-virtual {v0, v2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->sendDialogEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V

    goto :goto_0

    :cond_5
    const-string v0, "\u6682\u505c"

    .line 76
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->PlaySound(Ljava/lang/String;)V

    .line 78
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->SetIsAlarmingByMac(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 80
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    new-instance v2, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;

    sget-object v3, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_SHOW:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v2, v3, p1, v1}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;-><init>(Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;Ljava/lang/String;Ljava/lang/Boolean;)V

    invoke-virtual {v0, v2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->sendDialogEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V

    .line 85
    :goto_0
    iput-wide v5, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->lastClickTime:J

    goto :goto_1

    .line 88
    :cond_6
    iput-wide v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->lastClickTime:J

    const-string p1, "\u8f83\u957f\u65f6\u95f4\u7684\u5355\u51fb"

    .line 89
    invoke-static {v7, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :goto_1
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    return-void
.end method

.method public OnRingPageBack()V
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 189
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 191
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public Pause()V
    .locals 2

    .line 175
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 176
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 177
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 178
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 179
    iput-boolean v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->isPlaying:Z

    .line 181
    :cond_0
    iput-boolean v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->isPlaying:Z

    return-void
.end method

.method public PlaySound(Ljava/lang/String;)V
    .locals 2

    .line 110
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getResIdByAddress(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u64ad\u653e"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 114
    :cond_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->getResIdByAddress(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, p1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 115
    invoke-virtual {p1, v0, v0}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 116
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 117
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 118
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->isPlaying:Z

    return-void
.end method

.method public PlaySoundOnceByIndex(Ljava/lang/Integer;)V
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 125
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->isPlaying(Landroid/media/MediaPlayer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 131
    :cond_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    const/4 v0, 0x0

    .line 132
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 135
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    .line 162
    :pswitch_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0e0008

    invoke-static {p1, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    .line 159
    :pswitch_1
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0e0007

    invoke-static {p1, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    .line 156
    :pswitch_2
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0e0006

    invoke-static {p1, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0

    .line 153
    :pswitch_3
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0e0005

    invoke-static {p1, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0

    .line 150
    :pswitch_4
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0e0004

    invoke-static {p1, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0

    .line 147
    :pswitch_5
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0e0003

    invoke-static {p1, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0

    .line 144
    :pswitch_6
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0e0002

    invoke-static {p1, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0

    .line 141
    :pswitch_7
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x7f0e0000

    invoke-static {p1, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0

    .line 137
    :pswitch_8
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0e0001

    invoke-static {p1, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 166
    :goto_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    const/high16 v0, 0x42c80000    # 100.0f

    invoke-virtual {p1, v0, v0}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 168
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 169
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Utils/MediaPlayerTools;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

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

.method public getResIdByAddress(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1

    .line 198
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getBleItemByMac(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    move-result-object p1

    .line 201
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getRingIndex()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/high16 v0, 0x7f0e0000

    .line 205
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    packed-switch p1, :pswitch_data_0

    return-object v0

    :pswitch_0
    const p1, 0x7f0e0008

    .line 219
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_1
    const p1, 0x7f0e0007

    .line 217
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_2
    const p1, 0x7f0e0006

    .line 215
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_3
    const p1, 0x7f0e0005

    .line 213
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_4
    const p1, 0x7f0e0004

    .line 211
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_5
    const p1, 0x7f0e0003

    .line 209
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_6
    const p1, 0x7f0e0002

    .line 207
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_7
    return-object v0

    :pswitch_8
    const p1, 0x7f0e0001

    .line 203
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

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

.method public isPlaying(Landroid/media/MediaPlayer;)Z
    .locals 0

    .line 101
    :try_start_0
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 103
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p1, 0x0

    return p1
.end method
