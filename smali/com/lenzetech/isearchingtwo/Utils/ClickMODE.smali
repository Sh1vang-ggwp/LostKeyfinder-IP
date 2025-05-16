.class public final enum Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;
.super Ljava/lang/Enum;
.source "ClickMODE.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

.field public static final enum Normal:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

.field public static final enum Photo:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

.field public static final enum Recording:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;


# direct methods
.method private static synthetic $values()[Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    .line 3
    sget-object v1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Normal:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Photo:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Recording:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 4
    new-instance v0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    const-string v1, "Normal"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Normal:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    .line 5
    new-instance v0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    const-string v1, "Photo"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Photo:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    .line 6
    new-instance v0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    const-string v1, "Recording"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Recording:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    .line 3
    invoke-static {}, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->$values()[Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->$VALUES:[Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

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

.method public static valueOf(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;
    .locals 1

    .line 3
    const-class v0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    return-object p0
.end method

.method public static values()[Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;
    .locals 1

    .line 3
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->$VALUES:[Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    invoke-virtual {v0}, [Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    return-object v0
.end method
