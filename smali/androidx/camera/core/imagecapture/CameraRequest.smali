.class public final Landroidx/camera/core/imagecapture/CameraRequest;
.super Ljava/lang/Object;
.source "CameraRequest.java"


# instance fields
.field private final mCallback:Landroidx/camera/core/imagecapture/TakePictureCallback;

.field private final mCaptureConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Landroidx/camera/core/imagecapture/TakePictureCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;",
            "Landroidx/camera/core/imagecapture/TakePictureCallback;",
            ")V"
        }
    .end annotation

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Landroidx/camera/core/imagecapture/CameraRequest;->mCaptureConfigs:Ljava/util/List;

    .line 43
    iput-object p2, p0, Landroidx/camera/core/imagecapture/CameraRequest;->mCallback:Landroidx/camera/core/imagecapture/TakePictureCallback;

    return-void
.end method


# virtual methods
.method getCaptureConfigs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CameraRequest;->mCaptureConfigs:Ljava/util/List;

    return-object v0
.end method

.method onCaptureFailure(Landroidx/camera/core/ImageCaptureException;)V
    .locals 1

    .line 53
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 54
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CameraRequest;->mCallback:Landroidx/camera/core/imagecapture/TakePictureCallback;

    invoke-interface {v0, p1}, Landroidx/camera/core/imagecapture/TakePictureCallback;->onCaptureFailure(Landroidx/camera/core/ImageCaptureException;)V

    return-void
.end method
