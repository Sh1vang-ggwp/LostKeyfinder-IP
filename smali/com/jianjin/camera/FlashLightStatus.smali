.class public final enum Lcom/jianjin/camera/FlashLightStatus;
.super Ljava/lang/Enum;
.source "FlashLightStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/jianjin/camera/FlashLightStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/jianjin/camera/FlashLightStatus;

.field public static final enum LIGHT_OFF:Lcom/jianjin/camera/FlashLightStatus;

.field public static final enum LIGHT_ON:Lcom/jianjin/camera/FlashLightStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 10
    new-instance v0, Lcom/jianjin/camera/FlashLightStatus;

    const-string v1, "LIGHT_ON"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/jianjin/camera/FlashLightStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jianjin/camera/FlashLightStatus;->LIGHT_ON:Lcom/jianjin/camera/FlashLightStatus;

    new-instance v1, Lcom/jianjin/camera/FlashLightStatus;

    const-string v3, "LIGHT_OFF"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/jianjin/camera/FlashLightStatus;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/jianjin/camera/FlashLightStatus;->LIGHT_OFF:Lcom/jianjin/camera/FlashLightStatus;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/jianjin/camera/FlashLightStatus;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 8
    sput-object v3, Lcom/jianjin/camera/FlashLightStatus;->$VALUES:[Lcom/jianjin/camera/FlashLightStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(I)Lcom/jianjin/camera/FlashLightStatus;
    .locals 1

    .line 24
    invoke-static {}, Lcom/jianjin/camera/FlashLightStatus;->values()[Lcom/jianjin/camera/FlashLightStatus;

    move-result-object v0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/jianjin/camera/FlashLightStatus;
    .locals 1

    .line 8
    const-class v0, Lcom/jianjin/camera/FlashLightStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/jianjin/camera/FlashLightStatus;

    return-object p0
.end method

.method public static values()[Lcom/jianjin/camera/FlashLightStatus;
    .locals 1

    .line 8
    sget-object v0, Lcom/jianjin/camera/FlashLightStatus;->$VALUES:[Lcom/jianjin/camera/FlashLightStatus;

    invoke-virtual {v0}, [Lcom/jianjin/camera/FlashLightStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/jianjin/camera/FlashLightStatus;

    return-object v0
.end method


# virtual methods
.method public next()Lcom/jianjin/camera/FlashLightStatus;
    .locals 3

    .line 13
    invoke-virtual {p0}, Lcom/jianjin/camera/FlashLightStatus;->ordinal()I

    move-result v0

    .line 14
    invoke-static {}, Lcom/jianjin/camera/FlashLightStatus;->values()[Lcom/jianjin/camera/FlashLightStatus;

    move-result-object v1

    array-length v1, v1

    .line 15
    invoke-static {}, Lcom/jianjin/camera/FlashLightStatus;->values()[Lcom/jianjin/camera/FlashLightStatus;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    rem-int/2addr v0, v1

    aget-object v0, v2, v0

    .line 16
    sget-object v1, Lcom/jianjin/camera/widget/CameraManager;->mFlashLightNotSupport:Ljava/util/List;

    invoke-virtual {v0}, Lcom/jianjin/camera/FlashLightStatus;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 17
    invoke-virtual {p0}, Lcom/jianjin/camera/FlashLightStatus;->next()Lcom/jianjin/camera/FlashLightStatus;

    move-result-object v0

    :cond_0
    return-object v0
.end method
