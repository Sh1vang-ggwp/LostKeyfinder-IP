.class Lcom/jianjin/camera/widget/FocusImageView$2;
.super Ljava/lang/Object;
.source "FocusImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jianjin/camera/widget/FocusImageView;->onFocusSuccess()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jianjin/camera/widget/FocusImageView;


# direct methods
.method constructor <init>(Lcom/jianjin/camera/widget/FocusImageView;)V
    .locals 0

    .line 88
    iput-object p1, p0, Lcom/jianjin/camera/widget/FocusImageView$2;->this$0:Lcom/jianjin/camera/widget/FocusImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 91
    iget-object v0, p0, Lcom/jianjin/camera/widget/FocusImageView$2;->this$0:Lcom/jianjin/camera/widget/FocusImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/jianjin/camera/widget/FocusImageView;->setVisibility(I)V

    return-void
.end method
