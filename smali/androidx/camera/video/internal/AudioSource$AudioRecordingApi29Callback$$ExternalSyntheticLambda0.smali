.class public final synthetic Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;

    iput-boolean p2, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback$$ExternalSyntheticLambda0;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;

    iget-boolean v1, p0, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback$$ExternalSyntheticLambda0;->f$1:Z

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/AudioSource$AudioRecordingApi29Callback;->lambda$onRecordingConfigChanged$0$androidx-camera-video-internal-AudioSource$AudioRecordingApi29Callback(Z)V

    return-void
.end method
