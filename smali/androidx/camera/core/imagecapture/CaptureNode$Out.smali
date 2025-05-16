.class abstract Landroidx/camera/core/imagecapture/CaptureNode$Out;
.super Ljava/lang/Object;
.source "CaptureNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/imagecapture/CaptureNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Out"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 266
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static of(I)Landroidx/camera/core/imagecapture/CaptureNode$Out;
    .locals 3

    .line 286
    new-instance v0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;

    new-instance v1, Landroidx/camera/core/processing/Edge;

    invoke-direct {v1}, Landroidx/camera/core/processing/Edge;-><init>()V

    new-instance v2, Landroidx/camera/core/processing/Edge;

    invoke-direct {v2}, Landroidx/camera/core/processing/Edge;-><init>()V

    invoke-direct {v0, v1, v2, p0}, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;-><init>(Landroidx/camera/core/processing/Edge;Landroidx/camera/core/processing/Edge;I)V

    return-object v0
.end method


# virtual methods
.method abstract getFormat()I
.end method

.method abstract getImageEdge()Landroidx/camera/core/processing/Edge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/processing/Edge<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation
.end method

.method abstract getRequestEdge()Landroidx/camera/core/processing/Edge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/processing/Edge<",
            "Landroidx/camera/core/imagecapture/ProcessingRequest;",
            ">;"
        }
    .end annotation
.end method
