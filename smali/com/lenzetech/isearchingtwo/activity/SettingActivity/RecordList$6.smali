.class Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$6;
.super Ljava/lang/Object;
.source "RecordList.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


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

    .line 222
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$6;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 226
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList$6;->this$0:Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;->access$300(Lcom/lenzetech/isearchingtwo/activity/SettingActivity/RecordList;)Landroid/media/MediaPlayer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    return-void
.end method
