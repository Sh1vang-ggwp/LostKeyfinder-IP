.class public final Landroidx/camera/camera2/internal/StreamUseCaseUtil;
.super Ljava/lang/Object;
.source "StreamUseCaseUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getStreamUseCaseFromUseCaseConfigs(Ljava/util/Collection;Ljava/util/Collection;)J
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/SessionConfig;",
            ">;)J"
        }
    .end annotation

    .line 56
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-ge v0, v1, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    .line 59
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_1

    return-wide v1

    .line 63
    :cond_1
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/SessionConfig;

    .line 64
    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig;->getTemplateType()I

    move-result v0

    const/4 v3, 0x5

    if-ne v0, v3, :cond_2

    return-wide v1

    .line 70
    :cond_3
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 p1, 0x1

    const/4 v0, 0x0

    const/4 v3, 0x0

    :cond_4
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/UseCaseConfig;

    .line 71
    instance-of v5, v4, Landroidx/camera/core/impl/ImageAnalysisConfig;

    if-eqz v5, :cond_5

    return-wide v1

    .line 76
    :cond_5
    instance-of v5, v4, Landroidx/camera/core/impl/PreviewConfig;

    if-eqz v5, :cond_6

    const/4 v3, 0x1

    goto :goto_0

    .line 81
    :cond_6
    instance-of v4, v4, Landroidx/camera/core/impl/ImageCaptureConfig;

    if-eqz v4, :cond_4

    const/4 v0, 0x1

    goto :goto_0

    :cond_7
    if-eqz v0, :cond_8

    const-wide/16 p0, 0x2

    return-wide p0

    :cond_8
    if-nez v3, :cond_9

    return-wide v1

    :cond_9
    const-wide/16 p0, 0x1

    return-wide p0
.end method
