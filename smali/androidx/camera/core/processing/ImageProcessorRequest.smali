.class public Landroidx/camera/core/processing/ImageProcessorRequest;
.super Ljava/lang/Object;
.source "ImageProcessorRequest.java"

# interfaces
.implements Landroidx/camera/core/ImageProcessor$Request;


# instance fields
.field private final mImageProxies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation
.end field

.field private final mOutputFormat:I


# direct methods
.method public constructor <init>(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/ImageProxy;",
            ">;I)V"
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Landroidx/camera/core/processing/ImageProcessorRequest;->mImageProxies:Ljava/util/List;

    .line 40
    iput p2, p0, Landroidx/camera/core/processing/ImageProcessorRequest;->mOutputFormat:I

    return-void
.end method


# virtual methods
.method public getInputImages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Landroidx/camera/core/processing/ImageProcessorRequest;->mImageProxies:Ljava/util/List;

    return-object v0
.end method

.method public getOutputFormat()I
    .locals 1

    .line 51
    iget v0, p0, Landroidx/camera/core/processing/ImageProcessorRequest;->mOutputFormat:I

    return v0
.end method
