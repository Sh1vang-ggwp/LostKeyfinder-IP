.class Lcom/jzxiang/pickerview/TimeWheel$3;
.super Ljava/lang/Object;
.source "TimeWheel.java"

# interfaces
.implements Lcom/jzxiang/pickerview/wheel/OnWheelChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jzxiang/pickerview/TimeWheel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jzxiang/pickerview/TimeWheel;


# direct methods
.method constructor <init>(Lcom/jzxiang/pickerview/TimeWheel;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel$3;->this$0:Lcom/jzxiang/pickerview/TimeWheel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged(Lcom/jzxiang/pickerview/wheel/WheelView;II)V
    .locals 0

    .line 42
    iget-object p1, p0, Lcom/jzxiang/pickerview/TimeWheel$3;->this$0:Lcom/jzxiang/pickerview/TimeWheel;

    invoke-virtual {p1}, Lcom/jzxiang/pickerview/TimeWheel;->updateHours()V

    return-void
.end method
