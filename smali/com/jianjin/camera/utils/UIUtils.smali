.class public Lcom/jianjin/camera/utils/UIUtils;
.super Ljava/lang/Object;
.source "UIUtils.java"


# static fields
.field public static screenHeight:I

.field public static screenWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static init()V
    .locals 2

    .line 15
    sget-object v0, Lcom/jianjin/camera/CustomCameraAgent;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 17
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v1, Lcom/jianjin/camera/utils/UIUtils;->screenWidth:I

    .line 18
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    sput v0, Lcom/jianjin/camera/utils/UIUtils;->screenHeight:I

    return-void
.end method

.method public static setWidthAndHeight(II)V
    .locals 0

    .line 22
    sput p0, Lcom/jianjin/camera/utils/UIUtils;->screenWidth:I

    .line 23
    sput p1, Lcom/jianjin/camera/utils/UIUtils;->screenHeight:I

    return-void
.end method
