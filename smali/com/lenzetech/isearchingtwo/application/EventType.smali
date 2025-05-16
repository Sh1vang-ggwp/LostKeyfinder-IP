.class public final enum Lcom/lenzetech/isearchingtwo/application/EventType;
.super Ljava/lang/Enum;
.source "EventType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/lenzetech/isearchingtwo/application/EventType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lenzetech/isearchingtwo/application/EventType;

.field public static final enum DEVICE_VERIFY:Lcom/lenzetech/isearchingtwo/application/EventType;


# direct methods
.method private static synthetic $values()[Lcom/lenzetech/isearchingtwo/application/EventType;
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/lenzetech/isearchingtwo/application/EventType;

    .line 3
    sget-object v1, Lcom/lenzetech/isearchingtwo/application/EventType;->DEVICE_VERIFY:Lcom/lenzetech/isearchingtwo/application/EventType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 5
    new-instance v0, Lcom/lenzetech/isearchingtwo/application/EventType;

    const-string v1, "DEVICE_VERIFY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/lenzetech/isearchingtwo/application/EventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lenzetech/isearchingtwo/application/EventType;->DEVICE_VERIFY:Lcom/lenzetech/isearchingtwo/application/EventType;

    .line 3
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/EventType;->$values()[Lcom/lenzetech/isearchingtwo/application/EventType;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/application/EventType;->$VALUES:[Lcom/lenzetech/isearchingtwo/application/EventType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/application/EventType;
    .locals 1

    .line 3
    const-class v0, Lcom/lenzetech/isearchingtwo/application/EventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/lenzetech/isearchingtwo/application/EventType;

    return-object p0
.end method

.method public static values()[Lcom/lenzetech/isearchingtwo/application/EventType;
    .locals 1

    .line 3
    sget-object v0, Lcom/lenzetech/isearchingtwo/application/EventType;->$VALUES:[Lcom/lenzetech/isearchingtwo/application/EventType;

    invoke-virtual {v0}, [Lcom/lenzetech/isearchingtwo/application/EventType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lenzetech/isearchingtwo/application/EventType;

    return-object v0
.end method
