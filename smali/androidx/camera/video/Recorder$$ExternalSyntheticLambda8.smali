.class public final synthetic Landroidx/camera/video/Recorder$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/Recorder;

.field public final synthetic f$1:Landroidx/camera/video/internal/encoder/Encoder;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/internal/encoder/Encoder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda8;->f$0:Landroidx/camera/video/Recorder;

    iput-object p2, p0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda8;->f$1:Landroidx/camera/video/internal/encoder/Encoder;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda8;->f$0:Landroidx/camera/video/Recorder;

    iget-object v1, p0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda8;->f$1:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder;->lambda$stopInternal$15$androidx-camera-video-Recorder(Landroidx/camera/video/internal/encoder/Encoder;)V

    return-void
.end method
