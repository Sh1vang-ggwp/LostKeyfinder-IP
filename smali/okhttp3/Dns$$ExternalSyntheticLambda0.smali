.class public final synthetic Lokhttp3/Dns$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lokhttp3/Dns;


# static fields
.field public static final synthetic INSTANCE:Lokhttp3/Dns$$ExternalSyntheticLambda0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lokhttp3/Dns$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lokhttp3/Dns$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lokhttp3/Dns$$ExternalSyntheticLambda0;->INSTANCE:Lokhttp3/Dns$$ExternalSyntheticLambda0;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final lookup(Ljava/lang/String;)Ljava/util/List;
    .locals 0

    invoke-static {p1}, Lokhttp3/Dns$-CC;->lambda$static$0(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
