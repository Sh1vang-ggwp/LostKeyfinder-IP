.class Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$1;
.super Ljava/lang/Object;
.source "DeviceFragment.java"

# interfaces
.implements Lcom/scwang/smartrefresh/layout/listener/OnRefreshListener;


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

    .line 97
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$1;->this$0:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefresh(Lcom/scwang/smartrefresh/layout/api/RefreshLayout;)V
    .locals 2

    .line 100
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->startDiscovery()V

    const/16 v0, 0x1388

    const/4 v1, 0x1

    .line 101
    invoke-interface {p1, v0, v1}, Lcom/scwang/smartrefresh/layout/api/RefreshLayout;->finishRefresh(IZ)Lcom/scwang/smartrefresh/layout/api/RefreshLayout;

    return-void
.end method
