.class public final enum Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;
.super Ljava/lang/Enum;
.source "NetworkUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/blankj/utilcode/util/NetworkUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NetworkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

.field public static final enum NETWORK_2G:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

.field public static final enum NETWORK_3G:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

.field public static final enum NETWORK_4G:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

.field public static final enum NETWORK_ETHERNET:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

.field public static final enum NETWORK_NO:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

.field public static final enum NETWORK_UNKNOWN:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

.field public static final enum NETWORK_WIFI:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 47
    new-instance v0, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    const-string v1, "NETWORK_ETHERNET"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->NETWORK_ETHERNET:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    .line 48
    new-instance v1, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    const-string v3, "NETWORK_WIFI"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->NETWORK_WIFI:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    .line 49
    new-instance v3, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    const-string v5, "NETWORK_4G"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->NETWORK_4G:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    .line 50
    new-instance v5, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    const-string v7, "NETWORK_3G"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->NETWORK_3G:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    .line 51
    new-instance v7, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    const-string v9, "NETWORK_2G"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->NETWORK_2G:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    .line 52
    new-instance v9, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    const-string v11, "NETWORK_UNKNOWN"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->NETWORK_UNKNOWN:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    .line 53
    new-instance v11, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    const-string v13, "NETWORK_NO"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->NETWORK_NO:Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    const/4 v13, 0x7

    new-array v13, v13, [Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    .line 46
    sput-object v13, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->$VALUES:[Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;
    .locals 1

    .line 46
    const-class v0, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    return-object p0
.end method

.method public static values()[Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;
    .locals 1

    .line 46
    sget-object v0, Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->$VALUES:[Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    invoke-virtual {v0}, [Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/blankj/utilcode/util/NetworkUtils$NetworkType;

    return-object v0
.end method
