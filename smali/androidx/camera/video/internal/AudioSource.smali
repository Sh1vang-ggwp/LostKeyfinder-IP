.class public final Landroidx/camera/video/internal/AudioSource;
.super Ljava/lang/Object;
.source "AudioSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/internal/AudioSource$InternalState;,
        Landroidx/camera/video/internal/AudioSource$Settings;,
        Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;,
        Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;
    }
.end annotation


# static fields
.field public static final COMMON_SAMPLE_RATES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "AudioSource"


# instance fields
.field private mAcquireBufferCallback:Landroidx/camera/core/impl/utils/futures/FutureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/utils/futures/FutureCallback<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;"
        }
    .end annotation
.end field

.field final mAudioRecord:Landroid/media/AudioRecord;

.field private mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

.field mAudioSourceCallback:Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;

.field mBufferProvider:Landroidx/camera/video/internal/BufferProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/video/internal/BufferProvider<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;"
        }
    .end annotation
.end field

.field mBufferProviderState:Landroidx/camera/video/internal/BufferProvider$State;

.field final mBufferSize:I

.field final mBytesPerFrame:I

.field mCallbackExecutor:Ljava/util/concurrent/Executor;

.field final mExecutor:Ljava/util/concurrent/Executor;

.field mIsSendingAudio:Z

.field final mSampleRate:I

.field mSourceSilence:Ljava/util/concurrent/atomic/AtomicBoolean;

.field mState:Landroidx/camera/video/internal/AudioSource$InternalState;

.field private mStateObserver:Landroidx/camera/core/impl/Observable$Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Observable$Observer<",
            "Landroidx/camera/video/internal/BufferProvider$State;",
            ">;"
        }
    .end annotation
.end field

