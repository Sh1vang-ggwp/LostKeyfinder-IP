.class public abstract Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;
.super Lcom/jzxiang/pickerview/adapters/AbstractWheelAdapter;
.source "AbstractWheelTextAdapter.java"


# static fields
.field public static final DEFAULT_TEXT_SIZE:I = 0x18

.field public static final LABEL_COLOR:I = -0x8fff90

.field protected static final NO_RESOURCE:I = 0x0

.field public static final TEXT_VIEW_ITEM_RESOURCE:I = -0x1


# instance fields
.field protected context:Landroid/content/Context;

.field protected emptyItemResourceId:I

.field protected inflater:Landroid/view/LayoutInflater;

.field protected itemResourceId:I

.field protected itemTextResourceId:I

.field private mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

.field private padding:I


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, -0x1

    .line 71
    invoke-direct {p0, p1, v0}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 1

    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, p1, p2, v0}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;-><init>(Landroid/content/Context;II)V

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;II)V
    .locals 1

    .line 91
    invoke-direct {p0}, Lcom/jzxiang/pickerview/adapters/AbstractWheelAdapter;-><init>()V

    const/4 v0, 0x0

    .line 61
    iput v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->padding:I

    .line 92
    iput-object p1, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->context:Landroid/content/Context;

    .line 93
    iput p2, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->itemResourceId:I

    .line 94
    iput p3, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->itemTextResourceId:I

    .line 95
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Lcom/jzxiang/pickerview/R$dimen;->textview_default_padding:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->padding:I

    const-string p2, "layout_inflater"

    .line 97
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    iput-object p1, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->inflater:Landroid/view/LayoutInflater;

    return-void
.end method

.method private getTextView(Landroid/view/View;I)Landroid/widget/TextView;
    .locals 1

    if-nez p2, :cond_0

    .line 225
    :try_start_0
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 226
    check-cast p1, Landroid/widget/TextView;

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 228
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :goto_0
    const-string p2, "AbstractWheelAdapter"

    const-string v0, "You must supply a resource ID for a TextView"

    .line 231
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "AbstractWheelAdapter requires the resource ID to be a TextView"

    invoke-direct {p2, v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method private getView(ILandroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    const/4 v0, -0x1

    if-eq p1, v0, :cond_1

    if-eqz p1, :cond_0

    .line 252
    iget-object v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->inflater:Landroid/view/LayoutInflater;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1

    .line 250
    :cond_1
    new-instance p1, Landroid/widget/TextView;

    iget-object p2, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->context:Landroid/content/Context;

    invoke-direct {p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method


# virtual methods
.method protected configureTextView(Landroid/widget/TextView;)V
    .locals 2

    .line 204
    iget-object v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    if-nez v0, :cond_0

    .line 205
    new-instance v0, Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-direct {v0}, Lcom/jzxiang/pickerview/config/PickerConfig;-><init>()V

    iput-object v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    .line 206
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget v0, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVNormalColor:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v0, 0x11

    .line 208
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 209
    iget v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->padding:I

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0, v1, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 210
    iget-object v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    iget v0, v0, Lcom/jzxiang/pickerview/config/PickerConfig;->mWheelTVSize:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v0, 0x1

    .line 211
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLines(I)V

    return-void
.end method

.method public getConfig()Lcom/jzxiang/pickerview/config/PickerConfig;
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    if-nez v0, :cond_0

    .line 259
    new-instance v0, Lcom/jzxiang/pickerview/config/PickerConfig;

    invoke-direct {v0}, Lcom/jzxiang/pickerview/config/PickerConfig;-><init>()V

    iput-object v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    return-object v0
.end method

.method public getEmptyItem(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    if-nez p1, :cond_0

    .line 188
    iget p1, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->emptyItemResourceId:I

    invoke-direct {p0, p1, p2}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->getView(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 190
    :cond_0
    iget p2, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->emptyItemResourceId:I

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_1

    .line 191
    move-object p2, p1

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p0, p2}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->configureTextView(Landroid/widget/TextView;)V

    :cond_1
    return-object p1
.end method

.method public getEmptyItemResource()I
    .locals 1

    .line 142
    iget v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->emptyItemResourceId:I

    return v0
.end method

.method public getItem(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    if-ltz p1, :cond_3

    .line 165
    invoke-virtual {p0}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->getItemsCount()I

    move-result v0

    if-ge p1, v0, :cond_3

    if-nez p2, :cond_0

    .line 167
    iget p2, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->itemResourceId:I

    invoke-direct {p0, p2, p3}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->getView(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 169
    :cond_0
    iget p3, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->itemTextResourceId:I

    invoke-direct {p0, p2, p3}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->getTextView(Landroid/view/View;I)Landroid/widget/TextView;

    move-result-object p3

    if-eqz p3, :cond_2

    .line 171
    invoke-virtual {p0, p1}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->getItemText(I)Ljava/lang/CharSequence;

    move-result-object p1

    if-nez p1, :cond_1

    const-string p1, ""

    .line 175
    :cond_1
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    iget p1, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->itemResourceId:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    .line 177
    invoke-virtual {p0, p3}, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->configureTextView(Landroid/widget/TextView;)V

    :cond_2
    return-object p2

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemResource()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->itemResourceId:I

    return v0
.end method

.method protected abstract getItemText(I)Ljava/lang/CharSequence;
.end method

.method public getItemTextResource()I
    .locals 1

    .line 124
    iget v0, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->itemTextResourceId:I

    return v0
.end method

.method public setConfig(Lcom/jzxiang/pickerview/config/PickerConfig;)V
    .locals 0

    .line 265
    iput-object p1, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->mPickerConfig:Lcom/jzxiang/pickerview/config/PickerConfig;

    return-void
.end method

.method public setEmptyItemResource(I)V
    .locals 0

    .line 151
    iput p1, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->emptyItemResourceId:I

    return-void
.end method

.method public setItemResource(I)V
    .locals 0

    .line 115
    iput p1, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->itemResourceId:I

    return-void
.end method

.method public setItemTextResource(I)V
    .locals 0

    .line 133
    iput p1, p0, Lcom/jzxiang/pickerview/adapters/AbstractWheelTextAdapter;->itemTextResourceId:I

    return-void
.end method
