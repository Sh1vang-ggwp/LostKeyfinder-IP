.class public Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "BleSettingActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/lenzetech/isearchingtwo/dialogevent/EventCallback;


# instance fields
.field backButton:Landroid/widget/Button;

.field private blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

.field private currentBleMac:Ljava/lang/String;

.field disconnSwitch:Landroid/widget/Switch;

.field imageButton:Landroid/widget/ImageView;

.field private imageUri:Landroid/net/Uri;

.field private mCutUri:Landroid/net/Uri;

.field private myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

.field nameTextInputEditText:Lcom/google/android/material/textfield/TextInputEditText;

.field ringButton:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 44
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->currentBleMac:Ljava/lang/String;

    .line 48
    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    return-void
.end method

.method static synthetic access$000(Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;)Ljava/lang/String;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->currentBleMac:Ljava/lang/String;

    return-object p0
.end method

.method private cropPhoto(Landroid/net/Uri;Z)V
    .locals 4

    .line 279
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.camera.action.CROP"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "image/*"

    .line 280
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "scale"

    const/4 v2, 0x1

    .line 281
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "aspectX"

    .line 284
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "aspectY"

    .line 285
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "outputX"

    const/16 v3, 0x64

    .line 288
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "outputY"

    .line 289
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "noFaceDetection"

    .line 292
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 294
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v1}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "outputFormat"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "return-data"

    const/4 v2, 0x0

    .line 297
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-eqz p2, :cond_0

    .line 302
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->mCutUri:Landroid/net/Uri;

    .line 307
    :cond_0
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->mCutUri:Landroid/net/Uri;

    const-string v1, "output"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 309
    new-instance p2, Landroid/content/Intent;

    const-string v1, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-direct {p2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 310
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 311
    invoke-virtual {p0, p2}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->sendBroadcast(Landroid/content/Intent;)V

    const/16 p1, 0x44c

    .line 313
    invoke-virtual {p0, v0, p1}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method


# virtual methods
.method public InitView()V
    .locals 4

    const v0, 0x7f0800ad

    .line 84
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->imageButton:Landroid/widget/ImageView;

    .line 85
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v0

    const-string v1, "\u8fdb\u5165\u84dd\u7259\u8bbe\u7f6e"

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v0

    array-length v0, v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "\u5f97\u5230\u7528\u6237\u81ea\u5b9a\u4e49\u7684\u56fe\u7247"

    .line 91
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lenzetech/isearchingtwo/Utils/ImageDispose;->getPicFromBytes([BLandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 94
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->imageButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v3}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getImageByte()[B

    move-result-object v3

    array-length v3, v3

    invoke-static {v1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1

    :cond_1
    :goto_0
    const-string v0, "\u7528\u6237\u56fe\u7247\u4fe1\u606f\u4e3a\u7a7a,\u4e0d\u505a\u5904\u7406"

    .line 88
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    const v0, 0x7f0800d6

    .line 99
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->nameTextInputEditText:Lcom/google/android/material/textfield/TextInputEditText;

    .line 100
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->getBleNickName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 103
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->nameTextInputEditText:Lcom/google/android/material/textfield/TextInputEditText;

    new-instance v1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$1;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$1;-><init>(Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const v0, 0x7f080084

    .line 122
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->disconnSwitch:Landroid/widget/Switch;

    .line 123
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    invoke-virtual {v1}, Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;->isAlarmOnDisconnect()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 124
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->disconnSwitch:Landroid/widget/Switch;

    new-instance v1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$2;

    invoke-direct {v1, p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity$2;-><init>(Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    const v0, 0x7f080127

    .line 142
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->backButton:Landroid/widget/Button;

    .line 143
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f080165

    .line 147
    invoke-virtual {p0, v0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->ringButton:Landroid/widget/ImageView;

    .line 148
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    const-string v0, ""

    const-string v1, "\u5f97\u5230\u4fe1\u606f"

    const-string v2, "\u5f97\u5230\u4fe1\u606f1"

    .line 231
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    const-string p3, "\u5f97\u5230\u56fe\u7247"

    const-string v1, "2\u5f00\u542fIntent"

    .line 234
    invoke-static {p3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v1, 0x4d0

    if-ne p1, v1, :cond_0

    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    const-string p1, "\u5f00\u542fIntent"

    .line 236
    invoke-static {p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->imageUri:Landroid/net/Uri;

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->cropPhoto(Landroid/net/Uri;Z)V

    goto :goto_1

    :cond_0
    const/16 p2, 0x44c

    if-ne p1, p2, :cond_2

    .line 244
    :try_start_0
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->mCutUri:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 246
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/ImageDispose;->Bitmap2Bytes(Landroid/graphics/Bitmap;)[B

    move-result-object p3

    array-length p3, p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    invoke-static {}, Lcom/lenzetech/isearchingtwo/activity/util/RomUtil;->isEmui()Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p2, "\u673a\u578b\u6d4b\u8bd5"

    const-string p3, "\u534e\u4e3a\u624b\u673a"

    .line 250
    invoke-static {p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p2, 0x0

    .line 251
    invoke-static {p1, p2}, Lcom/lenzetech/isearchingtwo/Utils/ImageDispose;->adjustPhotoRotation(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/16 p2, 0x5a

    .line 253
    invoke-static {p1, p2}, Lcom/lenzetech/isearchingtwo/Utils/ImageDispose;->adjustPhotoRotation(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_2

    const/16 p2, 0x12c

    .line 258
    invoke-static {p1, p2}, Lcom/lenzetech/isearchingtwo/Utils/ImageDispose;->centerSquareScaleBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 261
    iget-object p2, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->imageButton:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 262
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object v0

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->currentBleMac:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p1}, Lcom/lenzetech/isearchingtwo/Utils/ImageDispose;->Bitmap2Bytes(Landroid/graphics/Bitmap;)[B

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->ChangeBLeItemSetting(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;[B)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 269
    invoke-virtual {p1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    :cond_2
    :goto_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 156
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0800ad

    if-eq p1, v0, :cond_2

    const v0, 0x7f080127

    if-eq p1, v0, :cond_1

    const v0, 0x7f080165

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "\u5f00\u59cb\u8bbe\u7f6e\u94c3\u58f0"

    .line 166
    invoke-static {p1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/SettingRingActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 170
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->currentBleMac:Ljava/lang/String;

    const-string v1, "mac"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 172
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    const-string p1, "\u8bbe\u7f6e\u9875\u9762"

    const-string v0, "\u8fd4\u56de"

    .line 162
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->finish()V

    goto :goto_0

    :cond_2
    const-string p1, "\u8bbe\u7f6e\u56fe\u7247"

    const-string v0, "\u5f00\u542fIntent"

    .line 158
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->startSetImage()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 53
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001c

    .line 54
    invoke-virtual {p0, p1}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->setContentView(I)V

    .line 56
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "mac"

    .line 57
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->currentBleMac:Ljava/lang/String;

    .line 58
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u5f97\u5230MAC\u5730\u5740"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->currentBleMac:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u8fdb\u5165\u84dd\u7259\u8bbe\u7f6e"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    new-instance p1, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-direct {p1, p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    .line 60
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1d

    if-ge p1, v0, :cond_0

    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->isPermission(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 61
    filled-new-array {v0, p1}, [Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x5

    invoke-static {p0, p1, v0}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 64
    :cond_0
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->currentBleMac:Ljava/lang/String;

    if-eqz p1, :cond_1

    .line 65
    invoke-static {}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getInstance()Lcom/lenzetech/isearchingtwo/application/MyApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->currentBleMac:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lenzetech/isearchingtwo/application/MyApplication;->getBleItemByMac(Ljava/lang/String;)Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    move-result-object p1

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->myBleItem:Lcom/lenzetech/isearchingtwo/Bean/MyBleItem;

    .line 66
    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->InitView()V

    :cond_1
    return-void
.end method

.method public onEvent(Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;)V
    .locals 0

    return-void
.end method

.method public startSetImage()V
    .locals 3

    .line 183
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "output_image.jpg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 186
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 189
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 191
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 195
    :goto_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_1

    const-string v1, "com.lenze.kindelf.fileprovider"

    .line 196
    invoke-static {p0, v1, v0}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->imageUri:Landroid/net/Uri;

    goto :goto_1

    .line 198
    :cond_1
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->imageUri:Landroid/net/Uri;

    .line 203
    :goto_1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x40

    .line 206
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 209
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->imageUri:Landroid/net/Uri;

    const-string v2, "output"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/16 v1, 0x4d0

    .line 222
    invoke-virtual {p0, v0, v1}, Lcom/lenzetech/isearchingtwo/activity/DeviceActivity/BleSettingActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
