.class public final enum Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;
.super Ljava/lang/Enum;
.source "DimensionStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum CodeExact:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum CodeExactUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum DeadLock:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum DeadLockUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum Default:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum DefaultUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum XmlExact:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum XmlExactUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum XmlLayout:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum XmlLayoutUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum XmlWrap:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

.field public static final enum XmlWrapUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;


# instance fields
.field public final notified:Z


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 8
    new-instance v0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v1, "DefaultUnNotify"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->DefaultUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 9
    new-instance v1, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v3, "Default"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v1, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->Default:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 10
    new-instance v3, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v5, "XmlWrapUnNotify"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v2}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v3, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->XmlWrapUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 11
    new-instance v5, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v7, "XmlWrap"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v4}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v5, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->XmlWrap:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 12
    new-instance v7, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v9, "XmlExactUnNotify"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v2}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v7, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->XmlExactUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 13
    new-instance v9, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v11, "XmlExact"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12, v4}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v9, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->XmlExact:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 14
    new-instance v11, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v13, "XmlLayoutUnNotify"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14, v2}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v11, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->XmlLayoutUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 15
    new-instance v13, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v15, "XmlLayout"

    const/4 v14, 0x7

    invoke-direct {v13, v15, v14, v4}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v13, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->XmlLayout:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 16
    new-instance v15, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v14, "CodeExactUnNotify"

    const/16 v12, 0x8

    invoke-direct {v15, v14, v12, v2}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v15, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->CodeExactUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 17
    new-instance v14, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v12, "CodeExact"

    const/16 v10, 0x9

    invoke-direct {v14, v12, v10, v4}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v14, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->CodeExact:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 18
    new-instance v12, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v10, "DeadLockUnNotify"

    const/16 v8, 0xa

    invoke-direct {v12, v10, v8, v2}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v12, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->DeadLockUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    .line 19
    new-instance v10, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const-string v8, "DeadLock"

    const/16 v6, 0xb

    invoke-direct {v10, v8, v6, v4}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;-><init>(Ljava/lang/String;IZ)V

    sput-object v10, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->DeadLock:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    const/16 v8, 0xc

    new-array v8, v8, [Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    aput-object v0, v8, v2

    aput-object v1, v8, v4

    const/4 v0, 0x2

    aput-object v3, v8, v0

    const/4 v0, 0x3

    aput-object v5, v8, v0

    const/4 v0, 0x4

    aput-object v7, v8, v0

    const/4 v0, 0x5

    aput-object v9, v8, v0

    const/4 v0, 0x6

    aput-object v11, v8, v0

    const/4 v0, 0x7

    aput-object v13, v8, v0

    const/16 v0, 0x8

    aput-object v15, v8, v0

    const/16 v0, 0x9

    aput-object v14, v8, v0

    const/16 v0, 0xa

    aput-object v12, v8, v0

    aput-object v10, v8, v6

    .line 7
    sput-object v8, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->$VALUES:[Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 23
    iput-boolean p3, p0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->notified:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;
    .locals 1

    .line 7
    const-class v0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    return-object p0
.end method

.method public static values()[Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;
    .locals 1

    .line 7
    sget-object v0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->$VALUES:[Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    invoke-virtual {v0}, [Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    return-object v0
.end method


# virtual methods
.method public canReplaceWith(Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;)Z
    .locals 2

    .line 58
    invoke-virtual {p0}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->ordinal()I

    move-result v0

    invoke-virtual {p1}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->ordinal()I

    move-result v1

    if-lt v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->notified:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->CodeExact:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    if-ne v0, p0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->ordinal()I

    move-result v0

    invoke-virtual {p1}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->ordinal()I

    move-result p1

    if-ne v0, p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public notified()Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;
    .locals 2

    .line 46
    iget-boolean v0, p0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->notified:Z

    if-nez v0, :cond_0

    .line 47
    invoke-static {}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->values()[Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    move-result-object v0

    invoke-virtual {p0}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->ordinal()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    return-object v0

    :cond_0
    return-object p0
.end method

.method public unNotify()Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;
    .locals 2

    .line 31
    iget-boolean v0, p0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->notified:Z

    if-eqz v0, :cond_1

    .line 32
    invoke-static {}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->values()[Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    move-result-object v0

    invoke-virtual {p0}, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->ordinal()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    .line 33
    iget-boolean v1, v0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->notified:Z

    if-nez v1, :cond_0

    return-object v0

    .line 36
    :cond_0
    sget-object v0, Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;->DefaultUnNotify:Lcom/scwang/smartrefresh/layout/constant/DimensionStatus;

    return-object v0

    :cond_1
    return-object p0
.end method
