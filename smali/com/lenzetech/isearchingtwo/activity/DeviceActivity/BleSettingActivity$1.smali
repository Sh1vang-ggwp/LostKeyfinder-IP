.class Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$1;
.super Ljava/lang/Object;
.source "BleSettingActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


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

    .line 103
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 6

    .line 111
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;

    invoke-static {p2}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->access$000(Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V

    return-void
.end method
