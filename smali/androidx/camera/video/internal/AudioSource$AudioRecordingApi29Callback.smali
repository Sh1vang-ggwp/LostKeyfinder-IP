.class Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;
.super Landroid/media/AudioManager$AudioRecordingCallback;
.source "AudioSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/AudioSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AudioRecordingApi29Callback"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/video/internal/AudioSource;


# direct methods
.method constructor <init>(Landroidx/camera/video/internal/AudioSource;)V
    .locals 0

    .line 234
    iput-object p1, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/AudioSource;

    invoke-direct {p0}, Landroid/media/AudioManager$AudioRecordingCallback;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onRecordingConfigChanged$0$androidx-camera-video-internal-AudioSource$AudioRecordingApi29Callback(Z)V
    .locals 1

    .line 245
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/AudioSource;

    iget-object v0, v0, Landroidx/camera/video/internal/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;

    invoke-interface {v0, p1}, Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;->onSilenced(Z)V

    return-void
.end method

.method public onRecordingConfigChanged(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/media/AudioRecordingConfiguration;",
            ">;)V"
        }
    .end annotation

    .line 237
    invoke-super {p0, p1}, Landroid/media/AudioManager$AudioRecordingCallback;->onRecordingConfigChanged(Ljava/util/List;)V

    .line 238
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/AudioSource;

    iget-object v0, v0, Landroidx/camera/video/internal/AudioSource;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/AudioSource;

    iget-object v0, v0, Landroidx/camera/video/internal/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/AudioSource$AudioSourceCallback;

    if-eqz v0, :cond_1

    .line 239
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioRecordingConfiguration;

    .line 240
    invoke-static {v0}, Landroidx/camera/video/internal/compat/Api24Impl;->getClientAudioSessionId(Landroid/media/AudioRecordingConfiguration;)I

    move-result v1

    iget-object v2, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/AudioSource;

    iget-object v2, v2, Landroidx/camera/video/internal/AudioSource;->mAudioRecord:Landroid/media/AudioRecord;

    .line 241
    invoke-virtual {v2}, Landroid/media/AudioRecord;->getAudioSessionId()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 242
    invoke-static {v0}, Landroidx/camera/video/internal/compat/Api29Impl;->isClientSilenced(Landroid/media/AudioRecordingConfiguration;)Z

    move-result p1

    .line 243
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/AudioSource;

    iget-object v0, v0, Landroidx/camera/video/internal/AudioSource;->mSourceSilence:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eq v0, p1, :cond_1

    .line 244
    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/AudioSource;

    iget-object v0, v0, Landroidx/camera/video/internal/AudioSource;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;Z)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method
