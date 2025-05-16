.class public Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "LinearAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field static linearAdapter:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mLayoutInflater:Landroid/view/LayoutInflater;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->mContext:Landroid/content/Context;

    .line 22
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 24
    sput-object p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->linearAdapter:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;
    .locals 1

    .line 30
    sget-object v0, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->linearAdapter:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->linearAdapter:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    .line 34
    :cond_0
    sget-object p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->linearAdapter:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

    return-object p0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 99
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    iget-object v0, v0, Lcom/lenzetech/isearchingtwo/application/MyApplication;->bleItemHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 15
    check-cast p1, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->onBindViewHolder(Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;I)V
    .locals 3

    .line 47
    iget-object v0, p1, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    .line 48
    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 49
    iput p2, p1, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->id:I

    .line 52
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getBleItemByid(Ljava/lang/Integer;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    move-result-object p2

    .line 54
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBtnShowText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetConnBtnText(Ljava/lang/String;)V

    .line 55
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getAddresss()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetLableName(Ljava/lang/String;)V

    .line 56
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getAddresss()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->macAddress:Ljava/lang/String;

    .line 58
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBleNickName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetNickName(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBleNickName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Tag-It"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "iTAG"

    .line 61
    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetNickName(Ljava/lang/String;)V

    goto :goto_0

    .line 63
    :cond_0
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBleNickName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetNickName(Ljava/lang/String;)V

    .line 67
    :goto_0
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarming()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 69
    invoke-virtual {p1, v1}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetIsArlarUI(Z)V

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 73
    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetIsArlarUI(Z)V

    .line 79
    :goto_1
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v0

    if-eqz v0, :cond_2

    .line 80
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetHeadImg([B)V

    goto :goto_2

    .line 84
    :cond_2
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetHeadImg([B)V

    .line 89
    :goto_2
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getRssi()Ljava/lang/Integer;

    move-result-object v0

    .line 90
    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetRssi(Ljava/lang/Integer;)V

    .line 91
    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBattery()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getHasBattery()Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, v1, p2}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->SetBatteryIcon(IZ)V

    .line 93
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "\u4fe1\u53f7\u53d8\u5316222"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;
    .locals 3

    .line 42
    new-instance p2, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f0b0041

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method
