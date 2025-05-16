.class Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;
.super Ljava/lang/Object;
.source "CameraFragment.java"

# interfaces
.implements Landroidx/camera/core/ImageCapture$OnImageSavedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->takePhotots()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

.field final synthetic val$file:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 185
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;->val$file:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroidx/camera/core/ImageCaptureException;)V
    .locals 1

    .line 211
    invoke-virtual {p1}, Landroidx/camera/core/ImageCaptureException;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onError"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onImageSaved(Landroidx/camera/core/ImageCapture$OutputFileResults;)V
    .locals 2

    .line 193
    :try_start_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;->val$file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1, v1}, Landroid/provider/MediaStore$Images$Media;->insertImage(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 195
    invoke-virtual {p1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 198
    :goto_0
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lenzetech/isearchingtwo/Camera/PicActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 199
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;->val$file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "imgUri"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 200
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-virtual {v0, p1}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->startActivity(Landroid/content/Intent;)V

    .line 202
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.MEDIA_SHARED"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 204
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;->val$file:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 205
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;->access$000(Lcom/lenzetech/isearchingtwo/fragment/CameraFragment;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method
