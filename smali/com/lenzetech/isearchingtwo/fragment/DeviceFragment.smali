.class public Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;
.super Landroidx/fragment/app/Fragment;
.source "DeviceFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$UpdateListReceiver;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DeviceFragment"

.field static deviceFragment:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;


# instance fields
.field btn1:Landroid/widget/Button;

.field btn2:Landroid/widget/Button;

.field dialog_new_message:Landroid/widget/TextView;

.field dialog_new_session:Landroid/widget/TextView;

.field private mContentView:Landroid/view/View;

.field private mDialog:Landroid/app/Dialog;

.field private mDialog2:Landroid/app/Dialog;

.field private mHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/content/DialogInterface;",
            ">;"
        }
    .end annotation
.end field

.field private myADP:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

.field myRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field public scanBtn:Landroid/widget/ImageView;

.field userLocationInfo:Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 68
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->mHashMap:Ljava/util/HashMap;

    const-string v0, "\u5b9e\u4f8b\u5316"

    const-string v1, "DeviceFragment"

    .line 69
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    sput-object p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->deviceFragment:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;)Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->myADP:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    return-object p0
.end method

.method public static getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;
    .locals 1

    .line 59
    sget-object v0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->deviceFragment:Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    if-eqz v0, :cond_0

    return-object v0

    .line 62
    :cond_0
    new-instance v0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;-><init>()V

    return-object v0
.end method


# virtual methods
.method InitRecycleView()V
    .locals 3

    .line 144
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->mContentView:Landroid/view/View;

    const v1, 0x7f0800d3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->myRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 145
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 146
    new-instance v0, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->myADP:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    .line 147
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->myRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public UpDateOnUIThread()V
    .locals 2

    .line 153
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/16 v1, 0x7b

    .line 154
    iput v1, v0, Landroid/os/Message;->what:I

    .line 157
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    if-nez v1, :cond_0

    return-void

    .line 161
    :cond_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    iget-object v1, v1, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 163
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    iget-object v1, v1, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method

.method public getMyADP()Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->myADP:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 118
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f080110

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 120
    :cond_0
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->startDiscovery()V

    .line 122
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->scanBtn:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f07009f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 123
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$3;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$3;-><init>(Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;)V

    const-wide/16 v1, 0x1388

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 79
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b003b

    const/4 v0, 0x0

    .line 88
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->mContentView:Landroid/view/View;

    .line 89
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->InitRecycleView()V

    .line 91
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->mContentView:Landroid/view/View;

    const p2, 0x7f080110

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->scanBtn:Landroid/widget/ImageView;

    .line 92
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f07005d

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 93
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->scanBtn:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->mContentView:Landroid/view/View;

    const p2, 0x7f0800fb

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/scwang/smartrefresh/layout/api/RefreshLayout;

    .line 97
    new-instance p2, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$1;

    invoke-direct {p2, p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$1;-><init>(Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;)V

    invoke-interface {p1, p2}, Lcom/scwang/smartrefresh/layout/api/RefreshLayout;->setOnRefreshListener(Lcom/scwang/smartrefresh/layout/listener/OnRefreshListener;)Lcom/scwang/smartrefresh/layout/api/RefreshLayout;

    .line 104
    new-instance p2, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$2;

    invoke-direct {p2, p0}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment$2;-><init>(Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;)V

    invoke-interface {p1, p2}, Lcom/scwang/smartrefresh/layout/api/RefreshLayout;->setOnLoadMoreListener(Lcom/scwang/smartrefresh/layout/listener/OnLoadMoreListener;)Lcom/scwang/smartrefresh/layout/api/RefreshLayout;

    .line 112
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->mContentView:Landroid/view/View;

    return-object p1
.end method

.method public onEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V
    .locals 0

    return-void
.end method
