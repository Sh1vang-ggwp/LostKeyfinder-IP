.class public final enum Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;
.super Ljava/lang/Enum;
.source "DialogState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

.field public static final enum DIALOG_DISMISS:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

.field public static final enum DIALOG_SHOW:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;


# direct methods
.method private static synthetic $values()[Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    .line 6
    sget-object v1, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_SHOW:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_DISMISS:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 7
    new-instance v0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    const-string v1, "DIALOG_SHOW"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_SHOW:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    .line 8
    new-instance v0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    const-string v1, "DIALOG_DISMISS"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->DIALOG_DISMISS:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    .line 6
    invoke-static {}, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->$values()[Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->$VALUES:[Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;
    .locals 1

    .line 6
    const-class v0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    return-object p0
.end method

.method public static values()[Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;
    .locals 1

    .line 6
    sget-object v0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->$VALUES:[Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    invoke-virtual {v0}, [Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    return-object v0
.end method
