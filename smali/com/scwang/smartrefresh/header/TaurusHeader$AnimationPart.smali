.class public final enum Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;
.super Ljava/lang/Enum;
.source "TaurusHeader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/scwang/smartrefresh/header/TaurusHeader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401c
    name = "AnimationPart"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

.field public static final enum FIRST:Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

.field public static final enum FOURTH:Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

.field public static final enum SECOND:Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

.field public static final enum THIRD:Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 102
    new-instance v0, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    const-string v1, "FIRST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;->FIRST:Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    .line 103
    new-instance v1, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    const-string v3, "SECOND"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;->SECOND:Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    .line 104
    new-instance v3, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    const-string v5, "THIRD"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;->THIRD:Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    .line 105
    new-instance v5, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    const-string v7, "FOURTH"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;->FOURTH:Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 101
    sput-object v7, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;->$VALUES:[Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 101
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;
    .locals 1

    .line 101
    const-class v0, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    return-object p0
.end method

.method public static values()[Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;
    .locals 1

    .line 101
    sget-object v0, Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;->$VALUES:[Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    invoke-virtual {v0}, [Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/scwang/smartrefresh/header/TaurusHeader$AnimationPart;

    return-object v0
.end method
