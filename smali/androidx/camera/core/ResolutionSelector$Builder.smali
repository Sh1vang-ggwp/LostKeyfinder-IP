.class public final Landroidx/camera/core/ResolutionSelector$Builder;
.super Ljava/lang/Object;
.source "ResolutionSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/ResolutionSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mIsHighResolutionEnabled:Z

.field private mMaxResolution:Landroid/util/Size;

.field private mPreferredAspectRatio:I

.field private mPreferredResolution:Landroid/util/Size;

.field private mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 159
    iput v0, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredAspectRatio:I

    const/4 v1, 0x0

    .line 161
    iput-object v1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredResolution:Landroid/util/Size;

    .line 163
    sget-object v2, Landroidx/camera/core/impl/SizeCoordinate;->CAMERA_SENSOR:Landroidx/camera/core/impl/SizeCoordinate;

    iput-object v2, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;

    .line 165
    iput-object v1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mMaxResolution:Landroid/util/Size;

    .line 167
    iput-boolean v0, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mIsHighResolutionEnabled:Z

    return-void
.end method

.method private constructor <init>(Landroidx/camera/core/ResolutionSelector;)V
    .locals 3

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 159
    iput v0, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredAspectRatio:I

    const/4 v1, 0x0

    .line 161
    iput-object v1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredResolution:Landroid/util/Size;

    .line 163
    sget-object v2, Landroidx/camera/core/impl/SizeCoordinate;->CAMERA_SENSOR:Landroidx/camera/core/impl/SizeCoordinate;

    iput-object v2, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;

    .line 165
    iput-object v1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mMaxResolution:Landroid/util/Size;

    .line 167
    iput-boolean v0, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mIsHighResolutionEnabled:Z

    .line 176
    invoke-virtual {p1}, Landroidx/camera/core/ResolutionSelector;->getPreferredAspectRatio()I

    move-result v0

    iput v0, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredAspectRatio:I

    .line 177
    invoke-virtual {p1}, Landroidx/camera/core/ResolutionSelector;->getPreferredResolution()Landroid/util/Size;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredResolution:Landroid/util/Size;

    .line 178
    invoke-virtual {p1}, Landroidx/camera/core/ResolutionSelector;->getSizeCoordinate()Landroidx/camera/core/impl/SizeCoordinate;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;

    .line 179
    invoke-virtual {p1}, Landroidx/camera/core/ResolutionSelector;->getMaxResolution()Landroid/util/Size;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mMaxResolution:Landroid/util/Size;

    .line 180
    invoke-virtual {p1}, Landroidx/camera/core/ResolutionSelector;->isHighResolutionEnabled()Z

    move-result p1

    iput-boolean p1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mIsHighResolutionEnabled:Z

    return-void
.end method

.method public static fromSelector(Landroidx/camera/core/ResolutionSelector;)Landroidx/camera/core/ResolutionSelector$Builder;
    .locals 1

    .line 191
    new-instance v0, Landroidx/camera/core/ResolutionSelector$Builder;

    invoke-direct {v0, p0}, Landroidx/camera/core/ResolutionSelector$Builder;-><init>(Landroidx/camera/core/ResolutionSelector;)V

    return-object v0
.end method


# virtual methods
.method public build()Landroidx/camera/core/ResolutionSelector;
    .locals 7

    .line 383
    new-instance v6, Landroidx/camera/core/ResolutionSelector;

    iget v1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredAspectRatio:I

    iget-object v2, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredResolution:Landroid/util/Size;

    iget-object v3, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;

    iget-object v4, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mMaxResolution:Landroid/util/Size;

    iget-boolean v5, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mIsHighResolutionEnabled:Z

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Landroidx/camera/core/ResolutionSelector;-><init>(ILandroid/util/Size;Landroidx/camera/core/impl/SizeCoordinate;Landroid/util/Size;Z)V

    return-object v6
.end method

.method public setHighResolutionEnabled(Z)Landroidx/camera/core/ResolutionSelector$Builder;
    .locals 0

    .line 372
    iput-boolean p1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mIsHighResolutionEnabled:Z

    return-object p0
.end method

.method public setMaxResolution(Landroid/util/Size;)Landroidx/camera/core/ResolutionSelector$Builder;
    .locals 0

    .line 334
    iput-object p1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mMaxResolution:Landroid/util/Size;

    return-object p0
.end method

.method public setPreferredAspectRatio(I)Landroidx/camera/core/ResolutionSelector$Builder;
    .locals 0

    .line 222
    iput p1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredAspectRatio:I

    return-object p0
.end method

.method public setPreferredResolution(Landroid/util/Size;)Landroidx/camera/core/ResolutionSelector$Builder;
    .locals 0

    .line 262
    iput-object p1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredResolution:Landroid/util/Size;

    .line 263
    sget-object p1, Landroidx/camera/core/impl/SizeCoordinate;->CAMERA_SENSOR:Landroidx/camera/core/impl/SizeCoordinate;

    iput-object p1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;

    return-object p0
.end method

.method public setPreferredResolutionByViewSize(Landroid/util/Size;)Landroidx/camera/core/ResolutionSelector$Builder;
    .locals 0

    .line 307
    iput-object p1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mPreferredResolution:Landroid/util/Size;

    .line 308
    sget-object p1, Landroidx/camera/core/impl/SizeCoordinate;->ANDROID_VIEW:Landroidx/camera/core/impl/SizeCoordinate;

    iput-object p1, p0, Landroidx/camera/core/ResolutionSelector$Builder;->mSizeCoordinate:Landroidx/camera/core/impl/SizeCoordinate;

    return-object p0
.end method
