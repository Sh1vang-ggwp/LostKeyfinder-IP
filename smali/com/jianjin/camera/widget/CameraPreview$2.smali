.class synthetic Lcom/jianjin/camera/widget/CameraPreview$2;
.super Ljava/lang/Object;
.source "CameraPreview.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jianjin/camera/widget/CameraPreview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$jianjin$camera$FlashLightStatus:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 157
    invoke-static {}, Lcom/jianjin/camera/FlashLightStatus;->values()[Lcom/jianjin/camera/FlashLightStatus;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/jianjin/camera/widget/CameraPreview$2;->$SwitchMap$com$jianjin$camera$FlashLightStatus:[I

    :try_start_0
    sget-object v1, Lcom/jianjin/camera/FlashLightStatus;->LIGHT_OFF:Lcom/jianjin/camera/FlashLightStatus;

    invoke-virtual {v1}, Lcom/jianjin/camera/FlashLightStatus;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/jianjin/camera/widget/CameraPreview$2;->$SwitchMap$com$jianjin$camera$FlashLightStatus:[I

    sget-object v1, Lcom/jianjin/camera/FlashLightStatus;->LIGHT_ON:Lcom/jianjin/camera/FlashLightStatus;

    invoke-virtual {v1}, Lcom/jianjin/camera/FlashLightStatus;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
