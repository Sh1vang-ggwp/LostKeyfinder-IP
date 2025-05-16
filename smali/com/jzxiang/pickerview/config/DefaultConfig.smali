.class public Lcom/jzxiang/pickerview/config/DefaultConfig;
.super Ljava/lang/Object;
.source "DefaultConfig.java"


# static fields
.field public static CANCEL:Ljava/lang/String; = null

.field public static final COLOR:I = -0x19ffee

.field public static final CYCLIC:Z = true

.field public static DAY:Ljava/lang/String; = null

.field public static HOUR:Ljava/lang/String; = null

.field public static MINUTE:Ljava/lang/String; = null

.field public static MONTH:Ljava/lang/String; = null

.field public static SURE:Ljava/lang/String; = null

.field public static TITLE:Ljava/lang/String; = null

.field public static final TOOLBAR_TV_COLOR:I = -0x1

.field public static final TV_NORMAL_COLOR:I = -0x666667

.field public static final TV_SELECTOR_COLOR:I = -0xbfbfc0

.field public static final TV_SIZE:I = 0xc

.field public static final TYPE:Lcom/jzxiang/pickerview/data/Type;

.field public static YEAR:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    sget-object v0, Lcom/jzxiang/pickerview/data/Type;->ALL:Lcom/jzxiang/pickerview/data/Type;

    sput-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->TYPE:Lcom/jzxiang/pickerview/data/Type;

    const-string v0, "\u53d6\u6d88"

    .line 16
    sput-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->CANCEL:Ljava/lang/String;

    const-string v0, "\u786e\u5b9a"

    .line 17
    sput-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->SURE:Ljava/lang/String;

    const-string v0, "TimePicker"

    .line 18
    sput-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->TITLE:Ljava/lang/String;

    const-string v0, "\u5e74"

    .line 19
    sput-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->YEAR:Ljava/lang/String;

    const-string v0, "\u6708"

    .line 20
    sput-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->MONTH:Ljava/lang/String;

    const-string v0, "\u65e5"

    .line 21
    sput-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->DAY:Ljava/lang/String;

    const-string v0, "\u65f6"

    .line 22
    sput-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->HOUR:Ljava/lang/String;

    const-string v0, "\u5206"

    .line 23
    sput-object v0, Lcom/jzxiang/pickerview/config/DefaultConfig;->MINUTE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
