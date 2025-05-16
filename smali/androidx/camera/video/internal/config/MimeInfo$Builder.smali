.class public abstract Landroidx/camera/video/internal/config/MimeInfo$Builder;
.super Ljava/lang/Object;
.source "MimeInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/config/MimeInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract build()Landroidx/camera/video/internal/config/MimeInfo;
.end method

.method public abstract setCompatibleCamcorderProfile(Landroidx/camera/core/impl/CamcorderProfileProxy;)Landroidx/camera/video/internal/config/MimeInfo$Builder;
.end method

.method abstract setMimeType(Ljava/lang/String;)Landroidx/camera/video/internal/config/MimeInfo$Builder;
.end method

.method public abstract setProfile(I)Landroidx/camera/video/internal/config/MimeInfo$Builder;
.end method
