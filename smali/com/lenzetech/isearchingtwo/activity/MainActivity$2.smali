.class Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lenzetech/isearchingtwo/activity/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/activity/MainActivity;)V
    .locals 0

    .line 124
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNavigationItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    .line 129
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const/4 v0, 0x0

    const-string v1, "\u5e95\u90e8"

    const/4 v2, 0x1

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    return v0

    :pswitch_1
    const-string p1, "5"

    .line 158
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Normal:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    sput-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyClickMode;->nowMode:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    .line 160
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    const/4 v0, 0x4

    invoke-static {p1, v0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->access$000(Lcom/lenzetech/isearchingtwo/activity/MainActivity;I)V

    return v2

    :pswitch_2
    const-string p1, "4"

    .line 152
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Normal:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    sput-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyClickMode;->nowMode:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    .line 154
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    const/4 v0, 0x3

    invoke-static {p1, v0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->access$000(Lcom/lenzetech/isearchingtwo/activity/MainActivity;I)V

    return v2

    :pswitch_3
    const-string p1, "3"

    .line 147
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Normal:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    sput-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyClickMode;->nowMode:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    .line 149
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    const/4 v0, 0x2

    invoke-static {p1, v0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->access$000(Lcom/lenzetech/isearchingtwo/activity/MainActivity;I)V

    return v2

    :pswitch_4
    const-string p1, "1"

    .line 133
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Normal:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    sput-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyClickMode;->nowMode:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    .line 135
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    invoke-static {p1, v0}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->access$000(Lcom/lenzetech/isearchingtwo/activity/MainActivity;I)V

    .line 137
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->UPDATERssi()V

    return v2

    .line 141
    :pswitch_5
    sget-object p1, Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;->Photo:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    sput-object p1, Lcom/lenzetech/isearchingtwo/Utils/MyClickMode;->nowMode:Lcom/lenzetech/isearchingtwo/Utils/ClickMODE;

    const-string p1, "2"

    .line 142
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    invoke-static {p1, v2}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->access$000(Lcom/lenzetech/isearchingtwo/activity/MainActivity;I)V

    .line 144
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/MainActivity$2;->this$0:Lcom/lenzetech/isearchingtwo/activity/MainActivity;

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/activity/MainActivity;->access$100(Lcom/lenzetech/isearchingtwo/activity/MainActivity;)V

    return v2

    :pswitch_data_0
    .packed-switch 0x7f0800d8
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
