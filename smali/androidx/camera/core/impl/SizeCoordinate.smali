.class public final enum Landroidx/camera/core/impl/SizeCoordinate;
.super Ljava/lang/Enum;
.source "SizeCoordinate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/camera/core/impl/SizeCoordinate;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/camera/core/impl/SizeCoordinate;

.field public static final enum ANDROID_VIEW:Landroidx/camera/core/impl/SizeCoordinate;

.field public static final enum CAMERA_SENSOR:Landroidx/camera/core/impl/SizeCoordinate;


# direct methods
.method private static synthetic $values()[Landroidx/camera/core/impl/SizeCoordinate;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Landroidx/camera/core/impl/SizeCoordinate;

    .line 22
    sget-object v1, Landroidx/camera/core/impl/SizeCoordinate;->CAMERA_SENSOR:Landroidx/camera/core/impl/SizeCoordinate;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Landroidx/camera/core/impl/SizeCoordinate;->ANDROID_VIEW:Landroidx/camera/core/impl/SizeCoordinate;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 26
    new-instance v0, Landroidx/camera/core/impl/SizeCoordinate;

    const-string v1, "CAMERA_SENSOR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/camera/core/impl/SizeCoordinate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/camera/core/impl/SizeCoordinate;->CAMERA_SENSOR:Landroidx/camera/core/impl/SizeCoordinate;

    .line 31
    new-instance v0, Landroidx/camera/core/impl/SizeCoordinate;

    const-string v1, "ANDROID_VIEW"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroidx/camera/core/impl/SizeCoordinate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/camera/core/impl/SizeCoordinate;->ANDROID_VIEW:Landroidx/camera/core/impl/SizeCoordinate;

    .line 22
    invoke-static {}, Landroidx/camera/core/impl/SizeCoordinate;->$values()[Landroidx/camera/core/impl/SizeCoordinate;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/SizeCoordinate;->$VALUES:[Landroidx/camera/core/impl/SizeCoordinate;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/camera/core/impl/SizeCoordinate;
    .locals 1

    .line 22
    const-class v0, Landroidx/camera/core/impl/SizeCoordinate;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroidx/camera/core/impl/SizeCoordinate;

    return-object p0
.end method

.method public static values()[Landroidx/camera/core/impl/SizeCoordinate;
    .locals 1

    .line 22
    sget-object v0, Landroidx/camera/core/impl/SizeCoordinate;->$VALUES:[Landroidx/camera/core/impl/SizeCoordinate;

    invoke-virtual {v0}, [Landroidx/camera/core/impl/SizeCoordinate;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/camera/core/impl/SizeCoordinate;

    return-object v0
.end method
