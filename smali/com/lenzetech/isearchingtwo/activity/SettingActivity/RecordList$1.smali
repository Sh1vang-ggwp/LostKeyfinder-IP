.class Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$1;
.super Ljava/lang/Object;
.source "RecordList.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->onFDQCLick()V
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

    .line 74
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 78
    invoke-static {}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getInstance()Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->onClickEnd()V

    .line 80
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->access$000(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)V

    return-void
.end method
