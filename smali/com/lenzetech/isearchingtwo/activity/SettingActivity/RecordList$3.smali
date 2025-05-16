.class Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$3;
.super Ljava/lang/Object;
.source "RecordList.java"

# interfaces
.implements Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->InitList()V
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

    .line 155
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$3;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Lcom/lenzetech/isearchingtwo/Bean/RecItem;I)V
    .locals 1

    .line 159
    :try_start_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$3;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->access$100(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Bean/RecItem;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->getFileIte()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->access$200(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;Ljava/lang/String;)V

    .line 162
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$3;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    iget-object p1, p1, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {p1, p2}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->setPlay(I)V

    .line 163
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$3;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    iget-object p1, p1, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->listView:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->notifyDataSetChanged()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 166
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method
