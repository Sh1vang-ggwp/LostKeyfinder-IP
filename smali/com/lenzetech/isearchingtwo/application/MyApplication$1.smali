.class Lcom/lenzetech/isearchingtwo/application/MyApplication$1;
.super Landroid/os/Handler;
.source "MyApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/application/MyApplication;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Landroid/os/Looper;)V
    .locals 0

    .line 127
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$1;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    return-void
.end method
