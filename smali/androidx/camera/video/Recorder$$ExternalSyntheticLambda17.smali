.class public final synthetic Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Consumer;


# static fields
.field public static final synthetic INSTANCE:Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;

    invoke-direct {v0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;-><init>()V

    sput-object v0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;->INSTANCE:Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroidx/camera/video/VideoSpec$Builder;

    invoke-static {p1}, Landroidx/camera/video/Recorder;->lambda$composeRecorderMediaSpec$8(Landroidx/camera/video/VideoSpec$Builder;)V

    return-void
.end method