.field mTotalFramesRead:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Integer;

    const v1, 0xbb80

    .line 91
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const v1, 0xac44

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/16 v1, 0x5622

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const/16 v1, 0x2b11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const/16 v1, 0x1f40

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const/16 v1, 0x12c0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x5

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 90
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/internal/AudioSource;->COMMON_SAMPLE_RATES:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroidx/camera/video/internal/AudioSource$Settings;Ljava/util/concurrent/Executor;Landroid/content/Context;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/AudioSourceAccessException;
        }
    .end annotation

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mSourceSilence:Ljava/util/concurrent/atomic/AtomicBoolean;

    const-wide/16 v2, 0x0

    .line 122
    iput-wide v2, p0, Landroidx/camera/video/internal/AudioSource;->mTotalFramesRead:J

    .line 124
    sget-object v0, Landroidx/camera/video/internal/AudioSource$InternalState;->CONFIGURED:Landroidx/camera/video/internal/AudioSource$InternalState;

    iput-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mState:Landroidx/camera/video/internal/AudioSource$InternalState;

    .line 127
    sget-object v0, Landroidx/camera/video/internal/BufferProvider$State;->INACTIVE:Landroidx/camera/video/internal/BufferProvider$State;

    iput-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mBufferProviderState:Landroidx/camera/video/internal/BufferProvider$State;

    .line 174
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getSampleRate()I

    move-result v0

    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getChannelCount()I

    move-result v2

    .line 175
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioFormat()I

    move-result v3

    .line 174
    invoke-static {v0, v2, v3}, Landroidx/camera/video/internal/AudioSource;->isSettingsSupported(III)Z

    move-result v0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v0, :cond_5

    .line 183
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getSampleRate()I

    move-result v0

    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getChannelCount()I

    move-result v4

    .line 184
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioFormat()I

    move-result v5

    .line 183
    invoke-static {v0, v4, v5}, Landroidx/camera/video/internal/AudioSource;->getMinBufferSize(III)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v1, 0x1

    .line 187
    :cond_0
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 189
    invoke-static {p2}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object p2

    iput-object p2, p0, Landroidx/camera/video/internal/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    mul-int/lit8 v9, v0, 0x2

    .line 190
    iput v9, p0, Landroidx/camera/video/internal/AudioSource;->mBufferSize:I

    .line 191
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getSampleRate()I

    move-result v0

    iput v0, p0, Landroidx/camera/video/internal/AudioSource;->mSampleRate:I

    .line 193
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioFormat()I

    move-result v0

    .line 194
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getChannelCount()I

    move-result v1

    .line 193
    invoke-static {v0, v1}, Landroidx/camera/video/internal/AudioSource;->getBytesPerFrame(II)I

    move-result v0

    iput v0, p0, Landroidx/camera/video/internal/AudioSource;->mBytesPerFrame:I

    .line 195
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_2

    .line 196
    new-instance v0, Landroid/media/AudioFormat$Builder;

    invoke-direct {v0}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 197
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getSampleRate()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 198
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getChannelCount()I

    move-result v1

    invoke-static {v1}, Landroidx/camera/video/internal/AudioSource;->channelCountToChannelMask(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 199
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioFormat()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 200
    invoke-virtual {v0}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    move-result-object v0

    .line 201
    invoke-static {}, Landroidx/camera/video/internal/compat/Api23Impl;->createAudioRecordBuilder()Landroid/media/AudioRecord$Builder;

    move-result-object v1

    .line 202
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1f

    if-lt v2, v4, :cond_1

    if-eqz p3, :cond_1

    .line 203
    invoke-static {v1, p3}, Landroidx/camera/video/internal/compat/Api31Impl;->setContext(Landroid/media/AudioRecord$Builder;Landroid/content/Context;)V

    .line 205
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioSource()I

    move-result p1

    invoke-static {v1, p1}, Landroidx/camera/video/internal/compat/Api23Impl;->setAudioSource(Landroid/media/AudioRecord$Builder;I)V

    .line 206
    invoke-static {v1, v0}, Landroidx/camera/video/internal/compat/Api23Impl;->setAudioFormat(Landroid/media/AudioRecord$Builder;Landroid/media/AudioFormat;)V

    .line 207
    invoke-static {v1, v9}, Landroidx/camera/video/internal/compat/Api23Impl;->setBufferSizeInBytes(Landroid/media/AudioRecord$Builder;I)V

    .line 208
    invoke-static {v1}, Landroidx/camera/video/internal/compat/Api23Impl;->build(Landroid/media/AudioRecord$Builder;)Landroid/media/AudioRecord;

    move-result-object p1

    iput-object p1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    goto :goto_0

    .line 210
    :cond_2
    new-instance p3, Landroid/media/AudioRecord;

    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioSource()I

    move-result v5

    .line 211
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getSampleRate()I

    move-result v6

    .line 212
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getChannelCount()I

    move-result v0

    invoke-static {v0}, Landroidx/camera/video/internal/AudioSource;->channelCountToChannelConfig(I)I

    move-result v7

    .line 213
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioFormat()I

    move-result v8

    move-object v4, p3

    invoke-direct/range {v4 .. v9}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object p3, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    :goto_0
    iget-object p1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {p1}, Landroid/media/AudioRecord;->getState()I

    move-result p1

    if-ne p1, v3, :cond_4

    .line 225
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x1d

    if-lt p1, p3, :cond_3

    .line 226
    new-instance p1, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;

    invoke-direct {p1, p0}, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;-><init>(Landroidx/camera/video/internal/AudioSource;)V

    iput-object p1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

    .line 227
    iget-object p3, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-static {p3, p2, p1}, Landroidx/camera/video/internal/compat/Api29Impl;->registerAudioRecordingCallback(Landroid/media/AudioRecord;Ljava/util/concurrent/Executor;Landroid/media/AudioManager$AudioRecordingCallback;)V

    :cond_3
    return-void

    .line 221
    :cond_4
    iget-object p1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {p1}, Landroid/media/AudioRecord;->release()V

    .line 222
    new-instance p1, Landroidx/camera/video/internal/AudioSourceAccessException;

    const-string p2, "Unable to initialize AudioRecord"

    invoke-direct {p1, p2}, Landroidx/camera/video/internal/AudioSourceAccessException;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_0
    move-exception p1

    .line 217
    new-instance p2, Landroidx/camera/video/internal/AudioSourceAccessException;

    const-string p3, "Unable to create AudioRecord"

    invoke-direct {p2, p3, p1}, Landroidx/camera/video/internal/AudioSourceAccessException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 176
    :cond_5
    new-instance p2, Ljava/lang/UnsupportedOperationException;

    const/4 p3, 0x3

    new-array p3, p3, [Ljava/lang/Object;

    .line 179
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getSampleRate()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p3, v1

    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getChannelCount()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p3, v3

    .line 180
    invoke-virtual {p1}, Landroidx/camera/video/internal/AudioSource$Settings;->getAudioFormat()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, p3, v2

    const-string p1, "The combination of sample rate %d, channel count %d and audio format %d is not supported."

    .line 176
    invoke-static {p1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private static channelCountToChannelConfig(I)I
    .locals 1

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    const/16 p0, 0x10

    goto :goto_0

    :cond_0
    const/16 p0, 0xc

    :goto_0
    return p0
.end method

.method private static channelCountToChannelMask(I)I
    .locals 1

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    const/16 p0, 0x10

    goto :goto_0

    :cond_0
    const/16 p0, 0xc

    :goto_0
    return p0
.end method

.method private static computeInterpolatedTimeUs(IJLandroid/media/AudioTimestamp;)J
    .locals 3

    .line 558
    iget-wide v0, p3, Landroid/media/AudioTimestamp;->framePosition:J

    sub-long/2addr p1, v0

    .line 559
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    mul-long v0, v0, p1

    int-to-long p0, p0

    div-long/2addr v0, p0

    .line 560
    iget-wide p0, p3, Landroid/media/AudioTimestamp;->nanoTime:J

    add-long/2addr p0, v0

    const-wide/16 p2, 0x0

    cmp-long v0, p0, p2

    if-gez v0, :cond_0

    goto :goto_0

    .line 562
    :cond_0
    sget-object p2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide p2

    :goto_0
    return-wide p2
.end method

.method private static getBytesPerFrame(II)I
    .locals 3

    if-lez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 590
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    const/4 v0, 0x2

    if-eq p0, v0, :cond_5

    const/4 v0, 0x3

    if-eq p0, v0, :cond_4

    const/4 v1, 0x4

    if-eq p0, v1, :cond_3

    const/16 v2, 0x15

    if-eq p0, v2, :cond_2

    const/16 v0, 0x16

    if-ne p0, v0, :cond_1

    goto :goto_1

    .line 603
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid audio format: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    mul-int/lit8 p1, p1, 0x3

    return p1

    :cond_3
    :goto_1
    mul-int/lit8 p1, p1, 0x4

    :cond_4
    return p1

    :cond_5
    mul-int/lit8 p1, p1, 0x2

    return p1
.end method

.method private static getMinBufferSize(III)I
    .locals 0

    .line 585
    invoke-static {p1}, Landroidx/camera/video/internal/AudioSource;->channelCountToChannelConfig(I)I

    move-result p1

    invoke-static {p0, p1, p2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result p0

    return p0
.end method

.method private static hasAudioTimestampQuirk()Z
    .locals 1

    .line 553
    const-class v0, Landroidx/camera/video/internal/compat/quirk/AudioTimestampFramePositionIncorrectQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSettingsSupported(III)Z
    .locals 1

    const/4 v0, 0x0

    if-lez p0, :cond_1

    if-gtz p1, :cond_0

    goto :goto_0

    .line 570
    :cond_0
    invoke-static {p0, p1, p2}, Landroidx/camera/video/internal/AudioSource;->getMinBufferSize(III)I

    move-result p0

    if-lez p0, :cond_1

    const/4 v0, 0x1

    :cond_1
    :goto_0
    return v0
.end method

.method private resetBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/internal/BufferProvider<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;)V"
        }
    .end annotation

    .line 391
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    if-eqz v0, :cond_0

    .line 392
    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mStateObserver:Landroidx/camera/core/impl/Observable$Observer;

    invoke-interface {v0, v1}, Landroidx/camera/video/internal/BufferProvider;->removeObserver(Landroidx/camera/core/impl/Observable$Observer;)V

    const/4 v0, 0x0

    .line 393
    iput-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    .line 394
    iput-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mStateObserver:Landroidx/camera/core/impl/Observable$Observer;

    .line 395
    iput-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mAcquireBufferCallback:Landroidx/camera/core/impl/utils/futures/FutureCallback;

    .line 397
    :cond_0
    sget-object v0, Landroidx/camera/video/internal/BufferProvider$State;->INACTIVE:Landroidx/camera/video/internal/BufferProvider$State;

    iput-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mBufferProviderState:Landroidx/camera/video/internal/BufferProvider$State;

    .line 398
    invoke-virtual {p0}, Landroidx/camera/video/internal/AudioSource;->updateSendingAudio()V

    if-eqz p1, :cond_1

    .line 400
    iput-object p1, p0, Landroidx/camera/video/internal/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    .line 401
    new-instance v0, Landroidx/camera/video/internal/AudioSource$1;

    invoke-direct {v0, p0, p1}, Landroidx/camera/video/internal/AudioSource$1;-><init>(Landroidx/camera/video/internal/AudioSource;Landroidx/camera/video/internal/BufferProvider;)V

    iput-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mStateObserver:Landroidx/camera/core/impl/Observable$Observer;

    .line 422
    new-instance v0, Landroidx/camera/video/internal/AudioSource$2;

    invoke-direct {v0, p0, p1}, Landroidx/camera/video/internal/AudioSource$2;-><init>(Landroidx/camera/video/internal/AudioSource;Landroidx/camera/video/internal/BufferProvider;)V

    iput-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mAcquireBufferCallback:Landroidx/camera/core/impl/utils/futures/FutureCallback;

    .line 455
    iget-object p1, p0, Landroidx/camera/video/internal/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mStateObserver:Landroidx/camera/core/impl/Observable$Observer;

    invoke-interface {p1, v0, v1}, Landroidx/camera/video/internal/BufferProvider;->addObserver(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V

    :cond_1
    return-void
.end method

.method private startSendingAudio()V
    .locals 4

    const-string v0, "AudioSource"

    .line 478
    iget-boolean v1, p0, Landroidx/camera/video/internal/AudioSource;->mIsSendingAudio:Z

    if-eqz v1, :cond_0

    return-void

    :cond_0
    :try_start_0
    const-string v1, "startSendingAudio"

    .line 483
    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->startRecording()V

    .line 485
    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result v1
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    const-wide/16 v0, 0x0

    .line 495
    iput-wide v0, p0, Landroidx/camera/video/internal/AudioSource;->mTotalFramesRead:J

    const/4 v0, 0x1

    .line 496
    iput-boolean v0, p0, Landroidx/camera/video/internal/AudioSource;->mIsSendingAudio:Z

    .line 497
    invoke-virtual {p0}, Landroidx/camera/video/internal/AudioSource;->sendNextAudio()V

    return-void

    .line 486
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to start AudioRecord with state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    .line 487
    invoke-virtual {v3}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v1

    const-string v2, "Failed to start AudioRecord"

    .line 490
    invoke-static {v0, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 491
    sget-object v0, Landroidx/camera/video/internal/AudioSource$InternalState;->CONFIGURED:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/AudioSource;->setState(Landroidx/camera/video/internal/AudioSource$InternalState;)V

    .line 492
    new-instance v0, Landroidx/camera/video/internal/AudioSourceAccessException;

    const-string v2, "Unable to start the audio record."

    invoke-direct {v0, v2, v1}, Landroidx/camera/video/internal/AudioSourceAccessException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/AudioSource;->notifyError(Ljava/lang/Throwable;)V

    return-void
.end method

.method private stopSendingAudio()V
    .locals 4

    const-string v0, "AudioSource"

    .line 502
    iget-boolean v1, p0, Landroidx/camera/video/internal/AudioSource;->mIsSendingAudio:Z

    if-nez v1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 506
    iput-boolean v1, p0, Landroidx/camera/video/internal/AudioSource;->mIsSendingAudio:Z

    :try_start_0
    const-string v1, "stopSendingAudio"

    .line 508
    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->stop()V

    .line 510
    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    goto :goto_0

    .line 511
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to stop AudioRecord with state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    .line 512
    invoke-virtual {v3}, Landroid/media/AudioRecord;->getRecordingState()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    const-string v2, "Failed to stop AudioRecord"

    .line 515
    invoke-static {v0, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 516
    invoke-virtual {p0, v1}, Landroidx/camera/video/internal/AudioSource;->notifyError(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method


# virtual methods
.method generatePresentationTimeUs()J
    .locals 6

    .line 536
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const-wide/16 v1, -0x1

    const/16 v3, 0x18

    if-lt v0, v3, :cond_1

    invoke-static {}, Landroidx/camera/video/internal/AudioSource;->hasAudioTimestampQuirk()Z

    move-result v0

    if-nez v0, :cond_1

    .line 537
    new-instance v0, Landroid/media/AudioTimestamp;

    invoke-direct {v0}, Landroid/media/AudioTimestamp;-><init>()V

    .line 538
    iget-object v3, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    const/4 v4, 0x0

    invoke-static {v3, v0, v4}, Landroidx/camera/video/internal/compat/Api24Impl;->getTimestamp(Landroid/media/AudioRecord;Landroid/media/AudioTimestamp;I)I

    move-result v3

    if-nez v3, :cond_0

    .line 540
    iget v3, p0, Landroidx/camera/video/internal/AudioSource;->mSampleRate:I

    iget-wide v4, p0, Landroidx/camera/video/internal/AudioSource;->mTotalFramesRead:J

    invoke-static {v3, v4, v5, v0}, Landroidx/camera/video/internal/AudioSource;->computeInterpolatedTimeUs(IJLandroid/media/AudioTimestamp;)J

    move-result-wide v3

    goto :goto_0

    :cond_0
    const-string v0, "AudioSource"

    const-string v3, "Unable to get audio timestamp"

    .line 543
    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    move-wide v3, v1

    :goto_0
    cmp-long v0, v3, v1

    if-nez v0, :cond_2

    .line 547
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide v3

    :cond_2
    return-wide v3
.end method

.method synthetic lambda$notifyError$6$androidx-camera-video-internal-AudioSource(Ljava/lang/Throwable;)V
    .locals 1

    .line 462
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;

    invoke-interface {v0, p1}, Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;->onError(Ljava/lang/Throwable;)V

    return-void
.end method

.method synthetic lambda$release$3$androidx-camera-video-internal-AudioSource(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 3

    .line 337
    :try_start_0
    sget-object v0, Landroidx/camera/video/internal/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mState:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 341
    :cond_0
    invoke-direct {p0, v2}, Landroidx/camera/video/internal/AudioSource;->resetBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V

    .line 342
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1

    .line 343
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecordingCallback:Landroid/media/AudioManager$AudioRecordingCallback;

    invoke-static {v0, v1}, Landroidx/camera/video/internal/compat/Api29Impl;->unregisterAudioRecordingCallback(Landroid/media/AudioRecord;Landroid/media/AudioManager$AudioRecordingCallback;)V

    .line 346
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 347
    invoke-direct {p0}, Landroidx/camera/video/internal/AudioSource;->stopSendingAudio()V

    .line 348
    sget-object v0, Landroidx/camera/video/internal/AudioSource$InternalState;->RELEASED:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/AudioSource;->setState(Landroidx/camera/video/internal/AudioSource$InternalState;)V

    .line 354
    :goto_0
    invoke-virtual {p1, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 356
    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    :goto_1
    return-void
.end method

.method synthetic lambda$release$4$androidx-camera-video-internal-AudioSource(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 335
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/video/internal/AudioSource;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    const-string p1, "AudioSource-release"

    return-object p1
.end method

.method synthetic lambda$setAudioSourceCallback$5$androidx-camera-video-internal-AudioSource(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;)V
    .locals 2

    .line 375
    sget-object v0, Landroidx/camera/video/internal/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mState:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 p1, 0x2

    if-eq v0, p1, :cond_0

    const/4 p1, 0x3

    if-eq v0, p1, :cond_0

    goto :goto_0

    .line 383
    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "The audio recording callback must be registered before the audio source is started."

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 377
    :cond_1
    iput-object p1, p0, Landroidx/camera/video/internal/AudioSource;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 378
    iput-object p2, p0, Landroidx/camera/video/internal/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;

    :goto_0
    return-void
.end method

.method synthetic lambda$setBufferProvider$0$androidx-camera-video-internal-AudioSource(Landroidx/camera/video/internal/BufferProvider;)V
    .locals 2

    .line 265
    sget-object v0, Landroidx/camera/video/internal/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mState:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 p1, 0x3

    if-eq v0, p1, :cond_0

    goto :goto_0

    .line 274
    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    const-string v0, "AudioRecorder is released"

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 269
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    if-eq v0, p1, :cond_2

    .line 270
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/AudioSource;->resetBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V

    :cond_2
    :goto_0
    return-void
.end method

.method synthetic lambda$start$1$androidx-camera-video-internal-AudioSource()V
    .locals 2

    .line 291
    sget-object v0, Landroidx/camera/video/internal/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mState:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 300
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "AudioRecorder is released"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 293
    :cond_1
    sget-object v0, Landroidx/camera/video/internal/AudioSource$InternalState;->STARTED:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/AudioSource;->setState(Landroidx/camera/video/internal/AudioSource$InternalState;)V

    .line 294
    invoke-virtual {p0}, Landroidx/camera/video/internal/AudioSource;->updateSendingAudio()V

    :goto_0
    return-void
.end method

.method synthetic lambda$stop$2$androidx-camera-video-internal-AudioSource()V
    .locals 2

    .line 312
    sget-object v0, Landroidx/camera/video/internal/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mState:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "AudioSource"

    const-string v1, "AudioRecorder is released. Calling stop() is a no-op."

    .line 321
    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 314
    :cond_1
    sget-object v0, Landroidx/camera/video/internal/AudioSource$InternalState;->CONFIGURED:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/AudioSource;->setState(Landroidx/camera/video/internal/AudioSource$InternalState;)V

    .line 315
    invoke-virtual {p0}, Landroidx/camera/video/internal/AudioSource;->updateSendingAudio()V

    :goto_0
    return-void
.end method

.method notifyError(Ljava/lang/Throwable;)V
    .locals 2

    .line 461
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;

    if-eqz v1, :cond_0

    .line 462
    new-instance v1, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/video/internal/AudioSource;Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public release()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 334
    new-instance v0, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/internal/AudioSource;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method sendNextAudio()V
    .locals 3

    .line 523
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    invoke-interface {v0}, Landroidx/camera/video/internal/BufferProvider;->acquireBuffer()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mAcquireBufferCallback:Landroidx/camera/core/impl/utils/futures/FutureCallback;

    iget-object v2, p0, Landroidx/camera/video/internal/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public setAudioSourceCallback(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;)V
    .locals 2

    .line 374
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/video/internal/AudioSource;Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/internal/BufferProvider<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;)V"
        }
    .end annotation

    .line 264
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/video/internal/AudioSource;Landroidx/camera/video/internal/BufferProvider;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method setState(Landroidx/camera/video/internal/AudioSource$InternalState;)V
    .locals 2

    .line 529
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Transitioning internal state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/video/internal/AudioSource;->mState:Landroidx/camera/video/internal/AudioSource$InternalState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioSource"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    iput-object p1, p0, Landroidx/camera/video/internal/AudioSource;->mState:Landroidx/camera/video/internal/AudioSource$InternalState;

    return-void
.end method

.method public start()V
    .locals 2

    .line 290
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/video/internal/AudioSource;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public stop()V
    .locals 2

    .line 311
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/AudioSource$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/internal/AudioSource;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method updateSendingAudio()V
    .locals 2

    .line 469
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mState:Landroidx/camera/video/internal/AudioSource$InternalState;

    sget-object v1, Landroidx/camera/video/internal/AudioSource$InternalState;->STARTED:Landroidx/camera/video/internal/AudioSource$InternalState;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource;->mBufferProviderState:Landroidx/camera/video/internal/BufferProvider$State;

    sget-object v1, Landroidx/camera/video/internal/BufferProvider$State;->ACTIVE:Landroidx/camera/video/internal/BufferProvider$State;

    if-ne v0, v1, :cond_0

    .line 470
    invoke-direct {p0}, Landroidx/camera/video/internal/AudioSource;->startSendingAudio()V

    goto :goto_0

    .line 472
    :cond_0
    invoke-direct {p0}, Landroidx/camera/video/internal/AudioSource;->stopSendingAudio()V

    :goto_0
    return-void
.end method
