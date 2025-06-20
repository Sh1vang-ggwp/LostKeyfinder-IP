.class final Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;
.super Landroidx/camera/video/Recorder$RecordingRecord;
.source "AutoValue_Recorder_RecordingRecord.java"


# instance fields
.field private final getCallbackExecutor:Ljava/util/concurrent/Executor;

.field private final getEventListener:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;"
        }
    .end annotation
.end field

.field private final getOutputOptions:Landroidx/camera/video/OutputOptions;

.field private final getRecordingId:J

.field private final hasAudioEnabled:Z


# direct methods
.method constructor <init>(Landroidx/camera/video/OutputOptions;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;ZJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/OutputOptions;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;ZJ)V"
        }
    .end annotation

    .line 28
    invoke-direct {p0}, Landroidx/camera/video/Recorder$RecordingRecord;-><init>()V

    const-string v0, "Null getOutputOptions"

    .line 30
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    iput-object p1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getOutputOptions:Landroidx/camera/video/OutputOptions;

    .line 33
    iput-object p2, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 34
    iput-object p3, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getEventListener:Landroidx/core/util/Consumer;

    .line 35
    iput-boolean p4, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->hasAudioEnabled:Z

    .line 36
    iput-wide p5, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getRecordingId:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 83
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/Recorder$RecordingRecord;

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    .line 84
    check-cast p1, Landroidx/camera/video/Recorder$RecordingRecord;

    .line 85
    iget-object v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getOutputOptions:Landroidx/camera/video/OutputOptions;

    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getCallbackExecutor:Ljava/util/concurrent/Executor;

    if-nez v1, :cond_1

    .line 86
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :goto_0
    iget-object v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getEventListener:Landroidx/core/util/Consumer;

    if-nez v1, :cond_2

    .line 87
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getEventListener()Landroidx/core/util/Consumer;

    move-result-object v1

    if-nez v1, :cond_3

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getEventListener()Landroidx/core/util/Consumer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :goto_1
    iget-boolean v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->hasAudioEnabled:Z

    .line 88
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->hasAudioEnabled()Z

    move-result v3

    if-ne v1, v3, :cond_3

    iget-wide v3, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getRecordingId:J

    .line 89
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getRecordingId()J

    move-result-wide v5

    cmp-long p1, v3, v5

    if-nez p1, :cond_3

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    return v0

    :cond_4
    return v2
.end method

.method getCallbackExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 48
    iget-object v0, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getCallbackExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method getEventListener()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getEventListener:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method getOutputOptions()Landroidx/camera/video/OutputOptions;
    .locals 1

    .line 42
    iget-object v0, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getOutputOptions:Landroidx/camera/video/OutputOptions;

    return-object v0
.end method

.method getRecordingId()J
    .locals 2

    .line 64
    iget-wide v0, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getRecordingId:J

    return-wide v0
.end method

.method hasAudioEnabled()Z
    .locals 1

    .line 59
    iget-boolean v0, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->hasAudioEnabled:Z

    return v0
.end method

.method public hashCode()I
    .locals 5

    .line 98
    iget-object v0, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getOutputOptions:Landroidx/camera/video/OutputOptions;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 100
    iget-object v2, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getCallbackExecutor:Ljava/util/concurrent/Executor;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_0
    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 102
    iget-object v2, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getEventListener:Landroidx/core/util/Consumer;

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_1
    xor-int/2addr v0, v3

    mul-int v0, v0, v1

    .line 104
    iget-boolean v2, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->hasAudioEnabled:Z

    if-eqz v2, :cond_2

    const/16 v2, 0x4cf

    goto :goto_2

    :cond_2
    const/16 v2, 0x4d5

    :goto_2
    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 106
    iget-wide v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getRecordingId:J

    const/16 v3, 0x20

    ushr-long v3, v1, v3

    xor-long/2addr v1, v3

    long-to-int v2, v1

    xor-int/2addr v0, v2

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "RecordingRecord{getOutputOptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getOutputOptions:Landroidx/camera/video/OutputOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", getCallbackExecutor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getCallbackExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", getEventListener="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getEventListener:Landroidx/core/util/Consumer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", hasAudioEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->hasAudioEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", getRecordingId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;->getRecordingId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
