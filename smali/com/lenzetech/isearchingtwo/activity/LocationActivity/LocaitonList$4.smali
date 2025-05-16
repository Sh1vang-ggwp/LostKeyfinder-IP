.class Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$4;
.super Ljava/lang/Object;
.source "LocaitonList.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->updateListGeocode(Lcom/lenzetech/isearchingtwo/Bean/UserLocationInfo;Ljava/lang/String;)V
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

    .line 192
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$4;->this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList$4;->this$0:Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;

    iget-object v0, v0, Lcom/lenzetech/isearchingtwo/activity/LocationActivity/LocaitonList;->listView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Adapter/LocatioitemAdapter;->notifyDataSetChanged()V

    return-void
.end method
