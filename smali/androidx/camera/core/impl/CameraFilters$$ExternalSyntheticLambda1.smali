.class public final synthetic Landroidx/camera/core/impl/CameraFilters$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/CameraFilter;


# static fields
.field public static final synthetic INSTANCE:Landroidx/camera/core/impl/CameraFilters$$ExternalSyntheticLambda1;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/camera/core/impl/CameraFilters$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Landroidx/camera/core/impl/CameraFilters$$ExternalSyntheticLambda1;-><init>()V

    sput-object v0, Landroidx/camera/core/impl/CameraFilters$$ExternalSyntheticLambda1;->INSTANCE:Landroidx/camera/core/impl/CameraFilters$$ExternalSyntheticLambda1;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final filter(Ljava/util/List;)Ljava/util/List;
    .locals 0

    invoke-static {p1}, Landroidx/camera/core/impl/CameraFilters;->lambda$static$1(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public synthetic getIdentifier()Landroidx/camera/core/impl/Identifier;
    .locals 1

    invoke-static {p0}, Landroidx/camera/core/CameraFilter$-CC;->$default$getIdentifier(Landroidx/camera/core/CameraFilter;)Landroidx/camera/core/impl/Identifier;

    move-result-object v0

    return-object v0
.end method
