.class Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$2;
.super Ljava/lang/Object;
.source "BleSettingActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->InitView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;)V
    .locals 0

    .line 124
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 7

    .line 130
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->access$000(Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->SetDeviceISAlarm(Ljava/lang/String;Z)V

    .line 132
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v1

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->access$000(Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    return-void
.end method
