.class Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$3;
.super Ljava/lang/Object;
.source "LocaitonList.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->InitList()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;)V
    .locals 0

    .line 122
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$3;->this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 126
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "onItemClick: ------"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "LocaitonList"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$3;->this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;

    iget-object p1, p1, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->listView:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->getData()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;

    .line 137
    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 138
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->getLon()Ljava/lang/Double;

    move-result-object p3

    const-string p4, "LON"

    invoke-virtual {p2, p4, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 139
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->getLat()Ljava/lang/Double;

    move-result-object p3

    const-string p4, "LAT"

    invoke-virtual {p2, p4, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 140
    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;->getGoogleaddress()Ljava/lang/String;

    move-result-object p1

    const-string p3, "AD"

    invoke-virtual {p2, p3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 142
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$3;->this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;

    const/4 p3, 0x0

    invoke-virtual {p1, p3, p2}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->setResult(ILandroid/content/Intent;)V

    .line 144
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$3;->this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->finish()V

    return-void
.end method
