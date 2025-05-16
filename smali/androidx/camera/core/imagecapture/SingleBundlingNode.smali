.class Landroidx/camera/core/imagecapture/SingleBundlingNode;
.super Ljava/lang/Object;
.source "SingleBundlingNode.java"

# interfaces
.implements Landroidx/camera/core/imagecapture/BundlingNode;


# instance fields
.field private mOutputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

.field private mPendingRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;


# direct methods
.method public static synthetic $r8$lambda$1nFWaQDaSUhXraEQ9fB6e1Auksw(Landroidx/camera/core/imagecapture/SingleBundlingNode;Landroidx/camera/core/imagecapture/ProcessingRequest;)V
    .locals 0

    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/SingleBundlingNode;->trackIncomingRequest(Landroidx/camera/core/imagecapture/ProcessingRequest;)V

    return-void
.end method

.method public static synthetic $r8$lambda$SxoehQYbSdImw8VxrENRLCChLrc(Landroidx/camera/core/imagecapture/SingleBundlingNode;Landroidx/camera/core/ImageProxy;)V
    .locals 0

    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/SingleBundlingNode;->matchImageWithRequest(Landroidx/camera/core/ImageProxy;)V

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private matchImageWithRequest(Landroidx/camera/core/ImageProxy;)V
    .locals 4

    .line 71
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 72
    iget-object v0, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode;->mPendingRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 74
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/ImageInfo;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v0

    iget-object v3, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode;->mPendingRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 75
    invoke-virtual {v3}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getTagBundleKey()Ljava/lang/String;

    move-result-object v3

    .line 74
    invoke-virtual {v0, v3}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 73
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 76
    iget-object v3, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode;->mPendingRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    invoke-virtual {v3}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getStageIds()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v0, v3, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 78
    iget-object v0, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode;->mOutputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode;->mPendingRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 79
    invoke-static {v1, p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->of(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    move-result-object p1

    .line 78
    invoke-virtual {v0, p1}, Landroidx/camera/core/processing/Edge;->accept(Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 80
    iput-object p1, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode;->mPendingRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    return-void
.end method

.method private trackIncomingRequest(Landroidx/camera/core/imagecapture/ProcessingRequest;)V
    .locals 4

    .line 61
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 62
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getStageIds()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v3, "Cannot handle multi-image capture."

    invoke-static {v0, v3}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 64
    iget-object v0, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode;->mPendingRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-nez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    const-string v0, "Already has an existing request."

    invoke-static {v1, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 66
    iput-object p1, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode;->mPendingRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    return-void
.end method


# virtual methods
.method public release()V
    .locals 0

    return-void
.end method

.method public transform(Landroidx/camera/core/imagecapture/CaptureNode$Out;)Landroidx/camera/core/imagecapture/ProcessingNode$In;
    .locals 2

    .line 47
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->getImageEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/SingleBundlingNode$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/camera/core/imagecapture/SingleBundlingNode$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/imagecapture/SingleBundlingNode;)V

    invoke-virtual {v0, v1}, Landroidx/camera/core/processing/Edge;->setListener(Landroidx/core/util/Consumer;)V

    .line 48
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->getRequestEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/SingleBundlingNode$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/core/imagecapture/SingleBundlingNode$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/imagecapture/SingleBundlingNode;)V

    invoke-virtual {v0, v1}, Landroidx/camera/core/processing/Edge;->setListener(Landroidx/core/util/Consumer;)V

    .line 50
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->getFormat()I

    move-result p1

    invoke-static {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->of(I)Landroidx/camera/core/imagecapture/ProcessingNode$In;

    move-result-object p1

    iput-object p1, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode;->mOutputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    return-object p1
.end method

.method public bridge synthetic transform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 37
    check-cast p1, Landroidx/camera/core/imagecapture/CaptureNode$Out;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/SingleBundlingNode;->transform(Landroidx/camera/core/imagecapture/CaptureNode$Out;)Landroidx/camera/core/imagecapture/ProcessingNode$In;

    move-result-object p1

    return-object p1
.end method
