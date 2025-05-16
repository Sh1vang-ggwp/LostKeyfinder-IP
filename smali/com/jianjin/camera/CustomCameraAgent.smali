.class public Lcom/jianjin/camera/CustomCameraAgent;
.super Ljava/lang/Object;
.source "CustomCameraAgent.java"


# static fields
.field public static isInit:Z = false

.field public static isShowLog:Z = false

.field public static mContext:Landroid/content/Context; = null

.field public static picFileName:Ljava/lang/String; = "photos"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static init(Landroid/app/Application;)V
    .locals 0

    .line 21
    sput-object p0, Lcom/jianjin/camera/CustomCameraAgent;->mContext:Landroid/content/Context;

    .line 22
    invoke-static {}, Lcom/jianjin/camera/utils/UIUtils;->init()V

    const/4 p0, 0x1

    .line 23
    sput-boolean p0, Lcom/jianjin/camera/CustomCameraAgent;->isInit:Z

    return-void
.end method

.method public static openLog()V
    .locals 1

    const/4 v0, 0x1

    .line 30
    sput-boolean v0, Lcom/jianjin/camera/CustomCameraAgent;->isShowLog:Z

    return-void
.end method

.method public static setCameraWidthAndHeight(II)V
    .locals 0

    .line 41
    invoke-static {p0, p1}, Lcom/jianjin/camera/utils/UIUtils;->setWidthAndHeight(II)V

    return-void
.end method

.method public static setPicFileName(Ljava/lang/String;)V
    .locals 0

    return-void
.end method
