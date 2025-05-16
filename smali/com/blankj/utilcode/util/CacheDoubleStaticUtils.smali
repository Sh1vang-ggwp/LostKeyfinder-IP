.class public final Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;
.super Ljava/lang/Object;
.source "CacheDoubleStaticUtils.java"


# static fields
.field private static sDefaultCacheDoubleUtils:Lcom/blankj/utilcode/util/CacheDoubleUtils;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clear()V
    .locals 1

    .line 448
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->clear(Lcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static clear(Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 961
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 962
    invoke-virtual {p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->clear()V

    return-void
.end method

.method public static getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 248
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 249
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getBitmap(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static getBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 259
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 260
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static getBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Landroid/graphics/Bitmap;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 732
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 734
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 735
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static getBitmap(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Landroid/graphics/Bitmap;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 720
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 721
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static getBytes(Ljava/lang/String;)[B
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 61
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getBytes(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)[B

    move-result-object p0

    return-object p0
.end method

.method public static getBytes(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)[B
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 490
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 491
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method public static getBytes(Ljava/lang/String;[B)[B
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 72
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 73
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getBytes(Ljava/lang/String;[BLcom/blankj/utilcode/util/CacheDoubleUtils;)[B

    move-result-object p0

    return-object p0
.end method

.method public static getBytes(Ljava/lang/String;[BLcom/blankj/utilcode/util/CacheDoubleUtils;)[B
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 502
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 504
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 505
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getBytes(Ljava/lang/String;[B)[B

    move-result-object p0

    return-object p0
.end method

.method public static getCacheDiskCount()I
    .locals 1

    .line 423
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getCacheDiskCount(Lcom/blankj/utilcode/util/CacheDoubleUtils;)I

    move-result v0

    return v0
.end method

.method public static getCacheDiskCount(Lcom/blankj/utilcode/util/CacheDoubleUtils;)I
    .locals 1

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 932
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 933
    invoke-virtual {p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getCacheDiskCount()I

    move-result p0

    return p0
.end method

.method public static getCacheDiskSize()J
    .locals 2

    .line 414
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getCacheDiskSize(Lcom/blankj/utilcode/util/CacheDoubleUtils;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getCacheDiskSize(Lcom/blankj/utilcode/util/CacheDoubleUtils;)J
    .locals 2

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 922
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 923
    invoke-virtual {p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getCacheDiskSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getCacheMemoryCount()I
    .locals 1

    .line 432
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getCacheMemoryCount(Lcom/blankj/utilcode/util/CacheDoubleUtils;)I

    move-result v0

    return v0
.end method

.method public static getCacheMemoryCount(Lcom/blankj/utilcode/util/CacheDoubleUtils;)I
    .locals 1

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 942
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 943
    invoke-virtual {p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getCacheMemoryCount()I

    move-result p0

    return p0
.end method

.method private static getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;
    .locals 1

    .line 966
    sget-object v0, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->sDefaultCacheDoubleUtils:Lcom/blankj/utilcode/util/CacheDoubleUtils;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getInstance()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 294
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 295
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDrawable(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static getDrawable(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 305
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 306
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDrawable(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static getDrawable(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Landroid/graphics/drawable/Drawable;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 789
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 791
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 792
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getDrawable(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static getDrawable(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Landroid/graphics/drawable/Drawable;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 777
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 778
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 202
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 203
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getJSONArray(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONArray(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Lorg/json/JSONArray;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 663
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 664
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONArray(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 213
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 214
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getJSONArray(Ljava/lang/String;Lorg/json/JSONArray;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONArray(Ljava/lang/String;Lorg/json/JSONArray;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Lorg/json/JSONArray;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 675
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 677
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 678
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getJSONArray(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 155
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 156
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getJSONObject(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONObject(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Lorg/json/JSONObject;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 604
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 605
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 606
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONObject(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 166
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 167
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getJSONObject(Ljava/lang/String;Lorg/json/JSONObject;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONObject(Ljava/lang/String;Lorg/json/JSONObject;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Lorg/json/JSONObject;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 617
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 619
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 620
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getJSONObject(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static getParcelable(Ljava/lang/String;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Landroid/os/Parcelable$Creator<",
            "TT;>;)TT;"
        }
    .end annotation

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 342
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'creator\' of type Parcelable.Creator<T> (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 343
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 344
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getParcelable(Ljava/lang/String;Landroid/os/Parcelable$Creator;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getParcelable(Ljava/lang/String;Landroid/os/Parcelable$Creator;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Landroid/os/Parcelable$Creator<",
            "TT;>;",
            "Lcom/blankj/utilcode/util/CacheDoubleUtils;",
            ")TT;"
        }
    .end annotation

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 836
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'creator\' of type Parcelable.Creator<T> (#1 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 837
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 838
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 839
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getParcelable(Ljava/lang/String;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getParcelable(Ljava/lang/String;Landroid/os/Parcelable$Creator;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Landroid/os/Parcelable$Creator<",
            "TT;>;TT;)TT;"
        }
    .end annotation

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 356
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'creator\' of type Parcelable.Creator<T> (#1 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 357
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 359
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getParcelable(Ljava/lang/String;Landroid/os/Parcelable$Creator;Ljava/lang/Object;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getParcelable(Ljava/lang/String;Landroid/os/Parcelable$Creator;Ljava/lang/Object;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Landroid/os/Parcelable$Creator<",
            "TT;>;TT;",
            "Lcom/blankj/utilcode/util/CacheDoubleUtils;",
            ")TT;"
        }
    .end annotation

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 852
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'creator\' of type Parcelable.Creator<T> (#1 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 853
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 855
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 856
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getParcelable(Ljava/lang/String;Landroid/os/Parcelable$Creator;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getSerializable(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 393
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 394
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getSerializable(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getSerializable(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/Object;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 898
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 899
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getSerializable(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getSerializable(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 404
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 405
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getSerializable(Ljava/lang/String;Ljava/lang/Object;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getSerializable(Ljava/lang/String;Ljava/lang/Object;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/Object;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 910
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 912
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 913
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getSerializable(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 107
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 108
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getString(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getString(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 547
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 548
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 118
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getString(Ljava/lang/String;Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getString(Ljava/lang/String;Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 559
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 561
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 562
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static put(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 227
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 228
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/graphics/Bitmap;I)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 238
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 239
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Landroid/graphics/Bitmap;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/graphics/Bitmap;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 706
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 709
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 710
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Landroid/graphics/Bitmap;I)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 692
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 694
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 695
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 273
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 274
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/graphics/drawable/Drawable;I)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 284
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 285
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Landroid/graphics/drawable/Drawable;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/graphics/drawable/Drawable;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 763
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 766
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 767
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Landroid/graphics/drawable/Drawable;I)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 749
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 751
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 752
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/os/Parcelable;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 319
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 320
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Landroid/os/Parcelable;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/os/Parcelable;I)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 330
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 331
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Landroid/os/Parcelable;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/os/Parcelable;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 820
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 823
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 824
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Landroid/os/Parcelable;I)V

    return-void
.end method

.method public static put(Ljava/lang/String;Landroid/os/Parcelable;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 806
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 808
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 809
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/io/Serializable;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 372
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 373
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Ljava/io/Serializable;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/io/Serializable;I)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 383
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 384
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Ljava/io/Serializable;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/io/Serializable;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 884
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 887
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 888
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Ljava/io/Serializable;I)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/io/Serializable;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 870
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 872
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 873
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 86
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 87
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 97
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 98
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Ljava/lang/String;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 533
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 536
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 537
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 519
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 521
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 522
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Lorg/json/JSONArray;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 181
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 182
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Lorg/json/JSONArray;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Lorg/json/JSONArray;I)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 192
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 193
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Lorg/json/JSONArray;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Lorg/json/JSONArray;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 649
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 652
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 653
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Lorg/json/JSONArray;I)V

    return-void
.end method

.method public static put(Ljava/lang/String;Lorg/json/JSONArray;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 635
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 637
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 638
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Lorg/json/JSONArray;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 132
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 133
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Lorg/json/JSONObject;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Lorg/json/JSONObject;I)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 143
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 146
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;Lorg/json/JSONObject;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;Lorg/json/JSONObject;ILcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 590
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 593
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 594
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Lorg/json/JSONObject;I)V

    return-void
.end method

.method public static put(Ljava/lang/String;Lorg/json/JSONObject;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 576
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 578
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 579
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static put(Ljava/lang/String;[B)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 40
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 41
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;[BLcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;[BI)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 51
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 52
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->put(Ljava/lang/String;[BILcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static put(Ljava/lang/String;[BILcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 476
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#3 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 479
    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 480
    invoke-virtual {p3, p0, p1, p2}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;[BI)V

    return-void
.end method

.method public static put(Ljava/lang/String;[BLcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 462
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#2 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 464
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 465
    invoke-virtual {p2, p0, p1}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->put(Ljava/lang/String;[B)V

    return-void
.end method

.method public static remove(Ljava/lang/String;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 440
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 441
    invoke-static {}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->getDefaultCacheDoubleUtils()Lcom/blankj/utilcode/util/CacheDoubleUtils;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->remove(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V

    return-void
.end method

.method public static remove(Ljava/lang/String;Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 1

    const-string v0, "Argument \'key\' of type String (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 952
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Argument \'cacheDoubleUtils\' of type CacheDoubleUtils (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 953
    invoke-virtual {p1, p0}, Lcom/blankj/utilcode/util/CacheDoubleUtils;->remove(Ljava/lang/String;)V

    return-void
.end method

.method public static setDefaultCacheDoubleUtils(Lcom/blankj/utilcode/util/CacheDoubleUtils;)V
    .locals 0

    .line 31
    sput-object p0, Lcom/blankj/utilcode/util/CacheDoubleStaticUtils;->sDefaultCacheDoubleUtils:Lcom/blankj/utilcode/util/CacheDoubleUtils;

    return-void
.end method
