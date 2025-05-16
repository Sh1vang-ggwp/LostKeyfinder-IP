.class Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$5;
.super Ljava/lang/Object;
.source "RecordList.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->startplayMusic(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)V
    .locals 0

    .line 210
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$5;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 0

    .line 213
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$5;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    iget-object p1, p1, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->setAllUnplay()V

    .line 214
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$5;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    iget-object p1, p1, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->notifyDataSetChanged()V

    const/4 p1, 0x0

    return p1
.end method
