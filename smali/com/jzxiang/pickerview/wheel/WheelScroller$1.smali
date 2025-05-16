.class Lcom/jzxiang/pickerview/wheel/WheelScroller$1;
.super Landroid/os/Handler;
.source "WheelScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jzxiang/pickerview/wheel/WheelScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;


# direct methods
.method constructor <init>(Lcom/jzxiang/pickerview/wheel/WheelScroller;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 31
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$000(Lcom/jzxiang/pickerview/wheel/WheelScroller;)Landroid/widget/Scroller;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 32
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$000(Lcom/jzxiang/pickerview/wheel/WheelScroller;)Landroid/widget/Scroller;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    .line 33
    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v1}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$100(Lcom/jzxiang/pickerview/wheel/WheelScroller;)I

    move-result v1

    sub-int/2addr v1, v0

    .line 34
    iget-object v2, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v2, v0}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$102(Lcom/jzxiang/pickerview/wheel/WheelScroller;I)I

    if-eqz v1, :cond_0

    .line 36
    iget-object v2, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v2}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$200(Lcom/jzxiang/pickerview/wheel/WheelScroller;)Lcom/jzxiang/pickerview/wheel/WheelScroller$ScrollingListener;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/jzxiang/pickerview/wheel/WheelScroller$ScrollingListener;->onScroll(I)V

    .line 41
    :cond_0
    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v1}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$000(Lcom/jzxiang/pickerview/wheel/WheelScroller;)Landroid/widget/Scroller;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalY()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_1

    .line 42
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$000(Lcom/jzxiang/pickerview/wheel/WheelScroller;)Landroid/widget/Scroller;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalY()I

    .line 43
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$000(Lcom/jzxiang/pickerview/wheel/WheelScroller;)Landroid/widget/Scroller;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$000(Lcom/jzxiang/pickerview/wheel/WheelScroller;)Landroid/widget/Scroller;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_2

    .line 46
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$300(Lcom/jzxiang/pickerview/wheel/WheelScroller;)Landroid/os/Handler;

    move-result-object v0

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 47
    :cond_2
    iget p1, p1, Landroid/os/Message;->what:I

    if-nez p1, :cond_3

    .line 48
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-static {p1}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->access$400(Lcom/jzxiang/pickerview/wheel/WheelScroller;)V

    goto :goto_0

    .line 50
    :cond_3
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelScroller$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelScroller;

    invoke-virtual {p1}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->finishScrolling()V

    :goto_0
    return-void
.end method
