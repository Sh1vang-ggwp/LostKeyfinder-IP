.class Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$2;
.super Ljava/lang/Object;
.source "DeviceFragment.java"

# interfaces
.implements Lcom/scwang/smartrefresh/layout/listener/OnLoadMoreListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;)V
    .locals 0

    .line 104
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$2;->this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadMore(Lcom/scwang/smartrefresh/layout/api/RefreshLayout;)V
    .locals 1

    const/16 v0, 0x7d0

    .line 107
    invoke-interface {p1, v0}, Lcom/scwang/smartrefresh/layout/api/RefreshLayout;->finishLoadMore(I)Lcom/scwang/smartrefresh/layout/api/RefreshLayout;

    return-void
.end method
