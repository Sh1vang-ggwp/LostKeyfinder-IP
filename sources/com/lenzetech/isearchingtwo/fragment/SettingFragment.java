package com.lenzetech.isearchingtwo.fragment;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.MyUserSetting;
import com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList;
import com.lenzetech.isearchingtwo.activity.SettingActivity.TimeSetting;

/* loaded from: classes.dex */
public class SettingFragment extends Fragment implements View.OnClickListener, FragmentChangedCallback {
    private static final String TAG = "SettingFragment";
    private static SettingFragment settingFragment;
    private View mContentView;
    Button recBtn;
    Switch recording_switch;
    Switch timeSwith;
    TextView timeText;
    private TextView tvVersion;
    Switch wifiSwith;

    @Override // com.lenzetech.isearchingtwo.fragment.FragmentChangedCallback
    public void onHideFc() {
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mContentView = layoutInflater.inflate(R.layout.fragment_setting, viewGroup, false);
        InitView();
        return this.mContentView;
    }

    public static SettingFragment getInstance() {
        if (settingFragment == null) {
            settingFragment = new SettingFragment();
        }
        return settingFragment;
    }

    public SettingFragment() {
        settingFragment = this;
    }

    public static String getVerName(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
            return "";
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() != R.id.recBtn) {
            return;
        }
        startActivity(new Intent(getContext(), (Class<?>) RecordList.class));
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        InitView();
    }

    public void InitView() {
        TextView textView = (TextView) this.mContentView.findViewById(R.id.tv_version);
        this.tvVersion = textView;
        textView.setText("" + getVerName(getContext()));
        this.timeText = (TextView) this.mContentView.findViewById(R.id.timeTextView);
        Switch r0 = (Switch) this.mContentView.findViewById(R.id.wifiSwifth);
        this.wifiSwith = r0;
        r0.setChecked(MyUserSetting.getInstance().getMySetting().isWifiDisTr());
        this.wifiSwith.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.lenzetech.isearchingtwo.fragment.SettingFragment.1
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                MyUserSetting.getInstance().getMySetting().setWifiDisTr(z);
                MyUserSetting.getInstance().getMySetting().save();
            }
        });
        Switch r02 = (Switch) this.mContentView.findViewById(R.id.timeSwitch);
        this.timeSwith = r02;
        r02.setChecked(MyUserSetting.getInstance().getMySetting().isTimeDisTr());
        this.timeSwith.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.lenzetech.isearchingtwo.fragment.SettingFragment.2
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                MyUserSetting.getInstance().getMySetting().setTimeDisTr(z);
                MyUserSetting.getInstance().getMySetting().save();
                if (z) {
                    SettingFragment.this.startActivityForResult(new Intent(SettingFragment.this.getContext(), (Class<?>) TimeSetting.class), 110);
                    SettingFragment.this.timeText.setText(SettingFragment.this.getTimeText());
                    return;
                }
                SettingFragment.this.timeText.setText("");
            }
        });
        Button button = (Button) this.mContentView.findViewById(R.id.recBtn);
        this.recBtn = button;
        button.setOnClickListener(this);
        if (this.timeSwith.isChecked()) {
            this.timeText.setText(getTimeText());
        }
        Switch r03 = (Switch) this.mContentView.findViewById(R.id.rec_switch);
        this.recording_switch = r03;
        r03.setChecked(MyUserSetting.getInstance().getMySetting().isDoubleClickIsRecording());
        this.recording_switch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.lenzetech.isearchingtwo.fragment.SettingFragment.3
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                MyUserSetting.getInstance().getMySetting().setDoubleClickIsRecording(z);
                MyUserSetting.getInstance().getMySetting().save();
                if (z) {
                    Log.e("双击是否录音", "双击录音");
                } else {
                    Log.e("双击是否录音", "双击不进行录音");
                }
            }
        });
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i2 == 100) {
            InitView();
        }
    }

    public String getTimeText() {
        String num = MyUserSetting.getInstance().getMySetting().getStartHour().toString();
        String num2 = MyUserSetting.getInstance().getMySetting().getStartMin().toString();
        String num3 = MyUserSetting.getInstance().getMySetting().getEndHour().toString();
        String num4 = MyUserSetting.getInstance().getMySetting().getEndMin().toString();
        if (num.length() <= 1) {
            num = "0" + num;
        }
        if (num2.length() <= 1) {
            num2 = "0" + num2;
        }
        if (num3.length() <= 1) {
            num3 = "0" + num3;
        }
        if (num4.length() <= 1) {
            num4 = "0" + num4;
        }
        return num + ":" + num2 + "-" + num3 + ":" + num4;
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        Log.d(TAG, "onResume: onResume");
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        Log.d(TAG, "onPause: onPause");
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy: onDestroy");
    }
}
