.class public final enum Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;
.super Ljava/lang/Enum;
.source "SpinnerStyle.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

.field public static final enum FixedBehind:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

.field public static final enum FixedFront:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

.field public static final enum MatchLayout:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

.field public static final enum Scale:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

.field public static final enum Translate:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 9
    new-instance v0, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    const-string v1, "Translate"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;->Translate:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    .line 10
    new-instance v1, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    const-string v3, "Scale"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;->Scale:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    .line 11
    new-instance v3, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    const-string v5, "FixedBehind"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;->FixedBehind:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    .line 12
    new-instance v5, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    const-string v7, "FixedFront"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;->FixedFront:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    .line 13
    new-instance v7, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    const-string v9, "MatchLayout"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;->MatchLayout:Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    const/4 v9, 0x5

    new-array v9, v9, [Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    .line 8
    sput-object v9, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;->$VALUES:[Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;
    .locals 1

    .line 8
    const-class v0, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    return-object p0
.end method

.method public static values()[Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;
    .locals 1

    .line 8
    sget-object v0, Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;->$VALUES:[Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    invoke-virtual {v0}, [Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/scwang/smartrefresh/layout/constant/SpinnerStyle;

    return-object v0
.end method
