.class Landroidx/camera/core/imagecapture/JpegBytes2Disk;
.super Ljava/lang/Object;
.source "JpegBytes2Disk.java"

# interfaces
.implements Landroidx/camera/core/processing/Operation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Operation<",
        "Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;",
        "Landroidx/camera/core/ImageCapture$OutputFileResults;",
        ">;"
    }
.end annotation


# static fields
.field private static final COPY_BUFFER_SIZE:I = 0x400

.field private static final NOT_PENDING:I = 0x0

.field private static final PENDING:I = 0x1

.field private static final TEMP_FILE_PREFIX:Ljava/lang/String; = "CameraX"

.field private static final TEMP_FILE_SUFFIX:Ljava/lang/String; = ".tmp"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyFileToFile(Ljava/io/File;Ljava/io/File;)Landroid/net/Uri;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 199
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 200
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 202
    :cond_0
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 208
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    .line 203
    :cond_1
    new-instance p0, Landroidx/camera/core/ImageCaptureException;

    const/4 v0, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to overwrite the file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p0
.end method

.method private static copyFileToMediaStore(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 172
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Landroid/content/ContentResolver;

    .line 173
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 174
    new-instance v1, Landroid/content/ContentValues;

    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    goto :goto_0

    .line 175
    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    :goto_0
    const/4 v2, 0x1

    .line 176
    invoke-static {v1, v2}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->setContentValuePendingFlag(Landroid/content/ContentValues;I)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 179
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getSaveCollection()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_1

    .line 184
    :try_start_1
    invoke-static {p0, p1, v0}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyTempFileToUri(Ljava/io/File;Landroid/net/Uri;Landroid/content/ContentResolver;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 189
    invoke-static {p1, v0, v3}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->updateUriPendingStatus(Landroid/net/Uri;Landroid/content/ContentResolver;I)V

    return-object p1

    :catchall_0
    move-exception p0

    move-object v4, p1

    goto :goto_3

    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    :goto_1
    move-object v4, p1

    goto :goto_2

    .line 181
    :cond_1
    :try_start_2
    new-instance p0, Landroidx/camera/core/ImageCaptureException;

    const-string v1, "Failed to insert a MediaStore URI."

    invoke-direct {p0, v2, v1, v4}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_1
    move-exception p0

    goto :goto_3

    :catch_2
    move-exception p0

    goto :goto_2

    :catch_3
    move-exception p0

    .line 186
    :goto_2
    :try_start_3
    new-instance p1, Landroidx/camera/core/ImageCaptureException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to write to MediaStore URI: "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v2, v1, p0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 189
    :goto_3
    invoke-static {v4, v0, v3}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->updateUriPendingStatus(Landroid/net/Uri;Landroid/content/ContentResolver;I)V

    .line 190
    throw p0
.end method

.method private static copyFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 230
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 p0, 0x400

    :try_start_0
    new-array p0, p0, [B

    .line 233
    :goto_0
    invoke-virtual {v0, p0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-lez v1, :cond_0

    const/4 v2, 0x0

    .line 234
    invoke-virtual {p1, p0, v2, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 236
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    return-void

    :catchall_0
    move-exception p0

    .line 230
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p0
.end method

.method private static copyFileToTarget(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 151
    invoke-static {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->isSaveToMediaStore(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    invoke-static {p0, p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyFileToMediaStore(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    .line 153
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->isSaveToOutputStream(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 155
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Ljava/io/OutputStream;

    invoke-static {p0, p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 158
    :catch_0
    new-instance p0, Landroidx/camera/core/ImageCaptureException;

    const/4 p1, 0x1

    const-string v0, "Failed to write to OutputStream."

    invoke-direct {p0, p1, v0, v1}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    .line 161
    :cond_1
    invoke-static {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->isSaveToFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 162
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Ljava/io/File;

    invoke-static {p0, p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyFileToFile(Ljava/io/File;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    .line 164
    :cond_2
    new-instance p0, Landroidx/camera/core/ImageCaptureException;

    const/4 p1, 0x0

    const-string v0, "Invalid OutputFileOptions"

    invoke-direct {p0, p1, v0, v1}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p0
.end method

.method private static copyTempFileToUri(Ljava/io/File;Landroid/net/Uri;Landroid/content/ContentResolver;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    invoke-virtual {p2, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 222
    :try_start_0
    invoke-static {p0, p2}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p2, :cond_0

    .line 223
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    :cond_0
    return-void

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 220
    :cond_1
    :try_start_1
    new-instance p0, Ljava/io/FileNotFoundException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " cannot be resolved."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p2, :cond_2

    .line 218
    :try_start_2
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw p0
.end method

.method private static createTempFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Ljava/io/File;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 81
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v0, ".tmp"

    const-string v1, "CameraX"

    if-eqz p0, :cond_0

    .line 85
    :try_start_1
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    .line 88
    :cond_0
    invoke-static {v1, v0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 91
    new-instance v0, Landroidx/camera/core/ImageCaptureException;

    const/4 v1, 0x1

    const-string v2, "Failed to create temp file."

    invoke-direct {v0, v1, v2, p0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static isSaveToFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z
    .locals 0

    .line 265
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isSaveToMediaStore(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z
    .locals 1

    .line 259
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getSaveCollection()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 260
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 261
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isSaveToOutputStream(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z
    .locals 0

    .line 269
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static setContentValuePendingFlag(Landroid/content/ContentValues;I)V
    .locals 2

    .line 253
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 254
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v0, "is_pending"

    invoke-virtual {p0, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_0
    return-void
.end method

.method private static updateFileExif(Ljava/io/File;Landroidx/camera/core/impl/utils/Exif;Landroidx/camera/core/ImageCapture$OutputFileOptions;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 115
    :try_start_0
    invoke-static {p0}, Landroidx/camera/core/impl/utils/Exif;->createFromFile(Ljava/io/File;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object p0

    .line 116
    invoke-virtual {p1, p0}, Landroidx/camera/core/impl/utils/Exif;->copyToCroppedImage(Landroidx/camera/core/impl/utils/Exif;)V

    .line 118
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getRotation()I

    move-result p1

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    .line 122
    invoke-virtual {p0, p3}, Landroidx/camera/core/impl/utils/Exif;->rotate(I)V

    .line 126
    :cond_0
    invoke-virtual {p2}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getMetadata()Landroidx/camera/core/ImageCapture$Metadata;

    move-result-object p1

    .line 127
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedHorizontal()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 128
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->flipHorizontally()V

    .line 130
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedVertical()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 131
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->flipVertically()V

    .line 133
    :cond_2
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$Metadata;->getLocation()Landroid/location/Location;

    move-result-object p2

    if-eqz p2, :cond_3

    .line 134
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$Metadata;->getLocation()Landroid/location/Location;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/utils/Exif;->attachLocation(Landroid/location/Location;)V

    .line 136
    :cond_3
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->save()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 138
    new-instance p1, Landroidx/camera/core/ImageCaptureException;

    const/4 p2, 0x1

    const-string p3, "Failed to update Exif data"

    invoke-direct {p1, p2, p3, p0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method private static updateUriPendingStatus(Landroid/net/Uri;Landroid/content/ContentResolver;I)V
    .locals 2

    .line 244
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 245
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 246
    invoke-static {v0, p2}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->setContentValuePendingFlag(Landroid/content/ContentValues;I)V

    const/4 p2, 0x0

    .line 247
    invoke-virtual {p1, p0, v0, p2, p2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method private static writeBytesToFile(Ljava/io/File;[B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 100
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    :try_start_1
    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    :catchall_0
    move-exception p0

    .line 100
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p0

    .line 103
    new-instance p1, Landroidx/camera/core/ImageCaptureException;

    const/4 v0, 0x1

    const-string v1, "Failed to write to temp file"

    invoke-direct {p1, v0, v1, p0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method


# virtual methods
.method public apply(Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;)Landroidx/camera/core/ImageCapture$OutputFileResults;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 64
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;->getPacket()Landroidx/camera/core/processing/Packet;

    move-result-object v0

    .line 65
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;->getOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object p1

    .line 66
    invoke-static {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->createTempFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Ljava/io/File;

    move-result-object v1

    .line 67
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-static {v1, v2}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->writeBytesToFile(Ljava/io/File;[B)V

    .line 68
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getExif()Landroidx/camera/core/impl/utils/Exif;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    check-cast v3, Landroidx/camera/core/impl/utils/Exif;

    .line 69
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v0

    .line 68
    invoke-static {v1, v2, p1, v0}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->updateFileExif(Ljava/io/File;Landroidx/camera/core/impl/utils/Exif;Landroidx/camera/core/ImageCapture$OutputFileOptions;I)V

    .line 70
    invoke-static {v1, p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyFileToTarget(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;

    move-result-object p1

    .line 71
    new-instance v0, Landroidx/camera/core/ImageCapture$OutputFileResults;

    invoke-direct {v0, p1}, Landroidx/camera/core/ImageCapture$OutputFileResults;-><init>(Landroid/net/Uri;)V

    return-object v0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 52
    check-cast p1, Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->apply(Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;)Landroidx/camera/core/ImageCapture$OutputFileResults;

    move-result-object p1

    return-object p1
.end method
