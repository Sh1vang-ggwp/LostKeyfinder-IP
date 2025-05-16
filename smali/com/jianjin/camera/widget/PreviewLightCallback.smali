.class public Lcom/jianjin/camera/widget/PreviewLightCallback;
.super Ljava/lang/Object;
.source "PreviewLightCallback.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jianjin/camera/widget/PreviewLightCallback$OnCameraLightCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PreviewLightCallback"


# instance fields
.field private cameraManager:Lcom/jianjin/camera/widget/CameraManager;

.field private darkIndex:I

.field private darkList:[J

.field private darkValue:I

.field private lastRecordTime:J

.field private onCameraLightCallback:Lcom/jianjin/camera/widget/PreviewLightCallback$OnCameraLightCallback;

.field private waitScanTime:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/jianjin/camera/widget/CameraManager;Lcom/jianjin/camera/widget/PreviewLightCallback$OnCameraLightCallback;)V
    .locals 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->lastRecordTime:J

    const/4 v0, 0x0

    .line 20
    iput v0, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->darkIndex:I

    const/4 v0, 0x4

    new-array v0, v0, [J

    .line 22
    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->darkList:[J

    const/16 v0, 0x12c

    .line 24
    iput v0, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->waitScanTime:I

    const/16 v0, 0x3c

    .line 26
    iput v0, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->darkValue:I

    .line 32
    iput-object p1, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->cameraManager:Lcom/jianjin/camera/widget/CameraManager;

    .line 33
    iput-object p2, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->onCameraLightCallback:Lcom/jianjin/camera/widget/PreviewLightCallback$OnCameraLightCallback;

    return-void

    nop

    :array_0
    .array-data 8
        0xff
        0xff
        0xff
        0xff
    .end array-data
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 10

    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 56
    iget-wide v2, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->lastRecordTime:J

    sub-long v2, v0, v2

    iget v4, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->waitScanTime:I

    int-to-long v4, v4

    cmp-long v6, v2, v4

    if-gez v6, :cond_0

    return-void

    .line 59
    :cond_0
    iput-wide v0, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->lastRecordTime:J

    .line 61
    invoke-virtual {p2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    iget v0, v0, Landroid/hardware/Camera$Size;->width:I

    .line 62
    invoke-virtual {p2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p2

    invoke-virtual {p2}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object p2

    iget p2, p2, Landroid/hardware/Camera$Size;->height:I

    const-wide/16 v1, 0x0

    mul-int v0, v0, p2

    int-to-long v3, v0

    const/16 p2, 0xa

    .line 71
    array-length v0, p1

    int-to-float v0, v0

    long-to-float v5, v3

    const/high16 v6, 0x3fc00000    # 1.5f

    mul-float v5, v5, v6

    sub-float/2addr v0, v5

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v5, 0x3727c5ac    # 1.0E-5f

    cmpg-float v0, v0, v5

    if-gez v0, :cond_4

    const/4 v0, 0x0

    const/4 v5, 0x0

    :goto_0
    int-to-long v6, v5

    cmp-long v8, v6, v3

    if-gez v8, :cond_1

    .line 75
    aget-byte v6, p1, v5

    int-to-long v6, v6

    const-wide/16 v8, 0xff

    and-long/2addr v6, v8

    add-long/2addr v1, v6

    add-int/lit8 v5, v5, 0xa

    goto :goto_0

    :cond_1
    int-to-long p1, p2

    .line 78
    div-long/2addr v3, p1

    div-long/2addr v1, v3

    .line 80
    iget-object p1, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->darkList:[J

    array-length p2, p1

    .line 81
    iget v3, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->darkIndex:I

    rem-int/2addr v3, p2

    iput v3, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->darkIndex:I

    aput-wide v1, p1, v3

    const/4 p1, 0x1

    add-int/2addr v3, p1

    .line 82
    iput v3, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->darkIndex:I

    const/4 v3, 0x0

    :goto_1
    if-ge v3, p2, :cond_3

    .line 86
    iget-object v4, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->darkList:[J

    aget-wide v5, v4, v3

    iget v4, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->darkValue:I

    int-to-long v7, v4

    cmp-long v4, v5, v7

    if-lez v4, :cond_2

    const/4 p1, 0x0

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 90
    :cond_3
    sget-object p2, Lcom/jianjin/camera/widget/PreviewLightCallback;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u6444\u50cf\u5934\u73af\u5883\u4eae\u5ea6\u4e3a \uff1a "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/jianjin/camera/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    iget-object p2, p0, Lcom/jianjin/camera/widget/PreviewLightCallback;->onCameraLightCallback:Lcom/jianjin/camera/widget/PreviewLightCallback$OnCameraLightCallback;

    if-eqz p2, :cond_4

    .line 93
    invoke-interface {p2, p1}, Lcom/jianjin/camera/widget/PreviewLightCallback$OnCameraLightCallback;->cameraLight(Z)V

    :cond_4
    return-void
.end method
