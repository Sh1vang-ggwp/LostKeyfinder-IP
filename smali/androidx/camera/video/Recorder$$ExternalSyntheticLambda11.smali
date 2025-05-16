.class public final synthetic Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/video/internal/encoder/EncoderFactory;


# static fields
.field public static final synthetic INSTANCE:Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;

    invoke-direct {v0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;-><init>()V

    sput-object v0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;->INSTANCE:Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createEncoder(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/EncoderConfig;)Landroidx/camera/video/internal/encoder/Encoder;
    .locals 1

    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl;

    invoke-direct {v0, p1, p2}, Landroidx/camera/video/internal/encoder/EncoderImpl;-><init>(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/EncoderConfig;)V

    check-cast v0, Landroidx/camera/video/internal/encoder/Encoder;

    return-object v0
.end method
