.class public final Lcom/blankj/utilcode/util/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blankj/utilcode/util/Utils$OnActivityDestroyedListener;,
        Lcom/blankj/utilcode/util/Utils$OnAppStatusChangedListener;,
        Lcom/blankj/utilcode/util/Utils$FileProvider4UtilCode;,
        Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;
    }
.end annotation


# static fields
.field private static final ACTIVITY_LIFECYCLE:Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;

.field private static final PERMISSION_ACTIVITY_CLASS_NAME:Ljava/lang/String; = "com.blankj.utilcode.util.PermissionUtils$PermissionActivity"

.field private static sApplication:Landroid/app/Application;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    new-instance v0, Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;

    invoke-direct {v0}, Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;-><init>()V

    sput-object v0, Lcom/blankj/utilcode/util/Utils;->ACTIVITY_LIFECYCLE:Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "u can\'t instantiate me..."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static getActivityLifecycle()Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;
    .locals 1

    .line 130
    sget-object v0, Lcom/blankj/utilcode/util/Utils;->ACTIVITY_LIFECYCLE:Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;

    return-object v0
.end method

.method static getActivityList()Ljava/util/LinkedList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .line 134
    sget-object v0, Lcom/blankj/utilcode/util/Utils;->ACTIVITY_LIFECYCLE:Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;

    iget-object v0, v0, Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;->mActivityList:Ljava/util/LinkedList;

    return-object v0
.end method

.method public static getApp()Landroid/app/Application;
    .locals 1

    .line 101
    sget-object v0, Lcom/blankj/utilcode/util/Utils;->sApplication:Landroid/app/Application;

    if-eqz v0, :cond_0

    return-object v0

    .line 102
    :cond_0
    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->getApplicationByReflect()Landroid/app/Application;

    move-result-object v0

    .line 103
    invoke-static {v0}, Lcom/blankj/utilcode/util/Utils;->init(Landroid/app/Application;)V

    return-object v0
.end method

.method private static getApplicationByReflect()Landroid/app/Application;
    .locals 6

    const-string v0, "u should init first"

    :try_start_0
    const-string v1, "android.app.ActivityThread"

    .line 110
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "currentActivityThread"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    .line 111
    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v4, 0x0

    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "getApplication"

    new-array v5, v3, [Ljava/lang/Class;

    .line 112
    invoke-virtual {v1, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 116
    check-cast v1, Landroid/app/Application;

    return-object v1

    .line 114
    :cond_0
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    .line 124
    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v1

    .line 122
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception v1

    .line 120
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    :catch_3
    move-exception v1

    .line 118
    invoke-virtual {v1}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    .line 126
    :goto_0
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static getTopActivityOrApp()Landroid/content/Context;
    .locals 1

    .line 138
    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->isAppForeground()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    sget-object v0, Lcom/blankj/utilcode/util/Utils;->ACTIVITY_LIFECYCLE:Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;

    invoke-virtual {v0}, Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;->getTopActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 140
    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->getApp()Landroid/app/Application;

    move-result-object v0

    :cond_0
    return-object v0

    .line 142
    :cond_1
    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->getApp()Landroid/app/Application;

    move-result-object v0

    return-object v0
.end method

.method public static init(Landroid/app/Application;)V
    .locals 2

    .line 78
    sget-object v0, Lcom/blankj/utilcode/util/Utils;->sApplication:Landroid/app/Application;

    if-nez v0, :cond_1

    if-nez p0, :cond_0

    .line 80
    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->getApplicationByReflect()Landroid/app/Application;

    move-result-object p0

    sput-object p0, Lcom/blankj/utilcode/util/Utils;->sApplication:Landroid/app/Application;

    goto :goto_0

    .line 82
    :cond_0
    sput-object p0, Lcom/blankj/utilcode/util/Utils;->sApplication:Landroid/app/Application;

    .line 84
    :goto_0
    sget-object p0, Lcom/blankj/utilcode/util/Utils;->sApplication:Landroid/app/Application;

    sget-object v0, Lcom/blankj/utilcode/util/Utils;->ACTIVITY_LIFECYCLE:Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_1

    :cond_1
    if-eqz p0, :cond_2

    .line 86
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Lcom/blankj/utilcode/util/Utils;->sApplication:Landroid/app/Application;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_2

    .line 87
    sget-object v0, Lcom/blankj/utilcode/util/Utils;->sApplication:Landroid/app/Application;

    sget-object v1, Lcom/blankj/utilcode/util/Utils;->ACTIVITY_LIFECYCLE:Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 88
    iget-object v0, v1, Lcom/blankj/utilcode/util/Utils$ActivityLifecycleImpl;->mActivityList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 89
    sput-object p0, Lcom/blankj/utilcode/util/Utils;->sApplication:Landroid/app/Application;

    .line 90
    invoke-virtual {p0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public static init(Landroid/content/Context;)V
    .locals 0

    if-nez p0, :cond_0

    .line 65
    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->getApplicationByReflect()Landroid/app/Application;

    move-result-object p0

    invoke-static {p0}, Lcom/blankj/utilcode/util/Utils;->init(Landroid/app/Application;)V

    return-void

    .line 68
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Landroid/app/Application;

    invoke-static {p0}, Lcom/blankj/utilcode/util/Utils;->init(Landroid/app/Application;)V

    return-void
.end method

.method static isAppForeground()Z
    .locals 5

    .line 147
    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->getApp()Landroid/app/Application;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 149
    :cond_0
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 150
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 151
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 152
    iget v3, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v4, 0x64

    if-ne v3, v4, :cond_2

    .line 153
    iget-object v0, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-static {}, Lcom/blankj/utilcode/util/Utils;->getApp()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_3
    :goto_0
    return v1
.end method
