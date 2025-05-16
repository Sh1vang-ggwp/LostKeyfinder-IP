package com.jzxiang.pickerview;

import android.app.Dialog;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.TextView;
import androidx.fragment.app.DialogFragment;
import com.jzxiang.pickerview.config.PickerConfig;
import com.jzxiang.pickerview.data.Type;
import com.jzxiang.pickerview.data.WheelCalendar;
import com.jzxiang.pickerview.listener.OnDateSetListener;
import java.util.Calendar;

/* loaded from: classes.dex */
public class TimePickerDialog extends DialogFragment implements View.OnClickListener {
    private long mCurrentMillSeconds;
    PickerConfig mPickerConfig;
    private TimeWheel mTimeWheel;

    /* JADX INFO: Access modifiers changed from: private */
    public static TimePickerDialog newIntance(PickerConfig pickerConfig) {
        TimePickerDialog timePickerDialog = new TimePickerDialog();
        timePickerDialog.initialize(pickerConfig);
        return timePickerDialog;
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getActivity().getWindow().setSoftInputMode(3);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.picker_height);
        Window window = getDialog().getWindow();
        window.setLayout(-1, dimensionPixelSize);
        window.setGravity(80);
    }

    private void initialize(PickerConfig pickerConfig) {
        this.mPickerConfig = pickerConfig;
    }

    @Override // androidx.fragment.app.DialogFragment
    public Dialog onCreateDialog(Bundle bundle) {
        Dialog dialog = new Dialog(getActivity(), R.style.Dialog_NoTitle);
        dialog.requestWindowFeature(1);
        dialog.setCancelable(true);
        dialog.setCanceledOnTouchOutside(true);
        dialog.setContentView(initView());
        return dialog;
    }

    View initView() {
        View inflate = LayoutInflater.from(getContext()).inflate(R.layout.timepicker_layout, (ViewGroup) null);
        TextView textView = (TextView) inflate.findViewById(R.id.tv_cancel);
        textView.setOnClickListener(this);
        TextView textView2 = (TextView) inflate.findViewById(R.id.tv_sure);
        textView2.setOnClickListener(this);
        TextView textView3 = (TextView) inflate.findViewById(R.id.tv_title);
        View findViewById = inflate.findViewById(R.id.toolbar);
        textView3.setText(this.mPickerConfig.mTitleString);
        textView.setText(this.mPickerConfig.mCancelString);
        textView2.setText(this.mPickerConfig.mSureString);
        findViewById.setBackgroundColor(this.mPickerConfig.mThemeColor);
        this.mTimeWheel = new TimeWheel(inflate, this.mPickerConfig);
        return inflate;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.tv_cancel) {
            dismiss();
        } else if (id == R.id.tv_sure) {
            sureClicked();
        }
    }

    public long getCurrentMillSeconds() {
        long j = this.mCurrentMillSeconds;
        return j == 0 ? System.currentTimeMillis() : j;
    }

    void sureClicked() {
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(1, this.mTimeWheel.getCurrentYear());
        calendar.set(2, this.mTimeWheel.getCurrentMonth() - 1);
        calendar.set(5, this.mTimeWheel.getCurrentDay());
        calendar.set(11, this.mTimeWheel.getCurrentHour());
        calendar.set(12, this.mTimeWheel.getCurrentMinute());
        this.mCurrentMillSeconds = calendar.getTimeInMillis();
        if (this.mPickerConfig.mCallBack != null) {
            this.mPickerConfig.mCallBack.onDateSet(this, this.mCurrentMillSeconds);
        }
        dismiss();
    }

    public static class Builder {
        PickerConfig mPickerConfig = new PickerConfig();

        public Builder setType(Type type) {
            this.mPickerConfig.mType = type;
            return this;
        }

        public Builder setThemeColor(int i) {
            this.mPickerConfig.mThemeColor = i;
            return this;
        }

        public Builder setCancelStringId(String str) {
            this.mPickerConfig.mCancelString = str;
            return this;
        }

        public Builder setSureStringId(String str) {
            this.mPickerConfig.mSureString = str;
            return this;
        }

        public Builder setTitleStringId(String str) {
            this.mPickerConfig.mTitleString = str;
            return this;
        }

        public Builder setToolBarTextColor(int i) {
            this.mPickerConfig.mToolBarTVColor = i;
            return this;
        }

        public Builder setWheelItemTextNormalColor(int i) {
            this.mPickerConfig.mWheelTVNormalColor = i;
            return this;
        }

        public Builder setWheelItemTextSelectorColor(int i) {
            this.mPickerConfig.mWheelTVSelectorColor = i;
            return this;
        }

        public Builder setWheelItemTextSize(int i) {
            this.mPickerConfig.mWheelTVSize = i;
            return this;
        }

        public Builder setCyclic(boolean z) {
            this.mPickerConfig.cyclic = z;
            return this;
        }

        public Builder setMinMillseconds(long j) {
            this.mPickerConfig.mMinCalendar = new WheelCalendar(j);
            return this;
        }

        public Builder setMaxMillseconds(long j) {
            this.mPickerConfig.mMaxCalendar = new WheelCalendar(j);
            return this;
        }

        public Builder setCurrentMillseconds(long j) {
            this.mPickerConfig.mCurrentCalendar = new WheelCalendar(j);
            return this;
        }

        public Builder setYearText(String str) {
            this.mPickerConfig.mYear = str;
            return this;
        }

        public Builder setMonthText(String str) {
            this.mPickerConfig.mMonth = str;
            return this;
        }

        public Builder setDayText(String str) {
            this.mPickerConfig.mDay = str;
            return this;
        }

        public Builder setHourText(String str) {
            this.mPickerConfig.mHour = str;
            return this;
        }

        public Builder setMinuteText(String str) {
            this.mPickerConfig.mMinute = str;
            return this;
        }

        public Builder setCallBack(OnDateSetListener onDateSetListener) {
            this.mPickerConfig.mCallBack = onDateSetListener;
            return this;
        }

        public TimePickerDialog build() {
            return TimePickerDialog.newIntance(this.mPickerConfig);
        }
    }
}
