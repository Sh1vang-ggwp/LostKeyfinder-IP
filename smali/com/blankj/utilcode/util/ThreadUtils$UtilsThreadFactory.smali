.class final Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory;
.super Ljava/util/concurrent/atomic/AtomicLong;
.source "ThreadUtils.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/blankj/utilcode/util/ThreadUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UtilsThreadFactory"
.end annotation


# static fields
.field private static final POOL_NUMBER:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final serialVersionUID:J = -0x7fcda7124588b1d6L


# instance fields
.field private final namePrefix:Ljava/lang/String;

.field private final priority:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1070
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory;->POOL_NUMBER:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1075
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 1076
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "-pool-"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory;->POOL_NUMBER:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1077
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "-thread-"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory;->namePrefix:Ljava/lang/String;

    .line 1079
    iput p2, p0, Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory;->priority:I

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 4

    const-string v0, "Argument \'r\' of type Runnable (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 1082
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1083
    new-instance v0, Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory$1;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory;->namePrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory;->getAndIncrement()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory$1;-><init>(Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 1093
    invoke-virtual {v0}, Ljava/lang/Thread;->isDaemon()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 1094
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 1096
    :cond_0
    iget p1, p0, Lcom/blankj/utilcode/util/ThreadUtils$UtilsThreadFactory;->priority:I

    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    return-object v0
.end method
