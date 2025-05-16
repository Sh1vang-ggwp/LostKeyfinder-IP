.class public Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "LinearViewHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public batteryImage:Landroid/widget/ImageView;

.field public button:Landroid/widget/TextView;

.field private connBtn:Landroid/widget/TextView;

.field public headImageView:Landroid/widget/ImageView;

.field public id:I

.field public itemRelativlayout:Landroid/widget/LinearLayout;

.field locatioitemAdapter:Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;

.field public macAddress:Ljava/lang/String;

.field public myAdapter:Lcom/lenzetech/isearchingtwo/Adapter/LinearAdapter;

.field private nameText:Landroid/widget/TextView;

.field public nickName:Ljava/lang/String;

.field public progressDialog:Landroid/app/ProgressDialog;

.field private relativeLayout:Landroid/widget/LinearLayout;

.field public rssiImage:Landroid/widget/ImageView;

.field private settingBtn:Landroid/widget/TextView;

.field private textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 4

    .line 56
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const-string v0, ""

    .line 35
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->nickName:Ljava/lang/String;

    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->headImageView:Landroid/widget/ImageView;

    .line 53
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->progressDialog:Landroid/app/ProgressDialog;

    const v0, 0x7f08004e

    .line 57
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->relativeLayout:Landroid/widget/LinearLayout;

    const v1, 0x7f080054

    .line 60
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->button:Landroid/widget/TextView;

    .line 61
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f0800d1

    .line 63
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->textView:Landroid/widget/TextView;

    const v1, 0x7f08004f

    .line 65
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->settingBtn:Landroid/widget/TextView;

    .line 66
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f08004d

    .line 68
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->connBtn:Landroid/widget/TextView;

    .line 69
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->connBtn:Landroid/widget/TextView;

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v2

    iget v3, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->id:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getBleItemByid(Ljava/lang/Integer;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBtnShowText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f0800d5

    .line 72
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->nameText:Landroid/widget/TextView;

    const v1, 0x7f08004b

    .line 74
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->batteryImage:Landroid/widget/ImageView;

    const v1, 0x7f080090

    .line 76
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->headImageView:Landroid/widget/ImageView;

    const v1, 0x7f08010b

    .line 78
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->rssiImage:Landroid/widget/ImageView;

    .line 81
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemRelativlayout:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public SetBatteryIcon(IZ)V
    .locals 1

    if-nez p2, :cond_0

    .line 144
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->batteryImage:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070068

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 147
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "\u8bbe\u5907\u4fe1\u53f7\u5f3a\u5ea6"

    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p2, 0x50

    if-le p1, p2, :cond_1

    .line 149
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->batteryImage:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070067

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_1
    const/16 p2, 0x3c

    if-le p1, p2, :cond_2

    .line 151
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->batteryImage:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070066

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_2
    const/16 p2, 0x28

    if-le p1, p2, :cond_3

    .line 153
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->batteryImage:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070065

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_3
    const/16 p2, 0x14

    if-le p1, p2, :cond_4

    .line 155
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->batteryImage:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070064

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 157
    :cond_4
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->batteryImage:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070063

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void
.end method

.method public SetConnBtnText(Ljava/lang/String;)V
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->connBtn:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public SetHeadImg([B)V
    .locals 2

    if-eqz p1, :cond_0

    .line 113
    array-length v0, p1

    if-lez v0, :cond_0

    const/4 v0, 0x0

    .line 115
    invoke-static {p1, v0}, Lcom/lenzetech/isearchingtwo/Utils/ImageDispose;->getPicFromBytes([BLandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 116
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->headImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 118
    :cond_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->headImageView:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700a8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void
.end method

.method public SetIsArlarUI(Z)V
    .locals 2

    if-eqz p1, :cond_0

    .line 89
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemRelativlayout:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050085

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    goto :goto_0

    .line 91
    :cond_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemRelativlayout:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050020

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    :goto_0
    return-void
.end method

.method public SetLableName(Ljava/lang/String;)V
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public SetNickName(Ljava/lang/String;)V
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->nameText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public SetRssi(Ljava/lang/Integer;)V
    .locals 2

    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u8bbe\u5907\u4fe1\u53f7\u5f3a\u5ea6"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, -0x32

    if-le v0, v1, :cond_0

    .line 127
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->rssiImage:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700d0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 128
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, -0x3c

    if-le v0, v1, :cond_1

    .line 129
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->rssiImage:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700cf

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 130
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, -0x46

    if-le v0, v1, :cond_2

    .line 131
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->rssiImage:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700ce

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 132
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/16 v0, -0x50

    if-le p1, v0, :cond_3

    .line 133
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->rssiImage:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700cd

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 164
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f08004d

    const-string v1, ""

    if-eq p1, v0, :cond_2

    const v0, 0x7f08004f

    if-eq p1, v0, :cond_1

    const v0, 0x7f080054

    if-eq p1, v0, :cond_0

    goto/16 :goto_1

    :cond_0
    const-string p1, "\u5220\u9664\u8bbe\u5907"

    const-string v0, "delete"

    .line 190
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->macAddress:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->deleteItemByMac(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 186
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->id:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u8bbe\u7f6e\u6309\u94ae"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->macAddress:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->OnItemSettingClick(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 166
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->id:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u8fde\u63a5\u6309\u94ae"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->connBtn:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0f0026

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eq p1, v0, :cond_5

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->connBtn:Landroid/widget/TextView;

    .line 170
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0f0098

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-ne p1, v0, :cond_3

    goto :goto_0

    .line 179
    :cond_3
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->connBtn:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0f0027

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-ne p1, v0, :cond_4

    .line 180
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->macAddress:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->AlarmByAddress(Ljava/lang/String;)V

    goto :goto_1

    .line 181
    :cond_4
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->connBtn:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0f0023

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-ne p1, v0, :cond_6

    .line 182
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->macAddress:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->CancleAlarmByAddress(Ljava/lang/String;)V

    goto :goto_1

    .line 172
    :cond_5
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u8fde\u63a5\u5230\u8bbe\u5907"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->id:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u84dd\u7259"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->id:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ConnectBleByIndexORMac(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 175
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/LinearViewHolder;->id:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0f003b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->setBtnTextById(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 177
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/ProgressDialogUtil;->showProgressDialog(Landroid/content/Context;)V

    .line 178
    invoke-static {}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->getInstance()Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/fragment/DeviceFragment;->UpDateOnUIThread()V

    :cond_6
    :goto_1
    return-void
.end method
