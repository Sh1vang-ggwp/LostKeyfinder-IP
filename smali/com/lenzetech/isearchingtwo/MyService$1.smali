.class Lcom/lenzetech/isearchingtwo/MyService$1;
.super Ljava/lang/Object;
.source "MyService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/MyService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/MyService;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/MyService;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/MyService$1;->this$0:Lcom/lenzetech/isearchingtwo/MyService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const-string v0, "\u8fd0\u884c"

    .line 37
    invoke-static {v0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->UPDATERssi()V

    .line 41
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/MyService$1;->this$0:Lcom/lenzetech/isearchingtwo/MyService;

    iget-object v0, v0, Lcom/lenzetech/isearchingtwo/MyService;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0xbb8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
