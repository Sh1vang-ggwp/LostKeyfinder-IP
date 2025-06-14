.class public final Lcom/blankj/utilcode/util/TimeUtils;
.super Ljava/lang/Object;
.source "TimeUtils.java"


# static fields
.field private static final CHINESE_ZODIAC:[Ljava/lang/String;

.field private static final SDF_THREAD_LOCAL:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/text/SimpleDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final ZODIAC:[Ljava/lang/String;

.field private static final ZODIAC_FLAGS:[I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 24
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/blankj/utilcode/util/TimeUtils;->SDF_THREAD_LOCAL:Ljava/lang/ThreadLocal;

    const-string v1, "\u7334"

    const-string v2, "\u9e21"

    const-string v3, "\u72d7"

    const-string v4, "\u732a"

    const-string v5, "\u9f20"

    const-string v6, "\u725b"

    const-string v7, "\u864e"

    const-string v8, "\u5154"

    const-string v9, "\u9f99"

    const-string v10, "\u86c7"

    const-string v11, "\u9a6c"

    const-string v12, "\u7f8a"

    .line 1284
    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/blankj/utilcode/util/TimeUtils;->CHINESE_ZODIAC:[Ljava/lang/String;

    const/16 v0, 0xc

    new-array v0, v0, [I

    .line 1341
    fill-array-data v0, :array_0

    sput-object v0, Lcom/blankj/utilcode/util/TimeUtils;->ZODIAC_FLAGS:[I

    const-string v1, "\u6c34\u74f6\u5ea7"

    const-string v2, "\u53cc\u9c7c\u5ea7"

    const-string v3, "\u767d\u7f8a\u5ea7"

    const-string v4, "\u91d1\u725b\u5ea7"

    const-string v5, "\u53cc\u5b50\u5ea7"

    const-string v6, "\u5de8\u87f9\u5ea7"

    const-string v7, "\u72ee\u5b50\u5ea7"

    const-string v8, "\u5904\u5973\u5ea7"

    const-string v9, "\u5929\u79e4\u5ea7"

    const-string v10, "\u5929\u874e\u5ea7"

    const-string v11, "\u5c04\u624b\u5ea7"

    const-string v12, "\u9b54\u7faf\u5ea7"

    .line 1342
    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/blankj/utilcode/util/TimeUtils;->ZODIAC:[Ljava/lang/String;

    return-void

    nop

    :array_0
    .array-data 4
        0x14
        0x13
        0x15
        0x15
        0x15
        0x16
        0x17
        0x17
        0x17
        0x18
        0x17
        0x16
    .end array-data
.end method

.method private constructor <init>()V
    .locals 2

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "u can\'t instantiate me..."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static date2Millis(Ljava/util/Date;)J
    .locals 2

    .line 144
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public static date2String(Ljava/util/Date;)Ljava/lang/String;
    .locals 1

    .line 123
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->date2String(Ljava/util/Date;Ljava/text/DateFormat;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static date2String(Ljava/util/Date;Ljava/text/DateFormat;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 133
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 134
    invoke-virtual {p1, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getChineseWeek(J)Ljava/lang/String;
    .locals 1

    .line 1159
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-static {v0}, Lcom/blankj/utilcode/util/TimeUtils;->getChineseWeek(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getChineseWeek(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1128
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getChineseWeek(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getChineseWeek(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 1138
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1139
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getChineseWeek(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getChineseWeek(Ljava/util/Date;)Ljava/lang/String;
    .locals 3

    .line 1149
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    const-string v2, "E"

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getChineseZodiac(I)Ljava/lang/String;
    .locals 1

    .line 1338
    sget-object v0, Lcom/blankj/utilcode/util/TimeUtils;->CHINESE_ZODIAC:[Ljava/lang/String;

    rem-int/lit8 p0, p0, 0xc

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static getChineseZodiac(J)Ljava/lang/String;
    .locals 0

    .line 1328
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->millis2Date(J)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getChineseZodiac(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getChineseZodiac(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1295
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getChineseZodiac(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getChineseZodiac(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 1305
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1306
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getChineseZodiac(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getChineseZodiac(Ljava/util/Date;)Ljava/lang/String;
    .locals 2

    .line 1316
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1317
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 1318
    sget-object p0, Lcom/blankj/utilcode/util/TimeUtils;->CHINESE_ZODIAC:[Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    rem-int/lit8 v0, v0, 0xc

    aget-object p0, p0, v0

    return-object p0
.end method

.method public static getDate(JJI)Ljava/util/Date;
    .locals 0

    .line 877
    invoke-static {p2, p3, p4}, Lcom/blankj/utilcode/util/TimeUtils;->timeSpan2Millis(JI)J

    move-result-wide p2

    add-long/2addr p0, p2

    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->millis2Date(J)Ljava/util/Date;

    move-result-object p0

    return-object p0
.end method

.method public static getDate(Ljava/lang/String;JI)Ljava/util/Date;
    .locals 1

    .line 899
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0, p1, p2, p3}, Lcom/blankj/utilcode/util/TimeUtils;->getDate(Ljava/lang/String;Ljava/text/DateFormat;JI)Ljava/util/Date;

    move-result-object p0

    return-object p0
.end method

.method public static getDate(Ljava/lang/String;Ljava/text/DateFormat;JI)Ljava/util/Date;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 919
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 922
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide p0

    invoke-static {p2, p3, p4}, Lcom/blankj/utilcode/util/TimeUtils;->timeSpan2Millis(JI)J

    move-result-wide p2

    add-long/2addr p0, p2

    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->millis2Date(J)Ljava/util/Date;

    move-result-object p0

    return-object p0
.end method

.method public static getDate(Ljava/util/Date;JI)Ljava/util/Date;
    .locals 2

    .line 943
    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->date2Millis(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {p1, p2, p3}, Lcom/blankj/utilcode/util/TimeUtils;->timeSpan2Millis(JI)J

    move-result-wide p0

    add-long/2addr v0, p0

    invoke-static {v0, v1}, Lcom/blankj/utilcode/util/TimeUtils;->millis2Date(J)Ljava/util/Date;

    move-result-object p0

    return-object p0
.end method

.method public static getDateByNow(JI)Ljava/util/Date;
    .locals 2

    .line 1019
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getNowMills()J

    move-result-wide v0

    invoke-static {v0, v1, p0, p1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->getDate(JJI)Ljava/util/Date;

    move-result-object p0

    return-object p0
.end method

.method private static getDefaultFormat()Ljava/text/SimpleDateFormat;
    .locals 4

    .line 27
    sget-object v0, Lcom/blankj/utilcode/util/TimeUtils;->SDF_THREAD_LOCAL:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/text/SimpleDateFormat;

    if-nez v1, :cond_0

    .line 29
    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    const-string v3, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v1, v3, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_0
    return-object v1
.end method

.method public static getFitTimeSpan(JJI)Ljava/lang/String;
    .locals 0

    sub-long/2addr p0, p2

    .line 332
    invoke-static {p0, p1, p4}, Lcom/blankj/utilcode/util/TimeUtils;->millis2FitTimeSpan(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFitTimeSpan(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 264
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide v0

    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide p0

    sub-long/2addr v0, p0

    .line 265
    invoke-static {v0, v1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->millis2FitTimeSpan(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFitTimeSpan(Ljava/lang/String;Ljava/lang/String;Ljava/text/DateFormat;I)Ljava/lang/String;
    .locals 2

    const-string v0, "Argument \'format\' of type DateFormat (#2 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 287
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 289
    invoke-static {p0, p2}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide v0

    invoke-static {p1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide p0

    sub-long/2addr v0, p0

    .line 290
    invoke-static {v0, v1, p3}, Lcom/blankj/utilcode/util/TimeUtils;->millis2FitTimeSpan(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFitTimeSpan(Ljava/util/Date;Ljava/util/Date;I)Ljava/lang/String;
    .locals 2

    .line 310
    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->date2Millis(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {p1}, Lcom/blankj/utilcode/util/TimeUtils;->date2Millis(Ljava/util/Date;)J

    move-result-wide p0

    sub-long/2addr v0, p0

    invoke-static {v0, v1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->millis2FitTimeSpan(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFitTimeSpanByNow(JI)Ljava/lang/String;
    .locals 2

    .line 526
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->getFitTimeSpan(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFitTimeSpanByNow(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 466
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getNowString()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v1

    invoke-static {p0, v0, v1, p1}, Lcom/blankj/utilcode/util/TimeUtils;->getFitTimeSpan(Ljava/lang/String;Ljava/lang/String;Ljava/text/DateFormat;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFitTimeSpanByNow(Ljava/lang/String;Ljava/text/DateFormat;I)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 486
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 488
    invoke-static {p1}, Lcom/blankj/utilcode/util/TimeUtils;->getNowString(Ljava/text/DateFormat;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->getFitTimeSpan(Ljava/lang/String;Ljava/lang/String;Ljava/text/DateFormat;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFitTimeSpanByNow(Ljava/util/Date;I)Ljava/lang/String;
    .locals 1

    .line 507
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getNowDate()Ljava/util/Date;

    move-result-object v0

    invoke-static {p0, v0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->getFitTimeSpan(Ljava/util/Date;Ljava/util/Date;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFriendlyTimeSpanByNow(J)Ljava/lang/String;
    .locals 9

    .line 605
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p0

    const/4 v2, 0x0

    const/4 v3, 0x1

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-gez v6, :cond_0

    new-array v0, v3, [Ljava/lang/Object;

    .line 609
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    aput-object p0, v0, v2

    const-string p0, "%tc"

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-wide/16 v4, 0x3e8

    cmp-long v6, v0, v4

    if-gez v6, :cond_1

    const-string p0, "\u521a\u521a"

    return-object p0

    :cond_1
    const-wide/32 v6, 0xea60

    cmp-long v8, v0, v6

    if-gez v8, :cond_2

    .line 613
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    new-array p1, v3, [Ljava/lang/Object;

    div-long/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, p1, v2

    const-string v0, "%d\u79d2\u524d"

    invoke-static {p0, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const-wide/32 v4, 0x36ee80

    cmp-long v8, v0, v4

    if-gez v8, :cond_3

    .line 615
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    new-array p1, v3, [Ljava/lang/Object;

    div-long/2addr v0, v6

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, p1, v2

    const-string v0, "%d\u5206\u949f\u524d"

    invoke-static {p0, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 618
    :cond_3
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getWeeOfToday()J

    move-result-wide v0

    cmp-long v4, p0, v0

    if-ltz v4, :cond_4

    new-array v0, v3, [Ljava/lang/Object;

    .line 620
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    aput-object p0, v0, v2

    const-string p0, "\u4eca\u5929%tR"

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    const-wide/32 v4, 0x5265c00

    sub-long/2addr v0, v4

    cmp-long v4, p0, v0

    if-ltz v4, :cond_5

    new-array v0, v3, [Ljava/lang/Object;

    .line 622
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    aput-object p0, v0, v2

    const-string p0, "\u6628\u5929%tR"

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_5
    new-array v0, v3, [Ljava/lang/Object;

    .line 624
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    aput-object p0, v0, v2

    const-string p0, "%tF"

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFriendlyTimeSpanByNow(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 546
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->getFriendlyTimeSpanByNow(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFriendlyTimeSpanByNow(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 566
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 567
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->getFriendlyTimeSpanByNow(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFriendlyTimeSpanByNow(Ljava/util/Date;)Ljava/lang/String;
    .locals 2

    .line 586
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blankj/utilcode/util/TimeUtils;->getFriendlyTimeSpanByNow(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMillis(JJI)J
    .locals 0

    .line 655
    invoke-static {p2, p3, p4}, Lcom/blankj/utilcode/util/TimeUtils;->timeSpan2Millis(JI)J

    move-result-wide p2

    add-long/2addr p0, p2

    return-wide p0
.end method

.method public static getMillis(Ljava/lang/String;JI)J
    .locals 1

    .line 677
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0, p1, p2, p3}, Lcom/blankj/utilcode/util/TimeUtils;->getMillis(Ljava/lang/String;Ljava/text/DateFormat;JI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getMillis(Ljava/lang/String;Ljava/text/DateFormat;JI)J
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 697
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 700
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide p0

    invoke-static {p2, p3, p4}, Lcom/blankj/utilcode/util/TimeUtils;->timeSpan2Millis(JI)J

    move-result-wide p2

    add-long/2addr p0, p2

    return-wide p0
.end method

.method public static getMillis(Ljava/util/Date;JI)J
    .locals 2

    .line 721
    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->date2Millis(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {p1, p2, p3}, Lcom/blankj/utilcode/util/TimeUtils;->timeSpan2Millis(JI)J

    move-result-wide p0

    add-long/2addr v0, p0

    return-wide v0
.end method

.method public static getMillisByNow(JI)J
    .locals 2

    .line 961
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getNowMills()J

    move-result-wide v0

    invoke-static {v0, v1, p0, p1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->getMillis(JJI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getNowDate()Ljava/util/Date;
    .locals 1

    .line 370
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    return-object v0
.end method

.method public static getNowMills()J
    .locals 2

    .line 341
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getNowString()Ljava/lang/String;
    .locals 3

    .line 351
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/blankj/utilcode/util/TimeUtils;->millis2String(JLjava/text/DateFormat;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getNowString(Ljava/text/DateFormat;)Ljava/lang/String;
    .locals 2

    const-string v0, "Argument \'format\' of type DateFormat (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 360
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 361
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1, p0}, Lcom/blankj/utilcode/util/TimeUtils;->millis2String(JLjava/text/DateFormat;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getString(JJI)Ljava/lang/String;
    .locals 6

    .line 743
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v2

    move-wide v0, p0

    move-wide v3, p2

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/blankj/utilcode/util/TimeUtils;->getString(JLjava/text/DateFormat;JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getString(JLjava/text/DateFormat;JI)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 763
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 766
    invoke-static {p3, p4, p5}, Lcom/blankj/utilcode/util/TimeUtils;->timeSpan2Millis(JI)J

    move-result-wide p3

    add-long/2addr p0, p3

    invoke-static {p0, p1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->millis2String(JLjava/text/DateFormat;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getString(Ljava/lang/String;JI)Ljava/lang/String;
    .locals 1

    .line 788
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0, p1, p2, p3}, Lcom/blankj/utilcode/util/TimeUtils;->getString(Ljava/lang/String;Ljava/text/DateFormat;JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getString(Ljava/lang/String;Ljava/text/DateFormat;JI)Ljava/lang/String;
    .locals 2

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 808
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 811
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide v0

    invoke-static {p2, p3, p4}, Lcom/blankj/utilcode/util/TimeUtils;->timeSpan2Millis(JI)J

    move-result-wide p2

    add-long/2addr v0, p2

    invoke-static {v0, v1, p1}, Lcom/blankj/utilcode/util/TimeUtils;->millis2String(JLjava/text/DateFormat;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getString(Ljava/util/Date;JI)Ljava/lang/String;
    .locals 1

    .line 833
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0, p1, p2, p3}, Lcom/blankj/utilcode/util/TimeUtils;->getString(Ljava/util/Date;Ljava/text/DateFormat;JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getString(Ljava/util/Date;Ljava/text/DateFormat;JI)Ljava/lang/String;
    .locals 2

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 853
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 856
    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->date2Millis(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {p2, p3, p4}, Lcom/blankj/utilcode/util/TimeUtils;->timeSpan2Millis(JI)J

    move-result-wide p2

    add-long/2addr v0, p2

    invoke-static {v0, v1, p1}, Lcom/blankj/utilcode/util/TimeUtils;->millis2String(JLjava/text/DateFormat;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getStringByNow(JI)Ljava/lang/String;
    .locals 1

    .line 980
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lcom/blankj/utilcode/util/TimeUtils;->getStringByNow(JLjava/text/DateFormat;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getStringByNow(JLjava/text/DateFormat;I)Ljava/lang/String;
    .locals 7

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 999
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1001
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getNowMills()J

    move-result-wide v1

    move-object v3, p2

    move-wide v4, p0

    move v6, p3

    invoke-static/range {v1 .. v6}, Lcom/blankj/utilcode/util/TimeUtils;->getString(JLjava/text/DateFormat;JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getTimeSpan(JJI)J
    .locals 0

    sub-long/2addr p0, p2

    .line 241
    invoke-static {p0, p1, p4}, Lcom/blankj/utilcode/util/TimeUtils;->millis2TimeSpan(JI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getTimeSpan(Ljava/lang/String;Ljava/lang/String;I)J
    .locals 1

    .line 176
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lcom/blankj/utilcode/util/TimeUtils;->getTimeSpan(Ljava/lang/String;Ljava/lang/String;Ljava/text/DateFormat;I)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getTimeSpan(Ljava/lang/String;Ljava/lang/String;Ljava/text/DateFormat;I)J
    .locals 2

    const-string v0, "Argument \'format\' of type DateFormat (#2 out of 4, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 197
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 199
    invoke-static {p0, p2}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide v0

    invoke-static {p1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide p0

    sub-long/2addr v0, p0

    invoke-static {v0, v1, p3}, Lcom/blankj/utilcode/util/TimeUtils;->millis2TimeSpan(JI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getTimeSpan(Ljava/util/Date;Ljava/util/Date;I)J
    .locals 2

    .line 220
    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->date2Millis(Ljava/util/Date;)J

    move-result-wide v0

    invoke-static {p1}, Lcom/blankj/utilcode/util/TimeUtils;->date2Millis(Ljava/util/Date;)J

    move-result-wide p0

    sub-long/2addr v0, p0

    invoke-static {v0, v1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->millis2TimeSpan(JI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getTimeSpanByNow(JI)J
    .locals 2

    .line 446
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->getTimeSpan(JJI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getTimeSpanByNow(Ljava/lang/String;I)J
    .locals 2

    .line 389
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getNowString()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v1

    invoke-static {p0, v0, v1, p1}, Lcom/blankj/utilcode/util/TimeUtils;->getTimeSpan(Ljava/lang/String;Ljava/lang/String;Ljava/text/DateFormat;I)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getTimeSpanByNow(Ljava/lang/String;Ljava/text/DateFormat;I)J
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 408
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 410
    invoke-static {p1}, Lcom/blankj/utilcode/util/TimeUtils;->getNowString(Ljava/text/DateFormat;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1, p2}, Lcom/blankj/utilcode/util/TimeUtils;->getTimeSpan(Ljava/lang/String;Ljava/lang/String;Ljava/text/DateFormat;I)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getTimeSpanByNow(Ljava/util/Date;I)J
    .locals 1

    .line 428
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-static {p0, v0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->getTimeSpan(Ljava/util/Date;Ljava/util/Date;I)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getUSWeek(J)Ljava/lang/String;
    .locals 1

    .line 1201
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-static {v0}, Lcom/blankj/utilcode/util/TimeUtils;->getUSWeek(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getUSWeek(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1170
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getUSWeek(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getUSWeek(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 1180
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1181
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getUSWeek(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getUSWeek(Ljava/util/Date;)Ljava/lang/String;
    .locals 3

    .line 1191
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "EEEE"

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getValueByCalendarField(JI)I
    .locals 1

    .line 1279
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1280
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 1281
    invoke-virtual {v0, p2}, Ljava/util/Calendar;->get(I)I

    move-result p0

    return p0
.end method

.method public static getValueByCalendarField(Ljava/lang/String;I)I
    .locals 1

    .line 1220
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->getValueByCalendarField(Ljava/util/Date;I)I

    move-result p0

    return p0
.end method

.method public static getValueByCalendarField(Ljava/lang/String;Ljava/text/DateFormat;I)I
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 3, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 1239
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1241
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0, p2}, Lcom/blankj/utilcode/util/TimeUtils;->getValueByCalendarField(Ljava/util/Date;I)I

    move-result p0

    return p0
.end method

.method public static getValueByCalendarField(Ljava/util/Date;I)I
    .locals 1

    .line 1259
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1260
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 1261
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p0

    return p0
.end method

.method private static getWeeOfToday()J
    .locals 3

    .line 629
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const/16 v1, 0xb

    const/4 v2, 0x0

    .line 630
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    const/16 v1, 0xd

    .line 631
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    const/16 v1, 0xc

    .line 632
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    const/16 v1, 0xe

    .line 633
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 634
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getZodiac(II)Ljava/lang/String;
    .locals 3

    .line 1401
    sget-object v0, Lcom/blankj/utilcode/util/TimeUtils;->ZODIAC:[Ljava/lang/String;

    sget-object v1, Lcom/blankj/utilcode/util/TimeUtils;->ZODIAC_FLAGS:[I

    add-int/lit8 v2, p0, -0x1

    aget v1, v1, v2

    if-lt p1, v1, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 p0, p0, 0xa

    rem-int/lit8 v2, p0, 0xc

    :goto_0
    aget-object p0, v0, v2

    return-object p0
.end method

.method public static getZodiac(J)Ljava/lang/String;
    .locals 0

    .line 1390
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->millis2Date(J)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getZodiac(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getZodiac(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1355
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getZodiac(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getZodiac(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 1365
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1366
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->getZodiac(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getZodiac(Ljava/util/Date;)Ljava/lang/String;
    .locals 2

    .line 1376
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1377
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/4 p0, 0x2

    .line 1378
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    const/4 v1, 0x5

    .line 1379
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 1380
    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->getZodiac(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static isLeapYear(I)Z
    .locals 1

    .line 1117
    rem-int/lit8 v0, p0, 0x4

    if-nez v0, :cond_0

    rem-int/lit8 v0, p0, 0x64

    if-nez v0, :cond_1

    :cond_0
    rem-int/lit16 p0, p0, 0x190

    if-nez p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isLeapYear(J)Z
    .locals 0

    .line 1107
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->millis2Date(J)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->isLeapYear(Ljava/util/Date;)Z

    move-result p0

    return p0
.end method

.method public static isLeapYear(Ljava/lang/String;)Z
    .locals 1

    .line 1073
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->isLeapYear(Ljava/util/Date;)Z

    move-result p0

    return p0
.end method

.method public static isLeapYear(Ljava/lang/String;Ljava/text/DateFormat;)Z
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 1083
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1084
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->isLeapYear(Ljava/util/Date;)Z

    move-result p0

    return p0
.end method

.method public static isLeapYear(Ljava/util/Date;)Z
    .locals 1

    .line 1094
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1095
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/4 p0, 0x1

    .line 1096
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p0

    .line 1097
    invoke-static {p0}, Lcom/blankj/utilcode/util/TimeUtils;->isLeapYear(I)Z

    move-result p0

    return p0
.end method

.method public static isToday(J)Z
    .locals 4

    .line 1061
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getWeeOfToday()J

    move-result-wide v0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_0

    const-wide/32 v2, 0x5265c00

    add-long/2addr v0, v2

    cmp-long v2, p0, v0

    if-gez v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isToday(Ljava/lang/String;)Z
    .locals 2

    .line 1030
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blankj/utilcode/util/TimeUtils;->isToday(J)Z

    move-result p0

    return p0
.end method

.method public static isToday(Ljava/lang/String;Ljava/text/DateFormat;)Z
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 1040
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1041
    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/blankj/utilcode/util/TimeUtils;->isToday(J)Z

    move-result p0

    return p0
.end method

.method public static isToday(Ljava/util/Date;)Z
    .locals 2

    .line 1051
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/blankj/utilcode/util/TimeUtils;->isToday(J)Z

    move-result p0

    return p0
.end method

.method public static millis2Date(J)Ljava/util/Date;
    .locals 1

    .line 154
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method private static millis2FitTimeSpan(JI)Ljava/lang/String;
    .locals 9

    if-gtz p2, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/4 v0, 0x5

    .line 1416
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    const-string v1, "\u5929"

    const-string v2, "\u5c0f\u65f6"

    const-string v3, "\u5206\u949f"

    const-string v4, "\u79d2"

    const-string v5, "\u6beb\u79d2"

    .line 1417
    filled-new-array {v1, v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    cmp-long v5, p0, v2

    if-nez v5, :cond_1

    .line 1418
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, -0x1

    aget-object p1, v1, p2

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1419
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    if-gez v5, :cond_2

    const-string v3, "-"

    .line 1421
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    neg-long p0, p0

    :cond_2
    new-array v0, v0, [I

    .line 1424
    fill-array-data v0, :array_0

    :goto_0
    if-ge v4, p2, :cond_4

    .line 1426
    aget v3, v0, v4

    int-to-long v5, v3

    cmp-long v3, p0, v5

    if-ltz v3, :cond_3

    .line 1427
    aget v3, v0, v4

    int-to-long v5, v3

    div-long v5, p0, v5

    .line 1428
    aget v3, v0, v4

    int-to-long v7, v3

    mul-long v7, v7, v5

    sub-long/2addr p0, v7

    .line 1429
    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    aget-object v3, v1, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1432
    :cond_4
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :array_0
    .array-data 4
        0x5265c00
        0x36ee80
        0xea60
        0x3e8
        0x1
    .end array-data
.end method

.method public static millis2String(J)Ljava/lang/String;
    .locals 1

    .line 47
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/blankj/utilcode/util/TimeUtils;->millis2String(JLjava/text/DateFormat;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static millis2String(JLjava/text/DateFormat;)Ljava/lang/String;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 57
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 58
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static millis2TimeSpan(JI)J
    .locals 2

    int-to-long v0, p2

    .line 1411
    div-long/2addr p0, v0

    return-wide p0
.end method

.method public static string2Date(Ljava/lang/String;)Ljava/util/Date;
    .locals 1

    .line 96
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object p0

    return-object p0
.end method

.method public static string2Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Date;
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 106
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 108
    :try_start_0
    invoke-virtual {p1, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 110
    invoke-virtual {p0}, Ljava/text/ParseException;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static string2Millis(Ljava/lang/String;)J
    .locals 2

    .line 69
    invoke-static {}, Lcom/blankj/utilcode/util/TimeUtils;->getDefaultFormat()Ljava/text/SimpleDateFormat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blankj/utilcode/util/TimeUtils;->string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static string2Millis(Ljava/lang/String;Ljava/text/DateFormat;)J
    .locals 1

    const-string v0, "Argument \'format\' of type DateFormat (#1 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it"

    .line 79
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    :try_start_0
    invoke-virtual {p1, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide p0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    move-exception p0

    .line 83
    invoke-virtual {p0}, Ljava/text/ParseException;->printStackTrace()V

    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method private static timeSpan2Millis(JI)J
    .locals 2

    int-to-long v0, p2

    mul-long p0, p0, v0

    return-wide p0
.end method
