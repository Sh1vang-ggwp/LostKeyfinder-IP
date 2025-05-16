.class public Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;
.super Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;
.source "RecordList.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static recordList:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;


# instance fields
.field backBtn:Landroid/widget/Button;

.field private blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

.field endBtn:Landroid/widget/Button;

.field isRecording:Z

.field listView:Landroid/widget/ListView;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private recItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/RecItem;",
            ">;"
        }
    .end annotation
.end field

.field startBtn:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 62
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;-><init>()V

    const/4 v0, 0x0

    .line 67
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->isRecording:Z

    .line 120
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recItemList:Ljava/util/List;

    .line 63
    sput-object p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recordList:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    return-void
.end method

.method private InitList()V
    .locals 4

    const v0, 0x7f0800f7

    .line 125
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    .line 126
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recItemList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 128
    invoke-static {}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getInstance()Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getRecItemList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recItemList:Ljava/util/List;

    const-string v0, "reverse"

    const-string v1, "InitList: -------------------------"

    .line 135
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    new-instance v0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recItemList:Ljava/util/List;

    const v3, 0x7f0b0055

    invoke-direct {v0, v1, v3, v2}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 152
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 155
    new-instance v1, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$3;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$3;-><init>(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)V

    invoke-virtual {v0, v1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->setListener(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;)V

    return-void
.end method

.method private InitView()V
    .locals 1

    const v0, 0x7f080127

    .line 105
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->backBtn:Landroid/widget/Button;

    .line 106
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f08013a

    .line 109
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->startBtn:Landroid/widget/Button;

    const v0, 0x7f080087

    .line 110
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->endBtn:Landroid/widget/Button;

    .line 111
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->startBtn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->endBtn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    invoke-static {}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getInstance()Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getFiles()V

    .line 116
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->InitList()V

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->InitList()V

    return-void
.end method

.method static synthetic access$100(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)Ljava/util/List;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recItemList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;Ljava/lang/String;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->startplayMusic(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)Landroid/media/MediaPlayer;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p0
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;
    .locals 1

    .line 56
    sget-object v0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recordList:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;-><init>()V

    sput-object v0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recordList:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    .line 59
    :cond_0
    sget-object v0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recordList:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    return-object v0
.end method

.method private startplayMusic(Ljava/lang/String;)V
    .locals 2

    .line 199
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 200
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->stopPlayMusic()V

    .line 202
    :cond_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 203
    new-instance v1, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$4;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$4;-><init>(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 210
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$5;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$5;-><init>(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 220
    :try_start_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 221
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 222
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$6;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$6;-><init>(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 230
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 231
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->setAllUnplay()V

    .line 232
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->notifyDataSetChanged()V

    :goto_0
    return-void
.end method

.method private stopPlayMusic()V
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    .line 241
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 242
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    const/4 v0, 0x0

    .line 243
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 244
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->setAllUnplay()V

    .line 245
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->notifyDataSetChanged()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 247
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    :goto_0
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 174
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u70b9\u51fb\u65f6\u95f4"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "hello"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f080087

    if-eq p1, v0, :cond_2

    const v0, 0x7f080127

    if-eq p1, v0, :cond_1

    const v0, 0x7f08013a

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 184
    :cond_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getInstance()Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->onClickStart()V

    goto :goto_0

    .line 177
    :cond_1
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Normal:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    sput-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyClickMode;->nowMode:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    .line 179
    invoke-static {}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getInstance()Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->onClickEnd()V

    .line 180
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->stopPlayMusic()V

    .line 181
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->finish()V

    goto :goto_0

    .line 187
    :cond_2
    invoke-static {}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getInstance()Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->onClickEnd()V

    .line 189
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->InitList()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 33
    invoke-super {p0, p1}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0021

    .line 34
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->setContentView(I)V

    .line 36
    invoke-static {}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getInstance()Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->initData()V

    .line 37
    invoke-direct {p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->InitView()V

    .line 38
    new-instance p1, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-direct {p1, p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    const-string v0, "android.permission.RECORD_AUDIO"

    .line 39
    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isPermission(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 40
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    const/16 v1, 0xca

    invoke-virtual {p1, v0, v1}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->requestPermission(Ljava/lang/String;I)V

    .line 43
    :cond_0
    sput-object p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->recordList:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 48
    invoke-super {p0}, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->onDestroy()V

    const-string v0, "\u4f60\u597d\u554a"

    const-string v1, "\u6211\u88ab\u6740\u6b7b\u4e86"

    .line 49
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onFDQCLick()V
    .locals 2

    const-string v0, "11111111111"

    const-string v1, "\u5f00\u59cb\u5f55\u97f3"

    .line 70
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->isRecording:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 72
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->isRecording:Z

    .line 74
    new-instance v0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$1;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$1;-><init>(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)V

    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 86
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->isRecording:Z

    const-string v0, "kaishi"

    .line 88
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    new-instance v0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$2;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$2;-><init>(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)V

    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
