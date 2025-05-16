.class public Lcom/lenzetech/isearchingtwo/Camera/PicActivity;
.super Landroid/app/Activity;
.source "PicActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/Camera/PicActivity;->requestWindowFeature(I)Z

    .line 23
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Camera/PicActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x400

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    const p1, 0x7f0b0020

    .line 26
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/Camera/PicActivity;->setContentView(I)V

    const p1, 0x7f0800af

    .line 28
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/Camera/PicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 29
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/Camera/PicActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "imgUri"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 30
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 34
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 35
    new-instance v0, Lcom/lenzetech/isearchingtwo/Camera/PicActivity$1;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/Camera/PicActivity$1;-><init>(Lcom/lenzetech/isearchingtwo/Camera/PicActivity;)V

    const-wide/16 v1, 0x3e8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
