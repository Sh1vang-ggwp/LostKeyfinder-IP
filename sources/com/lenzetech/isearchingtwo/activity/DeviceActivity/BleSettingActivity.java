package com.lenzetech.isearchingtwo.activity.DeviceActivity;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.Switch;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.FileProvider;
import com.google.android.material.textfield.TextInputEditText;
import com.lenzetech.isearchingtwo.Bean.MyBleItem;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.ImageDispose;
import com.lenzetech.isearchingtwo.activity.util.RomUtil;
import com.lenzetech.isearchingtwo.application.MyApplication;
import com.lenzetech.isearchingtwo.dialogevent.DialogEvent;
import com.lenzetech.isearchingtwo.dialogevent.EventCallback;
import com.lenzetech.isearchingtwo.permission.BlePermissionHelper;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

/* loaded from: classes.dex */
public class BleSettingActivity extends AppCompatActivity implements View.OnClickListener, EventCallback {
    Button backButton;
    private BlePermissionHelper blePermissionHelper;
    Switch disconnSwitch;
    ImageView imageButton;
    private Uri imageUri;
    private Uri mCutUri;
    TextInputEditText nameTextInputEditText;
    ImageView ringButton;
    private String currentBleMac = null;
    private MyBleItem myBleItem = null;

    @Override // com.lenzetech.isearchingtwo.dialogevent.EventCallback
    public void onEvent(DialogEvent dialogEvent) {
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_ble_setting);
        this.currentBleMac = getIntent().getStringExtra("mac");
        Log.e("进入蓝牙设置", "得到MAC地址" + this.currentBleMac);
        this.blePermissionHelper = new BlePermissionHelper((Activity) this);
        if (Build.VERSION.SDK_INT < 29 && !this.blePermissionHelper.isPermission("android.permission.WRITE_EXTERNAL_STORAGE")) {
            ActivityCompat.requestPermissions(this, new String[]{"android.permission.WRITE_EXTERNAL_STORAGE", "android.permission.READ_EXTERNAL_STORAGE"}, 5);
        }
        if (this.currentBleMac != null) {
            this.myBleItem = MyApplication.getInstance().getBleItemByMac(this.currentBleMac);
            InitView();
        }
    }

    public void InitView() {
        ImageView imageView = (ImageView) findViewById(R.id.imageBtn);
        this.imageButton = imageView;
        imageView.setOnClickListener(this);
        if (this.myBleItem.getImageByte() == null || this.myBleItem.getImageByte().length <= 0) {
            Log.e("进入蓝牙设置", "用户图片信息为空,不做处理");
        } else {
            Log.e("进入蓝牙设置", "得到用户自定义的图片");
            ImageDispose.getPicFromBytes(this.myBleItem.getImageByte(), null);
            this.imageButton.setImageBitmap(BitmapFactory.decodeByteArray(this.myBleItem.getImageByte(), 0, this.myBleItem.getImageByte().length));
        }
        TextInputEditText textInputEditText = (TextInputEditText) findViewById(R.id.name_input_text);
        this.nameTextInputEditText = textInputEditText;
        textInputEditText.setText(this.myBleItem.getBleNickName());
        this.nameTextInputEditText.addTextChangedListener(new TextWatcher() { // from class: com.lenzetech.isearchingtwo.activity.DeviceActivity.BleSettingActivity.1
            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                MyApplication.getInstance().ChangeBLeItemSetting(BleSettingActivity.this.currentBleMac, charSequence.toString(), null, null, null);
            }
        });
        Switch r0 = (Switch) findViewById(R.id.disconnisalalrm);
        this.disconnSwitch = r0;
        r0.setChecked(this.myBleItem.isAlarmOnDisconnect());
        this.disconnSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.lenzetech.isearchingtwo.activity.DeviceActivity.BleSettingActivity.2
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                MyApplication.getInstance().SetDeviceISAlarm(BleSettingActivity.this.currentBleMac, z);
                MyApplication.getInstance().ChangeBLeItemSetting(BleSettingActivity.this.currentBleMac, null, Boolean.valueOf(z), null, null);
            }
        });
        Button button = (Button) findViewById(R.id.setting_back_btn);
        this.backButton = button;
        button.setOnClickListener(this);
        ImageView imageView2 = (ImageView) findViewById(R.id.toringSetting);
        this.ringButton = imageView2;
        imageView2.setOnClickListener(this);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.imageBtn) {
            Log.e("设置图片", "开启Intent");
            startSetImage();
        } else if (id == R.id.setting_back_btn) {
            Log.e("设置页面", "返回");
            finish();
        } else {
            if (id != R.id.toringSetting) {
                return;
            }
            Log.e("开始设置铃声", "开始设置铃声");
            Intent intent = new Intent(getApplicationContext(), (Class<?>) SettingRingActivity.class);
            intent.putExtra("mac", this.currentBleMac);
            startActivity(intent);
        }
    }

    public void startSetImage() {
        File file = new File(getExternalCacheDir(), "output_image.jpg");
        try {
            if (file.exists()) {
                file.delete();
            }
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (Build.VERSION.SDK_INT >= 24) {
            this.imageUri = FileProvider.getUriForFile(this, "com.lenze.kindelf.fileprovider", file);
        } else {
            this.imageUri = Uri.fromFile(file);
        }
        Intent intent = new Intent("android.media.action.IMAGE_CAPTURE");
        intent.addFlags(64);
        intent.putExtra("output", this.imageUri);
        startActivityForResult(intent, 1232);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        Bitmap adjustPhotoRotation;
        Bitmap centerSquareScaleBitmap;
        Log.e("得到信息", "得到信息1");
        super.onActivityResult(i, i2, intent);
        Log.e("得到图片", "2开启Intent");
        if (i == 1232 && i2 == -1) {
            Log.e("得到图片", "开启Intent");
            cropPhoto(this.imageUri, true);
            return;
        }
        if (i == 1100) {
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(getContentResolver().openInputStream(this.mCutUri));
                Log.e("", ImageDispose.Bitmap2Bytes(decodeStream).length + "");
                if (RomUtil.isEmui()) {
                    Log.e("机型测试", "华为手机");
                    adjustPhotoRotation = ImageDispose.adjustPhotoRotation(decodeStream, 0);
                } else {
                    adjustPhotoRotation = ImageDispose.adjustPhotoRotation(decodeStream, 90);
                }
                if (adjustPhotoRotation == null || (centerSquareScaleBitmap = ImageDispose.centerSquareScaleBitmap(adjustPhotoRotation, 300)) == null) {
                    return;
                }
                this.imageButton.setImageBitmap(centerSquareScaleBitmap);
                MyApplication.getInstance().ChangeBLeItemSetting(this.currentBleMac, null, null, null, ImageDispose.Bitmap2Bytes(centerSquareScaleBitmap));
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }
    }

    private void cropPhoto(Uri uri, boolean z) {
        Intent intent = new Intent("com.android.camera.action.CROP");
        intent.setDataAndType(uri, "image/*");
        intent.putExtra("scale", true);
        intent.putExtra("aspectX", 1);
        intent.putExtra("aspectY", 1);
        intent.putExtra("outputX", 100);
        intent.putExtra("outputY", 100);
        intent.putExtra("noFaceDetection", true);
        intent.putExtra("outputFormat", Bitmap.CompressFormat.JPEG.toString());
        intent.putExtra("return-data", false);
        if (z) {
            this.mCutUri = uri;
        }
        intent.putExtra("output", this.mCutUri);
        Intent intent2 = new Intent("android.intent.action.MEDIA_SCANNER_SCAN_FILE");
        intent2.setData(uri);
        sendBroadcast(intent2);
        startActivityForResult(intent, 1100);
    }
}
