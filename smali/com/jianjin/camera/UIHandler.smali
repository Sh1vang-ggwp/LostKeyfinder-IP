.class public Lcom/jianjin/camera/UIHandler;
.super Landroid/os/Handler;
.source "UIHandler.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field private softReference:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference<",
            "Lcom/jianjin/camera/widget/CameraContainer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/jianjin/camera/widget/CameraContainer;)V
    .locals 1

    .line 31
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    const-string v0, "UIHandler"

    .line 27
    iput-object v0, p0, Lcom/jianjin/camera/UIHandler;->TAG:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/jianjin/camera/UIHandler;->softReference:Ljava/lang/ref/SoftReference;

    return-void
.end method

.method private insertMediaStore(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    .line 88
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 89
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v1, "_data"

    .line 90
    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "/"

    .line 92
    invoke-virtual {p2, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    const-string v1, "title"

    .line 91
    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const-string v1, "datetaken"

    .line 93
    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p2, "mime_type"

    const-string v1, "image/jpeg"

    .line 95
    invoke-virtual {v0, p2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    sget-object p2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p1, p2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 37
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 38
    iget-object v0, p0, Lcom/jianjin/camera/UIHandler;->softReference:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jianjin/camera/widget/CameraContainer;

    if-nez v0, :cond_0

    return-void

    .line 41
    :cond_0
    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraContainer;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_1

    return-void

    .line 44
    :cond_1
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_2

    return-void

    .line 47
    :cond_2
    invoke-virtual {v0}, Lcom/jianjin/camera/widget/CameraContainer;->getSavePicCallback()Lcom/jianjin/camera/widget/ISavePicCallback;

    move-result-object v0

    .line 49
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v3, -0x1

    if-eq p1, v3, :cond_5

    const/4 v3, 0x1

    if-eq p1, v3, :cond_3

    goto :goto_0

    .line 51
    :cond_3
    iget-object p1, p0, Lcom/jianjin/camera/UIHandler;->TAG:Ljava/lang/String;

    const-string v3, "\u5b58\u50a8\u6210\u529f\uff0c\u6253\u5f00\u7b2c\u4e8c\u4e2a\u754c\u9762\u5c55\u793a\u7167\u7247"

    invoke-static {p1, v3}, Lcom/jianjin/camera/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "save_img_path"

    .line 56
    invoke-virtual {v2, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 57
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    return-void

    .line 60
    :cond_4
    invoke-direct {p0, v1, p1}, Lcom/jianjin/camera/UIHandler;->insertMediaStore(Landroid/app/Activity;Ljava/lang/String;)V

    if-eqz v0, :cond_6

    .line 69
    invoke-interface {v0, p1}, Lcom/jianjin/camera/widget/ISavePicCallback;->saveComplete(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    if-eqz v0, :cond_6

    const-string p1, "\u5931\u8d25"

    .line 74
    invoke-interface {v0, p1}, Lcom/jianjin/camera/widget/ISavePicCallback;->saveFailure(Ljava/lang/String;)V

    :cond_6
    :goto_0
    return-void
.end method
