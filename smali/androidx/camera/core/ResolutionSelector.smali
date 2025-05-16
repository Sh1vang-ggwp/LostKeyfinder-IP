.class public Landroidx/camera/core/ResolutionSelector;
.super Ljava/lang/Object;
.source "ResolutionSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/ResolutionSelector$Builder;
    }
.end annotation


# instance fields
.field private final mIsHighResolutionEnabled:Z

.field private final mMaxResolution:Landroid/util/Size;

.field private final mPreferredAspectRatio:I

.field private final mPreferredResolution:Landroid/util/Size;

.field private final mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;


# direct methods
.method constructor <init>(ILandroid/util/Size;Landroidx/camera/core/impl/SizeCoordinate;Landroid/util/Size;Z)V
    .locals 0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput p1, p0, Landroidx/camera/core/ResolutionSelector;->mPreferredAspectRatio:I

    .line 95
    iput-object p2, p0, Landroidx/camera/core/ResolutionSelector;->mPreferredResolution:Landroid/util/Size;

    .line 96
    iput-object p3, p0, Landroidx/camera/core/ResolutionSelector;->mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;

    .line 97
    iput-object p4, p0, Landroidx/camera/core/ResolutionSelector;->mMaxResolution:Landroid/util/Size;

    .line 98
    iput-boolean p5, p0, Landroidx/camera/core/ResolutionSelector;->mIsHighResolutionEnabled:Z

    return-void
.end method


# virtual methods
.method public getMaxResolution()Landroid/util/Size;
    .locals 1

    .line 142
    iget-object v0, p0, Landroidx/camera/core/ResolutionSelector;->mMaxResolution:Landroid/util/Size;

    return-object v0
.end method

.method public getPreferredAspectRatio()I
    .locals 1

    .line 109
    iget v0, p0, Landroidx/camera/core/ResolutionSelector;->mPreferredAspectRatio:I

    return v0
.end method

.method public getPreferredResolution()Landroid/util/Size;
    .locals 1

    .line 120
    iget-object v0, p0, Landroidx/camera/core/ResolutionSelector;->mPreferredResolution:Landroid/util/Size;

    return-object v0
.end method

.method public getSizeCoordinate()Landroidx/camera/core/impl/SizeCoordinate;
    .locals 1

    .line 131
    iget-object v0, p0, Landroidx/camera/core/ResolutionSelector;->mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;

    return-object v0
.end method

.method public isHighResolutionEnabled()Z
    .locals 1

    .line 152
    iget-boolean v0, p0, Landroidx/camera/core/ResolutionSelector;->mIsHighResolutionEnabled:Z

    return v0
.end method
