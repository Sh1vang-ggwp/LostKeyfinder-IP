.class public Lcom/jianjin/camera/SavePicHandler;
.super Landroid/os/Handler;
.source "SavePicHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SavePicHandler"


# instance fields
.field private data:[B

.field private handler:Landroid/os/Handler;

.field private ioExceptionRetried:Z

.field private isBackCamera:Z

.field private sampleSizeSuggested:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;Landroid/os/Handler;[BZ)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 45
    iput-object p2, p0, Lcom/jianjin/camera/SavePicHandler;->handler:Landroid/os/Handler;

    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, Lcom/jianjin/camera/SavePicHandler;->sampleSizeSuggested:Z

    .line 47
    iput-boolean p1, p0, Lcom/jianjin/camera/SavePicHandler;->ioExceptionRetried:Z

    .line 48
    iput-object p3, p0, Lcom/jianjin/camera/SavePicHandler;->data:[B

    .line 49
    iput-boolean p4, p0, Lcom/jianjin/camera/SavePicHandler;->isBackCamera:Z

    return-void
.end method

.method public static rotateReversalBitmap(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .locals 7

    .line 111
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    if-eqz p1, :cond_0

    const/high16 v0, 0x42b40000    # 90.0f

    goto :goto_0

    :cond_0
    const/high16 v0, 0x43870000    # 270.0f

    .line 112
    :goto_0
    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    if-nez p1, :cond_1

    const/high16 p1, -0x40800000    # -1.0f

    const/high16 v0, 0x3f800000    # 1.0f

    .line 115
    invoke-virtual {v5, p1, v0}, Landroid/graphics/Matrix;->postScale(FF)Z

    :cond_1
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 119
    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 120
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    .line 119
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const/4 p1, 0x0

    :goto_1
    if-nez p1, :cond_2

    move-object p1, p0

    :cond_2
    if-eq p0, p1, :cond_3

    .line 127
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_3
    return-object p1
.end method

.method private save(Landroid/graphics/Bitmap;Ljava/lang/String;)Z
    .locals 3

    .line 133
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 134
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_0

    .line 135
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    :cond_0
    const/4 p2, 0x0

    .line 139
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 140
    :try_start_1
    sget-object p2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v0, 0x50

    invoke-virtual {p1, p2, v0, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, 0x1

    .line 148
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V

    .line 149
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 151
    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return p1

    :catchall_0
    move-exception p1

    move-object p2, v1

    goto :goto_3

    :catch_1
    move-exception p1

    move-object p2, v1

    goto :goto_1

    :catchall_1
    move-exception p1

    goto :goto_3

    :catch_2
    move-exception p1

    .line 143
    :goto_1
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    const/4 p1, 0x0

    if-eqz p2, :cond_1

    .line 148
    :try_start_4
    invoke-virtual {p2}, Ljava/io/BufferedOutputStream;->flush()V

    .line 149
    invoke-virtual {p2}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_2

    :catch_3
    move-exception p2

    .line 151
    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    :goto_2
    return p1

    :goto_3
    if-eqz p2, :cond_2

    .line 148
    :try_start_5
    invoke-virtual {p2}, Ljava/io/BufferedOutputStream;->flush()V

    .line 149
    invoke-virtual {p2}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_4

    :catch_4
    move-exception p2

    .line 151
    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    .line 152
    :cond_2
    :goto_4
    throw p1
.end method

.method private saveToSDCard([B)Ljava/lang/String;
    .locals 4

    .line 70
    sget-object v0, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 71
    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 76
    :cond_0
    invoke-static {}, Lcom/jianjin/camera/utils/FileUtils;->getPhotoPathForLockWallPaper()Ljava/lang/String;

    move-result-object v0

    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v0, Landroid/text/format/DateFormat;

    invoke-direct {v0}, Landroid/text/format/DateFormat;-><init>()V

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    const-string v3, "yyyyMMddHHmmss"

    .line 79
    invoke-static {v3, v0}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Date;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 80
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".jpg"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    .line 83
    array-length v3, p1

    invoke-static {p1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 85
    iget-boolean v2, p0, Lcom/jianjin/camera/SavePicHandler;->isBackCamera:Z

    invoke-static {p1, v2}, Lcom/jianjin/camera/SavePicHandler;->rotateReversalBitmap(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 86
    invoke-direct {p0, p1, v0}, Lcom/jianjin/camera/SavePicHandler;->save(Landroid/graphics/Bitmap;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    return-object v1

    .line 91
    :cond_1
    invoke-direct {p0, v0}, Lcom/jianjin/camera/SavePicHandler;->setPictureDegreeZero(Ljava/lang/String;)V

    return-object v0
.end method

.method private setPictureDegreeZero(Ljava/lang/String;)V
    .locals 2

    .line 165
    :try_start_0
    new-instance v0, Landroid/media/ExifInterface;

    invoke-direct {v0, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 168
    iget-boolean p1, p0, Lcom/jianjin/camera/SavePicHandler;->isBackCamera:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "Orientation"

    if-eqz p1, :cond_0

    :try_start_1
    const-string p1, "ExifInterface.ORIENTATION_ROTATE_90"

    .line 169
    invoke-virtual {v0, v1, p1}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p1, "ExifInterface.ORIENTATION_ROTATE_270"

    .line 171
    invoke-virtual {v0, v1, p1}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    :goto_0
    invoke-virtual {v0}, Landroid/media/ExifInterface;->saveAttributes()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 175
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 54
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 55
    iget-object p1, p0, Lcom/jianjin/camera/SavePicHandler;->data:[B

    invoke-direct {p0, p1}, Lcom/jianjin/camera/SavePicHandler;->saveToSDCard([B)Ljava/lang/String;

    move-result-object p1

    .line 56
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    if-nez p1, :cond_0

    const/4 p1, -0x1

    .line 58
    iput p1, v0, Landroid/os/Message;->what:I

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    .line 60
    iput v1, v0, Landroid/os/Message;->what:I

    .line 61
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "save_img_path"

    .line 62
    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 66
    :goto_0
    iget-object p1, p0, Lcom/jianjin/camera/SavePicHandler;->handler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
