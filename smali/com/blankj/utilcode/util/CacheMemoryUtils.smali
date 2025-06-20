.class public final Lcom/blankj/utilcode/util/CacheMemoryUtils;
.super Ljava/lang/Object;
.source "CacheMemoryUtils.java"

# interfaces
.implements Lcom/blankj/utilcode/constant/CacheConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;
    }
.end annotation


# static fields
.field private static final CACHE_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/blankj/utilcode/util/CacheMemoryUtils;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEFAULT_MAX_COUNT:I = 0x100


# instance fields
.field private final mCacheKey:Ljava/lang/String;

.field private final mMemoryCache:Landroidx/collection/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/LruCache<",
            "Ljava/lang/String;",
            "Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->CACHE_MAP:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Landroidx/collection/LruCache;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/collection/LruCache<",
            "Ljava/lang/String;",
            "Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;",
            ">;)V"
        }
    .end annotation

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->mCacheKey:Ljava/lang/String;

    .line 70
    iput-object p2, p0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->mMemoryCache:Landroidx/collection/LruCache;

    return-void
.end method

.method public static getInstance()Lcom/blankj/utilcode/util/CacheMemoryUtils;
    .locals 1

    const/16 v0, 0x100

    .line 34
    invoke-static {v0}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->getInstance(I)Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(I)Lcom/blankj/utilcode/util/CacheMemoryUtils;
    .locals 1

    .line 44
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->getInstance(Ljava/lang/String;I)Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance(Ljava/lang/String;I)Lcom/blankj/utilcode/util/CacheMemoryUtils;
    .locals 4

    .line 55
    sget-object v0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->CACHE_MAP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blankj/utilcode/util/CacheMemoryUtils;

    if-nez v1, :cond_1

    .line 57
    const-class v2, Lcom/blankj/utilcode/util/CacheMemoryUtils;

    monitor-enter v2

    .line 58
    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blankj/utilcode/util/CacheMemoryUtils;

    if-nez v1, :cond_0

    .line 60
    new-instance v1, Lcom/blankj/utilcode/util/CacheMemoryUtils;

    new-instance v3, Landroidx/collection/LruCache;

    invoke-direct {v3, p1}, Landroidx/collection/LruCache;-><init>(I)V

    invoke-direct {v1, p0, v3}, Lcom/blankj/utilcode/util/CacheMemoryUtils;-><init>(Ljava/lang/String;Landroidx/collection/LruCache;)V

    .line 61
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    :cond_0
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    return-object v1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->mMemoryCache:Landroidx/collection/LruCache;

    invoke-virtual {v0}, Landroidx/collection/LruCache;->evictAll()V

    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 108
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 109
    invoke-virtual {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 120
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 121
    iget-object v0, p0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->mMemoryCache:Landroidx/collection/LruCache;

    invoke-virtual {v0, p1}, Landroidx/collection/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;

    if-nez v0, :cond_0

    return-object p2

    .line 123
    :cond_0
    iget-wide v1, v0, Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;->dueTime:J

    const-wide/16 v3, -0x1

    cmp-long v5, v1, v3

    if-eqz v5, :cond_2

    iget-wide v1, v0, Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;->dueTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-ltz v5, :cond_1

    goto :goto_0

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->mMemoryCache:Landroidx/collection/LruCache;

    invoke-virtual {v0, p1}, Landroidx/collection/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2

    .line 125
    :cond_2
    :goto_0
    iget-object p1, v0, Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;->value:Ljava/lang/Object;

    return-object p1
.end method

.method public getCacheCount()I
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->mMemoryCache:Landroidx/collection/LruCache;

    invoke-virtual {v0}, Landroidx/collection/LruCache;->size()I

    move-result v0

    return v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 84
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const/4 v0, -0x1

    .line 85
    invoke-virtual {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->put(Ljava/lang/String;Ljava/lang/Object;I)V

    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;I)V
    .locals 4

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 95
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    if-nez p2, :cond_0

    return-void

    :cond_0
    if-gez p3, :cond_1

    const-wide/16 v0, -0x1

    goto :goto_0

    .line 97
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    mul-int/lit16 p3, p3, 0x3e8

    int-to-long v2, p3

    add-long/2addr v0, v2

    .line 98
    :goto_0
    iget-object p3, p0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->mMemoryCache:Landroidx/collection/LruCache;

    new-instance v2, Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;

    invoke-direct {v2, v0, v1, p2}, Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;-><init>(JLjava/lang/Object;)V

    invoke-virtual {p3, p1, v2}, Landroidx/collection/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public remove(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 146
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 147
    iget-object v0, p0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->mMemoryCache:Landroidx/collection/LruCache;

    invoke-virtual {v0, p1}, Landroidx/collection/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 149
    :cond_0
    iget-object p1, p1, Lcom/blankj/utilcode/util/CacheMemoryUtils$CacheValue;->value:Ljava/lang/Object;

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/blankj/utilcode/util/CacheMemoryUtils;->mCacheKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
