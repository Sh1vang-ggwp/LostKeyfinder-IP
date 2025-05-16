.class interface abstract Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
.super Ljava/lang/Object;
.source "Recorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/Recorder$RecordingRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "AudioSourceSupplier"
.end annotation


# virtual methods
.method public abstract get(Landroidx/camera/video/internal/AudioSource$Settings;Ljava/util/concurrent/Executor;)Landroidx/camera/video/internal/AudioSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/AudioSourceAccessException;
        }
    .end annotation
.end method
