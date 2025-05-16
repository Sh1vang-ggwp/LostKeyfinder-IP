.class public Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;
.super Ljava/lang/Object;
.source "MyUserSetting.java"


# static fields
.field private static myUserSetting:Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;


# instance fields
.field private mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    return-void
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;
    .locals 1

    .line 21
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->myUserSetting:Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;-><init>()V

    sput-object v0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->myUserSetting:Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    .line 25
    :cond_0
    sget-object v0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->myUserSetting:Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;

    return-object v0
.end method


# virtual methods
.method public InitUserSetting()V
    .locals 4

    .line 30
    const-class v0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    const/4 v1, 0x0

    new-array v2, v1, [J

    invoke-static {v0, v2}, Lorg/litepal/LitePal;->findAll(Ljava/lang/Class;[J)Ljava/util/List;

    move-result-object v0

    .line 32
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const-string v3, "\u8bbe\u7f6e"

    if-gtz v2, :cond_0

    const-string v0, "\u7528\u6237\u8bbe\u7f6e\u4e0d\u5b58\u5728\uff01\u521b\u5efa\u4e00\u4e2a\u7528\u6237\u8bbe\u7f6e"

    .line 34
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    new-instance v0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;-><init>()V

    .line 36
    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->save()Z

    .line 38
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    goto :goto_0

    :cond_0
    const-string v2, "\u7528\u6237\u8bbe\u7f6e\u5b58\u5728!\u4fdd\u5b58\u5230\u5f53\u524d"

    .line 42
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    :goto_0
    return-void
.end method

.method public getMySetting()Lcom/lenzetech/isearchingtwo/Bean/MySetting;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    return-object v0
.end method

.method public shouleWifiSettingAlarm()Z
    .locals 3

    .line 59
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->isWifiDisTr()Z

    move-result v0

    const/4 v1, 0x1

    const-string v2, "\u8bbe\u7f6e"

    if-eqz v0, :cond_1

    .line 61
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->isWifi()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u6253\u5f00WIFI\u52ff\u6270\u5728WIFI\u4e0b \u62a5\u8b66"

    .line 62
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0

    :cond_0
    const-string v0, "\u6253\u5f00WIFI\u52ff\u6270\u4f46\u662f\u4e0d\u518dWIFI\u4e0b \u9700\u8981\u62a5\u8b66"

    .line 68
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    const-string v0, "\u672a\u6253\u5f00WIFI\u52ff\u6270 \u9700\u8981\u62a5\u8b66"

    .line 75
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method public showTimeAlarm()Z
    .locals 11

    .line 86
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getEndHour()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3c

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getEndMin()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 87
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getStartHour()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/lit8 v1, v1, 0x3c

    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->getStartMin()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 91
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 92
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u5e74: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 93
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u6708: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v6, 0x2

    invoke-virtual {v2, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    add-int/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 94
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u65e5: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v7, 0x5

    invoke-virtual {v2, v7}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 95
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u65f6: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v7, 0xb

    invoke-virtual {v2, v7}, Ljava/util/Calendar;->get(I)I

    move-result v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 96
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u5206: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v8, 0xc

    invoke-virtual {v2, v8}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 97
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u79d2: "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v9, 0xd

    invoke-virtual {v2, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 98
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u5f53\u524d\u65f6\u95f4\u6beb\u79d2\u6570\uff1a"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v9

    invoke-virtual {v4, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v2, v7}, Ljava/util/Calendar;->get(I)I

    move-result v3

    mul-int/lit8 v3, v3, 0x3c

    invoke-virtual {v2, v8}, Ljava/util/Calendar;->get(I)I

    move-result v2

    add-int/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 105
    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/Utils/MyUserSetting;->mySetting:Lcom/lenzetech/isearchingtwo/Bean/MySetting;

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Bean/MySetting;->isTimeDisTr()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 111
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string v7, "\u4e0d\u518d\u52ff\u6270\u65f6\u95f4\u5185"

    const/4 v8, 0x0

    if-lt v3, v4, :cond_2

    .line 116
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v4, "\u540c\u4e00\u5929"

    if-gt v3, v1, :cond_1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v1, v0, :cond_0

    goto :goto_0

    .line 123
    :cond_0
    invoke-static {v4, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v5

    :cond_1
    :goto_0
    const-string v0, "\u5728\u52ff\u6270\u65f6\u95f4\u5185"

    .line 118
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v8

    .line 133
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-gt v3, v1, :cond_4

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v1, v0, :cond_3

    goto :goto_1

    .line 139
    :cond_3
    invoke-static {v7, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v5

    :cond_4
    :goto_1
    const-string v0, "\u65f6\u95f4\u5224\u65ad\u5728\u52ff\u6270\u65f6\u95f4\u5185 \u4e0d\u62a5\u8b66"

    .line 134
    invoke-static {v0, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v8

    :cond_5
    const-string v0, "\u672a\u6253\u5f00\u65f6\u95f4\u62a5\u8b66"

    const-string v1, "\u5e94\u8be5\u62a5\u8b66"

    .line 149
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v5
.end method
