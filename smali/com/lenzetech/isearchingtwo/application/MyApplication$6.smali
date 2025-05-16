.class Lcom/lenzetech/isearchingtwo/application/MyApplication$6;
.super Ljava/lang/Object;
.source "MyApplication.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/application/MyApplication;->sendDialogEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

.field final synthetic val$event:Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/application/MyApplication;Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1202
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$6;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$6;->val$event:Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1205
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$6;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$500(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1206
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$6;->this$0:Lcom/lenzetech/isearchingtwo/application/MyApplication;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->access$500(Lcom/lenzetech/isearchingtwo/application/MyApplication;)Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/application/MyApplication$6;->val$event:Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;

    invoke-interface {v0, v1}, Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;->onEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V

    :cond_0
    return-void
.end method
