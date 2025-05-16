.class Lcom/jzxiang/pickerview/wheel/WheelView$1;
.super Ljava/lang/Object;
.source "WheelView.java"

# interfaces
.implements Lcom/jzxiang/pickerview/wheel/WheelScroller$ScrollingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jzxiang/pickerview/wheel/WheelView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jzxiang/pickerview/wheel/WheelView;


# direct methods
.method constructor <init>(Lcom/jzxiang/pickerview/wheel/WheelView;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 112
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$000(Lcom/jzxiang/pickerview/wheel/WheelView;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->notifyScrollingListenersAboutEnd()V

    .line 114
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$002(Lcom/jzxiang/pickerview/wheel/WheelView;Z)Z

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$202(Lcom/jzxiang/pickerview/wheel/WheelView;I)I

    .line 118
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->invalidate()V

    return-void
.end method

.method public onJustify()V
    .locals 3

    .line 122
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$200(Lcom/jzxiang/pickerview/wheel/WheelView;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 123
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$300(Lcom/jzxiang/pickerview/wheel/WheelView;)Lcom/jzxiang/pickerview/wheel/WheelScroller;

    move-result-object v0

    iget-object v1, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$200(Lcom/jzxiang/pickerview/wheel/WheelView;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->scroll(II)V

    :cond_0
    return-void
.end method

.method public onScroll(I)V
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$100(Lcom/jzxiang/pickerview/wheel/WheelView;I)V

    .line 101
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->getHeight()I

    move-result p1

    .line 102
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$200(Lcom/jzxiang/pickerview/wheel/WheelView;)I

    move-result v0

    if-le v0, p1, :cond_0

    .line 103
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$202(Lcom/jzxiang/pickerview/wheel/WheelView;I)I

    .line 104
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$300(Lcom/jzxiang/pickerview/wheel/WheelView;)Lcom/jzxiang/pickerview/wheel/WheelScroller;

    move-result-object p1

    invoke-virtual {p1}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->stopScrolling()V

    goto :goto_0

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$200(Lcom/jzxiang/pickerview/wheel/WheelView;)I

    move-result v0

    neg-int p1, p1

    if-ge v0, p1, :cond_1

    .line 106
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {v0, p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$202(Lcom/jzxiang/pickerview/wheel/WheelView;I)I

    .line 107
    iget-object p1, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-static {p1}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$300(Lcom/jzxiang/pickerview/wheel/WheelView;)Lcom/jzxiang/pickerview/wheel/WheelScroller;

    move-result-object p1

    invoke-virtual {p1}, Lcom/jzxiang/pickerview/wheel/WheelScroller;->stopScrolling()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onStarted()V
    .locals 2

    .line 94
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/jzxiang/pickerview/wheel/WheelView;->access$002(Lcom/jzxiang/pickerview/wheel/WheelView;Z)Z

    .line 95
    iget-object v0, p0, Lcom/jzxiang/pickerview/wheel/WheelView$1;->this$0:Lcom/jzxiang/pickerview/wheel/WheelView;

    invoke-virtual {v0}, Lcom/jzxiang/pickerview/wheel/WheelView;->notifyScrollingListenersAboutStart()V

    return-void
.end method
