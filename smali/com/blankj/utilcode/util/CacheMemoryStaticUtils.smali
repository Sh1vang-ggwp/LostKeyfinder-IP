.class public final Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;
.super Ljava/lang/Object;
.source "CacheMemoryStaticUtils.java"


# static fields
.field private static sDefaultCacheMemoryUtils:Lcom/blankj/utilcode/util/CacheMemoryUtils;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clear()V
    .locals 1

    .line 93
    invoke-static {}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->getDefaultCacheMemoryUtils()Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object v0

    invoke-static {v0}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->clear(Lcom/blankj/utilcode/util/CacheMemoryUtils;)V

    return-void
.end method

.method public static clear(Lcom/blankj/utilcode/util/CacheMemoryUtils;)V
    .locals 1

    const-string v0, "Argument \'cacheMemoryUtils\' of type CacheMemoryUtils (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 181
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 182
    invoke-virtual {p0}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->clear()V

    return-void
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/Object;
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

    .line 54
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 55
    invoke-static {}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->getDefaultCacheMemoryUtils()Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->get(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheMemoryUtils;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static get(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheMemoryUtils;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/blankj/utilcode/util/CacheMemoryUtils;",
            ")TT;"
        }
    .end annotation

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 136
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheMemoryUtils\' of type CacheMemoryUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 137
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
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

    .line 66
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 67
    invoke-static {}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->getDefaultCacheMemoryUtils()Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->get(Ljava/lang/String;Ljava/lang/Object;Lcom/blankj/utilcode/util/CacheMemoryUtils;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static get(Ljava/lang/String;Ljava/lang/Object;Lcom/blankj/utilcode/util/CacheMemoryUtils;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;",
            "Lcom/blankj/utilcode/util/CacheMemoryUtils;",
            ")TT;"
        }
    .end annotation

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 149
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheMemoryUtils\' of type CacheMemoryUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 151
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 152
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getCacheCount()I
    .locals 1

    .line 76
    invoke-static {}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->getDefaultCacheMemoryUtils()Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object v0

    invoke-static {v0}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->getCacheCount(Lcom/blankj/utilcode/util/CacheMemoryUtils;)I

    move-result v0

    return v0
.end method

.method public static getCacheCount(Lcom/blankj/utilcode/util/CacheMemoryUtils;)I
    .locals 1

    const-string v0, "Argument \'cacheMemoryUtils\' of type CacheMemoryUtils (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 161
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 162
    invoke-virtual {p0}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->getCacheCount()I

    move-result p0

    return p0
.end method

.method private static getDefaultCacheMemoryUtils()Lcom/blankj/utilcode/util/CacheMemoryUtils;
    .locals 1

    .line 186
    sget-object v0, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->sDefaultCacheMemoryUtils:Lcom/blankj/utilcode/util/CacheMemoryUtils;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->getInstance()Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static put(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 32
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    invoke-static {}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->getDefaultCacheMemoryUtils()Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->put(Ljava/lang/String;Ljava/lang/Object;Lcom/blankj/utilcode/util/CacheMemoryUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/Object;I)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 43
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    invoke-static {}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->getDefaultCacheMemoryUtils()Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->put(Ljava/lang/String;Ljava/lang/Object;ILcom/blankj/utilcode/util/CacheMemoryUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/Object;ILcom/blankj/utilcode/util/CacheMemoryUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 121
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheMemoryUtils\' of type CacheMemoryUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 124
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 125
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->put(Ljava/lang/String;Ljava/lang/Object;I)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/Object;Lcom/blankj/utilcode/util/CacheMemoryUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 107
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheMemoryUtils\' of type CacheMemoryUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 109
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 110
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->put(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static remove(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 85
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 86
    invoke-static {}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->getDefaultCacheMemoryUtils()Lcom/blankj/utilcode/util/CacheMemoryUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->remove(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheMemoryUtils;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static remove(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheMemoryUtils;)Ljava/lang/Object;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 172
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheMemoryUtils\' of type CacheMemoryUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 173
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheMemoryUtils;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static setDefaultCacheMemoryUtils(Lcom/blankj/utilcode/util/CacheMemoryUtils;)V
    .locals 0

    .line 23
    sput-object p0, Lcom/blankj/utilcode/util/CacheMemoryStaticUtils;->sDefaultCacheMemoryUtils:Lcom/blankj/utilcode/util/CacheMemoryUtils;

    return-void
.end method
