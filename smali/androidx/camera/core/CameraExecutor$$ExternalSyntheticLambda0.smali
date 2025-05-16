.class public final synthetic Landroidx/camera/core/CameraExecutor$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/RejectedExecutionHandler;


# static fields
.field public static final synthetic INSTANCE:Landroidx/camera/core/CameraExecutor$$ExternalSyntheticLambda0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/camera/core/CameraExecutor$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/camera/core/CameraExecutor$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Landroidx/camera/core/CameraExecutor$$ExternalSyntheticLambda0;->INSTANCE:Landroidx/camera/core/CameraExecutor$$ExternalSyntheticLambda0;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final rejectedExecution(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 0

    invoke-static {p1, p2}, Landroidx/camera/core/CameraExecutor;->lambda$createExecutor$0(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V

    return-void
.end method
