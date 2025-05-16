.class public Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;
.super Ljava/lang/Object;
.source "MyRecorder.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MainActivity"

.field private static myRecorder:Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;


# instance fields
.field public RecItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/RecItem;",
            ">;"
        }
    .end annotation
.end field

.field private audioQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "[B>;"
        }
    .end annotation
.end field

.field private filePath:Ljava/lang/String;

.field private isRecording:Z

.field private mAudioData:[B

.field private mAudioFormat:I

.field private mAudioRecord:Landroid/media/AudioRecord;

.field private mAudioTrack:Landroid/media/AudioTrack;

.field private mChannelConfig:I

.field private mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private mRecorderBufferSize:I

.field private mSampleRateInHZ:I

.field private recorder:Landroid/media/MediaRecorder;

.field public recordingList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 8

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->audioQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 45
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const/4 v2, 0x2

    const/4 v3, 0x2

    const-wide/16 v4, 0x3c

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    const/16 v0, 0x1f40

    .line 52
    iput v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->mSampleRateInHZ:I

    const/4 v0, 0x2

    .line 53
    iput v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->mAudioFormat:I

    const/16 v0, 0x10

    .line 54
    iput v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->mChannelConfig:I

    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->isRecording:Z

    const/4 v0, 0x0

    .line 57
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    return-void
.end method

.method private createFile(Ljava/lang/String;)Ljava/io/File;
    .locals 3

    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/AudioRecord/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 193
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 195
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 196
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 199
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 200
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 201
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_1

    .line 203
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 208
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;
    .locals 1

    .line 33
    sget-object v0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->myRecorder:Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;-><init>()V

    sput-object v0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->myRecorder:Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    .line 37
    :cond_0
    sget-object v0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->myRecorder:Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    return-object v0
.end method

.method private pcmToWave(Ljava/lang/String;Ljava/lang/String;)V
    .locals 13

    .line 161
    iget v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->mSampleRateInHZ:I

    int-to-long v7, v0

    const-wide/16 v0, 0x10

    mul-long v0, v0, v7

    const/4 v2, 0x1

    int-to-long v2, v2

    mul-long v0, v0, v2

    const-wide/16 v2, 0x8

    .line 164
    div-long v10, v0, v2

    .line 166
    iget v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->mRecorderBufferSize:I

    new-array v0, v0, [B

    .line 168
    :try_start_0
    new-instance v12, Ljava/io/FileInputStream;

    invoke-direct {v12, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 169
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 171
    invoke-virtual {v12}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p2

    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v3

    const-wide/16 v1, 0x24

    add-long v5, v3, v1

    const/4 v9, 0x1

    move-object v1, p0

    move-object v2, p1

    .line 173
    invoke-direct/range {v1 .. v11}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->writeWaveFileHeader(Ljava/io/FileOutputStream;JJJIJ)V

    .line 174
    :goto_0
    invoke-virtual {v12, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result p2

    const/4 v1, -0x1

    if-eq p2, v1, :cond_0

    .line 175
    invoke-virtual {p1, v0}, Ljava/io/FileOutputStream;->write([B)V

    goto :goto_0

    .line 178
    :cond_0
    invoke-virtual {v12}, Ljava/io/FileInputStream;->close()V

    .line 179
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 185
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception p1

    .line 182
    invoke-virtual {p1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    :goto_1
    return-void
.end method

.method private writeWaveFileHeader(Ljava/io/FileOutputStream;JJJIJ)V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x2c

    new-array v1, v0, [B

    const/16 v2, 0x52

    const/4 v3, 0x0

    aput-byte v2, v1, v3

    const/16 v2, 0x49

    const/4 v4, 0x1

    aput-byte v2, v1, v4

    const/4 v2, 0x2

    const/16 v5, 0x46

    aput-byte v5, v1, v2

    const/4 v6, 0x3

    aput-byte v5, v1, v6

    const-wide/16 v5, 0xff

    and-long v7, p4, v5

    long-to-int v8, v7

    int-to-byte v7, v8

    const/4 v8, 0x4

    aput-byte v7, v1, v8

    const/16 v7, 0x8

    shr-long v8, p4, v7

    and-long/2addr v8, v5

    long-to-int v9, v8

    int-to-byte v8, v9

    const/4 v9, 0x5

    aput-byte v8, v1, v9

    const/16 v8, 0x10

    shr-long v9, p4, v8

    and-long/2addr v9, v5

    long-to-int v10, v9

    int-to-byte v9, v10

    const/4 v10, 0x6

    aput-byte v9, v1, v10

    const/16 v9, 0x18

    shr-long v10, p4, v9

    and-long/2addr v10, v5

    long-to-int v11, v10

    int-to-byte v10, v11

    const/4 v11, 0x7

    aput-byte v10, v1, v11

    const/16 v10, 0x57

    aput-byte v10, v1, v7

    const/16 v10, 0x9

    const/16 v11, 0x41

    aput-byte v11, v1, v10

    const/16 v10, 0xa

    const/16 v11, 0x56

    aput-byte v11, v1, v10

    const/16 v10, 0xb

    const/16 v11, 0x45

    aput-byte v11, v1, v10

    const/16 v10, 0xc

    const/16 v11, 0x66

    aput-byte v11, v1, v10

    const/16 v10, 0xd

    const/16 v11, 0x6d

    aput-byte v11, v1, v10

    const/16 v10, 0xe

    const/16 v11, 0x74

    aput-byte v11, v1, v10

    const/16 v10, 0xf

    const/16 v12, 0x20

    aput-byte v12, v1, v10

    aput-byte v8, v1, v8

    const/16 v10, 0x11

    aput-byte v3, v1, v10

    const/16 v10, 0x12

    aput-byte v3, v1, v10

    const/16 v10, 0x13

    aput-byte v3, v1, v10

    const/16 v10, 0x14

    aput-byte v4, v1, v10

    const/16 v4, 0x15

    aput-byte v3, v1, v4

    move/from16 v4, p8

    int-to-byte v4, v4

    const/16 v10, 0x16

    aput-byte v4, v1, v10

    const/16 v4, 0x17

    aput-byte v3, v1, v4

    and-long v13, p6, v5

    long-to-int v4, v13

    int-to-byte v4, v4

    aput-byte v4, v1, v9

    shr-long v13, p6, v7

    and-long/2addr v13, v5

    long-to-int v4, v13

    int-to-byte v4, v4

    const/16 v10, 0x19

    aput-byte v4, v1, v10

    shr-long v13, p6, v8

    and-long/2addr v13, v5

    long-to-int v4, v13

    int-to-byte v4, v4

    const/16 v10, 0x1a

    aput-byte v4, v1, v10

    shr-long v13, p6, v9

    and-long/2addr v13, v5

    long-to-int v4, v13

    int-to-byte v4, v4

    const/16 v10, 0x1b

    aput-byte v4, v1, v10

    and-long v13, p9, v5

    long-to-int v4, v13

    int-to-byte v4, v4

    const/16 v10, 0x1c

    aput-byte v4, v1, v10

    shr-long v13, p9, v7

    and-long/2addr v13, v5

    long-to-int v4, v13

    int-to-byte v4, v4

    const/16 v10, 0x1d

    aput-byte v4, v1, v10

    shr-long v13, p9, v8

    and-long/2addr v13, v5

    long-to-int v4, v13

    int-to-byte v4, v4

    const/16 v10, 0x1e

    aput-byte v4, v1, v10

    shr-long v13, p9, v9

    and-long/2addr v13, v5

    long-to-int v4, v13

    int-to-byte v4, v4

    const/16 v10, 0x1f

    aput-byte v4, v1, v10

    aput-byte v2, v1, v12

    const/16 v2, 0x21

    aput-byte v3, v1, v2

    const/16 v2, 0x22

    aput-byte v8, v1, v2

    const/16 v2, 0x23

    aput-byte v3, v1, v2

    const/16 v2, 0x24

    const/16 v4, 0x64

    aput-byte v4, v1, v2

    const/16 v2, 0x25

    const/16 v4, 0x61

    aput-byte v4, v1, v2

    const/16 v2, 0x26

    aput-byte v11, v1, v2

    const/16 v2, 0x27

    aput-byte v4, v1, v2

    and-long v10, p2, v5

    long-to-int v2, v10

    int-to-byte v2, v2

    const/16 v4, 0x28

    aput-byte v2, v1, v4

    shr-long v10, p2, v7

    and-long/2addr v10, v5

    long-to-int v2, v10

    int-to-byte v2, v2

    const/16 v4, 0x29

    aput-byte v2, v1, v4

    shr-long v7, p2, v8

    and-long/2addr v7, v5

    long-to-int v2, v7

    int-to-byte v2, v2

    const/16 v4, 0x2a

    aput-byte v2, v1, v4

    shr-long v7, p2, v9

    and-long v4, v7, v5

    long-to-int v2, v4

    int-to-byte v2, v2

    const/16 v4, 0x2b

    aput-byte v2, v1, v4

    move-object/from16 v2, p1

    .line 370
    invoke-virtual {v2, v1, v3, v0}, Ljava/io/FileOutputStream;->write([BII)V

    return-void
.end method


# virtual methods
.method public getFiles()V
    .locals 5

    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/AudioRecord/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 225
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recordingList:Ljava/util/ArrayList;

    .line 227
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    .line 230
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_3

    .line 231
    aget-object v2, v0, v1

    .line 232
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 233
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".wav"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".3gp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 234
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "nihao"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recordingList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const-string v0, "\u4e3a\u7a7a"

    const-string v1, ""

    .line 240
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return-void
.end method

.method public getRecItemList()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/lenzetech/isearchingtwo/Bean/RecItem;",
            ">;"
        }
    .end annotation

    .line 251
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/AudioRecord/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 253
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->RecItemList:Ljava/util/List;

    if-nez v1, :cond_0

    .line 254
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->RecItemList:Ljava/util/List;

    goto :goto_0

    .line 256
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 259
    :goto_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    .line 273
    array-length v2, v0

    const/4 v3, 0x0

    :goto_1
    const-string v4, "nihao"

    if-ge v3, v2, :cond_1

    aget-object v5, v0, v3

    .line 274
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 275
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "--------------------------------- length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 278
    new-instance v2, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder$1;

    invoke-direct {v2, p0}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder$1;-><init>(Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;)V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 286
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/16 v3, 0x64

    if-le v2, v3, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v3

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    :goto_2
    const/4 v3, 0x0

    .line 287
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_6

    if-ge v3, v2, :cond_3

    .line 289
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    goto :goto_4

    .line 292
    :cond_3
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ".wav"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ".3gp"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 294
    :cond_4
    new-instance v5, Lcom/lenzetech/isearchingtwo/Bean/RecItem;

    invoke-direct {v5}, Lcom/lenzetech/isearchingtwo/Bean/RecItem;-><init>()V

    .line 295
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/File;

    invoke-virtual {v5, v6}, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->setFileIte(Ljava/io/File;)V

    .line 296
    iget-object v6, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->RecItemList:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getRecItemList: file="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 302
    :cond_6
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->RecItemList:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 303
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->RecItemList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v2, 0x1e

    if-le v0, v2, :cond_7

    .line 304
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->RecItemList:Ljava/util/List;

    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->RecItemList:Ljava/util/List;

    .line 306
    :cond_7
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->RecItemList:Ljava/util/List;

    return-object v0
.end method

.method public initData()V
    .locals 0

    return-void
.end method

.method public onClickEnd()V
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->isRecording:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 147
    iput-boolean v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->isRecording:Z

    .line 148
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->stop()V

    .line 149
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    const/4 v0, 0x0

    .line 150
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    return-void
.end method

.method public onClickStart()V
    .locals 4

    .line 77
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->isRecording:Z

    if-eqz v0, :cond_0

    return-void

    .line 81
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/AudioRecord/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 83
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 84
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 85
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 87
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "recording_"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ".3gp"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->filePath:Ljava/lang/String;

    .line 88
    new-instance v0, Landroid/media/MediaRecorder;

    invoke-direct {v0}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    const/4 v1, 0x1

    .line 89
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 90
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 91
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->filePath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 94
    :try_start_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->prepare()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v0, "MainActivity"

    const-string v2, "prepare() failed"

    .line 96
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    :goto_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->start()V

    .line 99
    iput-boolean v1, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->isRecording:Z

    return-void
.end method

.method public recordOnOff()V
    .locals 1

    .line 68
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->isRecording:Z

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->onClickEnd()V

    goto :goto_0

    .line 71
    :cond_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->onClickStart()V

    :goto_0
    return-void
.end method
