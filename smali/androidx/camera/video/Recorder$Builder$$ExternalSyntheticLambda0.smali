.class public final synthetic Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Consumer;


# instance fields
.field public final synthetic f$0:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda0;->f$0:I

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget v0, p0, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda0;->f$0:I

    check-cast p1, Landroidx/camera/video/AudioSpec$Builder;

    invoke-static {v0, p1}, Landroidx/camera/video/Recorder$Builder;->lambda$setAudioSource$2(ILandroidx/camera/video/AudioSpec$Builder;)V

    return-void
.end method
