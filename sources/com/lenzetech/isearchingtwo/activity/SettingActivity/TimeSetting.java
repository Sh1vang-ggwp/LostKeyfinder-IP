package com.lenzetech.isearchingtwo.activity.SettingActivity;

import android.app.TimePickerDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.TimePicker;
import androidx.appcompat.app.AppCompatActivity;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.MyUserSetting;
import com.lenzetech.isearchingtwo.fragment.SettingFragment;

/* loaded from: classes.dex */
public class TimeSetting extends AppCompatActivity implements View.OnClickListener, TimePickerDialog.OnTimeSetListener {
    Button backBtn;
    Button endBtn;
    Integer resultId = -1;
    Button startBtn;
    TextView textViewEnd;
    TextView textViewStart;

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_time_setting);
        InitView();
    }

    private void InitView() {
        this.startBtn = (Button) findViewById(R.id.startBtn);
        this.endBtn = (Button) findViewById(R.id.endBtn);
        this.startBtn.setOnClickListener(this);
        this.endBtn.setOnClickListener(this);
        this.textViewStart = (TextView) findViewById(R.id.startTinmeLable);
        this.textViewEnd = (TextView) findViewById(R.id.endTimeLable);
        Button button = (Button) findViewById(R.id.setting_back_btn);
        this.backBtn = button;
        button.setOnClickListener(this);
        UpdateLables();
    }

    private void UpdateLables() {
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
        this.textViewStart.setText(getString(R.string.startTime) + "    :" + num + ":" + num2);
        this.textViewEnd.setText(getString(R.string.endTime) + "    :" + num3 + ":" + num4);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        Integer startHour = MyUserSetting.getInstance().getMySetting().getStartHour();
        Integer startMin = MyUserSetting.getInstance().getMySetting().getStartMin();
        Integer endHour = MyUserSetting.getInstance().getMySetting().getEndHour();
        Integer endMin = MyUserSetting.getInstance().getMySetting().getEndMin();
        int id = view.getId();
        if (id == R.id.endBtn) {
            this.resultId = 1;
            new TimePickerDialog(this, this, endHour.intValue(), endMin.intValue(), true).show();
        } else if (id == R.id.setting_back_btn) {
            finish();
        } else {
            if (id != R.id.startBtn) {
                return;
            }
            this.resultId = 0;
            new TimePickerDialog(this, this, startHour.intValue(), startMin.intValue(), true).show();
        }
    }

    @Override // android.app.TimePickerDialog.OnTimeSetListener
    public void onTimeSet(TimePicker timePicker, int i, int i2) {
        if (this.resultId.intValue() < 0) {
            return;
        }
        if (this.resultId.intValue() == 0) {
            MyUserSetting.getInstance().getMySetting().setStartHour(Integer.valueOf(i));
            MyUserSetting.getInstance().getMySetting().setStartMin(Integer.valueOf(i2));
        } else if (this.resultId.intValue() == 1) {
            MyUserSetting.getInstance().getMySetting().setEndHour(Integer.valueOf(i));
            MyUserSetting.getInstance().getMySetting().setEndMin(Integer.valueOf(i2));
        }
        UpdateLables();
        SettingFragment.getInstance().InitView();
    }
}
