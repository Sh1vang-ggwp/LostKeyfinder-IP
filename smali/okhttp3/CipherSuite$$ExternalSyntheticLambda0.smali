.class public final synthetic Lokhttp3/CipherSuite$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic INSTANCE:Lokhttp3/CipherSuite$$ExternalSyntheticLambda0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lokhttp3/CipherSuite$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lokhttp3/CipherSuite$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lokhttp3/CipherSuite$$ExternalSyntheticLambda0;->INSTANCE:Lokhttp3/CipherSuite$$ExternalSyntheticLambda0;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-static {p1, p2}, Lokhttp3/CipherSuite;->lambda$static$0(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method
