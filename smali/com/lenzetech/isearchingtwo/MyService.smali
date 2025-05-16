.class public Lcom/lenzetech/isearchingtwo/MyService;
.super Landroid/app/Service;
.source "MyService.java"


# instance fields
.field mHandler:Landroid/os/Handler;

.field r:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 20
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/MyService;->mHandler:Landroid/os/Handler;

    .line 32
    new-instance v0, Lcom/lenzetech/isearchingtwo/MyService$1;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/MyService$1;-><init>(Lcom/lenzetech/isearchingtwo/MyService;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/MyService;->r:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    .line 18
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Not yet implemented"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onCreate()V
    .locals 4

    .line 23
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 24
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/MyService;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/MyService;->r:Ljava/lang/Runnable;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const-string v0, "\u8fd0\u884c1"

    .line 25
    invoke-static {v0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
