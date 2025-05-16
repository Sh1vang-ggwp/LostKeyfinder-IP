package com.lenzetech.isearchingtwo.activity.DeviceActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.RadioGroup;
import androidx.appcompat.app.AppCompatActivity;
import com.lenzetech.isearchingtwo.Bean.MyBleItem;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.MediaPlayerTools;
import com.lenzetech.isearchingtwo.application.MyApplication;

/* loaded from: classes.dex */
public class SettingRingActivity extends AppCompatActivity implements View.OnClickListener {
    Button backBtn;
    String currentBleMac;
    private MyBleItem myBleItem = null;
    RadioGroup radioGroup;

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_setting_ring);
        this.currentBleMac = getIntent().getStringExtra("mac");
        Log.e("进入蓝牙设置", "得到MAC地址" + this.currentBleMac);
        if (this.currentBleMac != null && MyApplication.getInstance().getBleItemByMac(this.currentBleMac) != null) {
            this.myBleItem = MyApplication.getInstance().getBleItemByMac(this.currentBleMac);
        }
        InitView();
    }

    private void InitView() {
        Button button = (Button) findViewById(R.id.setting_back_btn);
        this.backBtn = button;
        button.setOnClickListener(this);
        RadioGroup radioGroup = (RadioGroup) findViewById(R.id.radioGroup_sex_id);
        this.radioGroup = radioGroup;
        radioGroup.check(R.id.ring1);
        this.radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() { // from class: com.lenzetech.isearchingtwo.activity.DeviceActivity.SettingRingActivity.1
            @Override // android.widget.RadioGroup.OnCheckedChangeListener
            public void onCheckedChanged(RadioGroup radioGroup2, int i) {
                switch (i) {
                    case R.id.ring1 /* 2131230976 */:
                        MediaPlayerTools.getInstance().PlaySoundOnceByIndex(0);
                        MyApplication.getInstance().ChangeBLeItemSetting(SettingRingActivity.this.currentBleMac, null, null, 0, null);
                        break;
                    case R.id.ring2 /* 2131230977 */:
                        MediaPlayerTools.getInstance().PlaySoundOnceByIndex(1);
                        MyApplication.getInstance().ChangeBLeItemSetting(SettingRingActivity.this.currentBleMac, null, null, 1, null);
                        break;
                    case R.id.ring3 /* 2131230978 */:
                        MediaPlayerTools.getInstance().PlaySoundOnceByIndex(2);
                        MyApplication.getInstance().ChangeBLeItemSetting(SettingRingActivity.this.currentBleMac, null, null, 2, null);
                        break;
                    case R.id.ring4 /* 2131230979 */:
                        MediaPlayerTools.getInstance().PlaySoundOnceByIndex(3);
                        MyApplication.getInstance().ChangeBLeItemSetting(SettingRingActivity.this.currentBleMac, null, null, 3, null);
                        break;
                    case R.id.ring5 /* 2131230980 */:
                        MediaPlayerTools.getInstance().PlaySoundOnceByIndex(4);
                        MyApplication.getInstance().ChangeBLeItemSetting(SettingRingActivity.this.currentBleMac, null, null, 4, null);
                        break;
                    case R.id.ring6 /* 2131230981 */:
                        MediaPlayerTools.getInstance().PlaySoundOnceByIndex(5);
                        MyApplication.getInstance().ChangeBLeItemSetting(SettingRingActivity.this.currentBleMac, null, null, 5, null);
                        break;
                    case R.id.ring7 /* 2131230982 */:
                        MediaPlayerTools.getInstance().PlaySoundOnceByIndex(6);
                        MyApplication.getInstance().ChangeBLeItemSetting(SettingRingActivity.this.currentBleMac, null, null, 6, null);
                        break;
                    case R.id.ring8 /* 2131230983 */:
                        MediaPlayerTools.getInstance().PlaySoundOnceByIndex(7);
                        MyApplication.getInstance().ChangeBLeItemSetting(SettingRingActivity.this.currentBleMac, null, null, 7, null);
                        break;
                    case R.id.ring9 /* 2131230984 */:
                        MediaPlayerTools.getInstance().PlaySoundOnceByIndex(8);
                        MyApplication.getInstance().ChangeBLeItemSetting(SettingRingActivity.this.currentBleMac, null, null, 8, null);
                        break;
                }
            }
        });
        Log.e("xinxi ", this.myBleItem.getRingIndex() + "");
        switch (this.myBleItem.getRingIndex().intValue()) {
            case 0:
                this.radioGroup.check(R.id.ring1);
                break;
            case 1:
                this.radioGroup.check(R.id.ring2);
                break;
            case 2:
                this.radioGroup.check(R.id.ring3);
                break;
            case 3:
                this.radioGroup.check(R.id.ring4);
                break;
            case 4:
                this.radioGroup.check(R.id.ring5);
                break;
            case 5:
                this.radioGroup.check(R.id.ring6);
                break;
            case 6:
                this.radioGroup.check(R.id.ring7);
                break;
            case 7:
                this.radioGroup.check(R.id.ring8);
                break;
            case 8:
                this.radioGroup.check(R.id.ring9);
                break;
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() != R.id.setting_back_btn) {
            return;
        }
        MediaPlayerTools.getInstance().OnRingPageBack();
        finish();
    }
}
