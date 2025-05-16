.class public final enum Lcom/jianjin/camera/CameraDirection;
.super Ljava/lang/Enum;
.source "CameraDirection.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/jianjin/camera/CameraDirection;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/jianjin/camera/CameraDirection;

.field public static final enum CAMERA_BACK:Lcom/jianjin/camera/CameraDirection;

.field public static final enum CAMERA_FRONT:Lcom/jianjin/camera/CameraDirection;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 8
    new-instance v0, Lcom/jianjin/camera/CameraDirection;

    const-string v1, "CAMERA_BACK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/jianjin/camera/CameraDirection;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jianjin/camera/CameraDirection;->CAMERA_BACK:Lcom/jianjin/camera/CameraDirection;

    new-instance v1, Lcom/jianjin/camera/CameraDirection;

    const-string v3, "CAMERA_FRONT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/jianjin/camera/CameraDirection;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/jianjin/camera/CameraDirection;->CAMERA_FRONT:Lcom/jianjin/camera/CameraDirection;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/jianjin/camera/CameraDirection;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 7
    sput-object v3, Lcom/jianjin/camera/CameraDirection;->$VALUES:[Lcom/jianjin/camera/CameraDirection;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 7
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(I)Lcom/jianjin/camera/CameraDirection;
    .locals 1

    .line 18
    invoke-static {}, Lcom/jianjin/camera/CameraDirection;->values()[Lcom/jianjin/camera/CameraDirection;

    move-result-object v0

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/jianjin/camera/CameraDirection;
    .locals 1

    .line 7
    const-class v0, Lcom/jianjin/camera/CameraDirection;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/jianjin/camera/CameraDirection;

    return-object p0
.end method

.method public static values()[Lcom/jianjin/camera/CameraDirection;
    .locals 1

    .line 7
    sget-object v0, Lcom/jianjin/camera/CameraDirection;->$VALUES:[Lcom/jianjin/camera/CameraDirection;

    invoke-virtual {v0}, [Lcom/jianjin/camera/CameraDirection;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/jianjin/camera/CameraDirection;

    return-object v0
.end method


# virtual methods
.method public next()Lcom/jianjin/camera/CameraDirection;
    .locals 3

    .line 12
    invoke-virtual {p0}, Lcom/jianjin/camera/CameraDirection;->ordinal()I

    move-result v0

    .line 13
    invoke-static {}, Lcom/jianjin/camera/CameraDirection;->values()[Lcom/jianjin/camera/CameraDirection;

    move-result-object v1

    array-length v1, v1

    .line 14
    invoke-static {}, Lcom/jianjin/camera/CameraDirection;->values()[Lcom/jianjin/camera/CameraDirection;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    rem-int/2addr v0, v1

    aget-object v0, v2, v0

    return-object v0
.end method
