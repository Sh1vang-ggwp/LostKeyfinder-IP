package com.jzxiang.pickerview;

import android.content.Context;
import android.view.View;
import com.jzxiang.pickerview.adapters.NumericWheelAdapter;
import com.jzxiang.pickerview.config.PickerConfig;
import com.jzxiang.pickerview.data.Type;
import com.jzxiang.pickerview.data.source.TimeRepository;
import com.jzxiang.pickerview.utils.PickerContants;
import com.jzxiang.pickerview.utils.Utils;
import com.jzxiang.pickerview.wheel.OnWheelChangedListener;
import com.jzxiang.pickerview.wheel.WheelView;
import java.util.Calendar;

/* loaded from: classes.dex */
public class TimeWheel {
    WheelView day;
    WheelView hour;
    Context mContext;
    NumericWheelAdapter mDayAdapter;
    NumericWheelAdapter mHourAdapter;
    NumericWheelAdapter mMinuteAdapter;
    NumericWheelAdapter mMonthAdapter;
    PickerConfig mPickerConfig;
    TimeRepository mRepository;
    NumericWheelAdapter mYearAdapter;
    WheelView minute;
    WheelView month;
    WheelView year;
    OnWheelChangedListener yearListener = new OnWheelChangedListener() { // from class: com.jzxiang.pickerview.TimeWheel.1
        @Override // com.jzxiang.pickerview.wheel.OnWheelChangedListener
        public void onChanged(WheelView wheelView, int i, int i2) {
            TimeWheel.this.updateMonths();
        }
    };
    OnWheelChangedListener monthListener = new OnWheelChangedListener() { // from class: com.jzxiang.pickerview.TimeWheel.2
        @Override // com.jzxiang.pickerview.wheel.OnWheelChangedListener
        public void onChanged(WheelView wheelView, int i, int i2) {
            TimeWheel.this.updateDays();
        }
    };
    OnWheelChangedListener dayListener = new OnWheelChangedListener() { // from class: com.jzxiang.pickerview.TimeWheel.3
        @Override // com.jzxiang.pickerview.wheel.OnWheelChangedListener
        public void onChanged(WheelView wheelView, int i, int i2) {
            TimeWheel.this.updateHours();
        }
    };
    OnWheelChangedListener minuteListener = new OnWheelChangedListener() { // from class: com.jzxiang.pickerview.TimeWheel.4
        @Override // com.jzxiang.pickerview.wheel.OnWheelChangedListener
        public void onChanged(WheelView wheelView, int i, int i2) {
            TimeWheel.this.updateMinutes();
        }
    };

    public TimeWheel(View view, PickerConfig pickerConfig) {
        this.mPickerConfig = pickerConfig;
        this.mRepository = new TimeRepository(pickerConfig);
        this.mContext = view.getContext();
        initialize(view);
    }

    public void initialize(View view) {
        initView(view);
        initYear();
        initMonth();
        initDay();
        initHour();
        initMinute();
    }

    void initView(View view) {
        this.year = (WheelView) view.findViewById(R.id.year);
        this.month = (WheelView) view.findViewById(R.id.month);
        this.day = (WheelView) view.findViewById(R.id.day);
        this.hour = (WheelView) view.findViewById(R.id.hour);
        this.minute = (WheelView) view.findViewById(R.id.minute);
        int i = AnonymousClass5.$SwitchMap$com$jzxiang$pickerview$data$Type[this.mPickerConfig.mType.ordinal()];
        if (i == 2) {
            Utils.hideViews(this.hour, this.minute);
        } else if (i == 3) {
            Utils.hideViews(this.day, this.hour, this.minute);
        } else if (i == 4) {
            Utils.hideViews(this.year);
        } else if (i == 5) {
            Utils.hideViews(this.year, this.month, this.day);
        } else if (i == 6) {
            Utils.hideViews(this.month, this.day, this.hour, this.minute);
        }
        this.year.addChangingListener(this.yearListener);
        this.year.addChangingListener(this.monthListener);
        this.year.addChangingListener(this.dayListener);
        this.year.addChangingListener(this.minuteListener);
        this.month.addChangingListener(this.monthListener);
        this.month.addChangingListener(this.dayListener);
        this.month.addChangingListener(this.minuteListener);
        this.day.addChangingListener(this.dayListener);
        this.day.addChangingListener(this.minuteListener);
        this.hour.addChangingListener(this.minuteListener);
    }

    /* renamed from: com.jzxiang.pickerview.TimeWheel$5, reason: invalid class name */
    static /* synthetic */ class AnonymousClass5 {
        static final /* synthetic */ int[] $SwitchMap$com$jzxiang$pickerview$data$Type;

        static {
            int[] iArr = new int[Type.values().length];
            $SwitchMap$com$jzxiang$pickerview$data$Type = iArr;
            try {
                iArr[Type.ALL.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$jzxiang$pickerview$data$Type[Type.YEAR_MONTH_DAY.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$jzxiang$pickerview$data$Type[Type.YEAR_MONTH.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$jzxiang$pickerview$data$Type[Type.MONTH_DAY_HOUR_MIN.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$jzxiang$pickerview$data$Type[Type.HOURS_MINS.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$jzxiang$pickerview$data$Type[Type.YEAR.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
        }
    }

    void initYear() {
        int minYear = this.mRepository.getMinYear();
        NumericWheelAdapter numericWheelAdapter = new NumericWheelAdapter(this.mContext, minYear, this.mRepository.getMaxYear(), PickerContants.FORMAT, this.mPickerConfig.mYear);
        this.mYearAdapter = numericWheelAdapter;
        numericWheelAdapter.setConfig(this.mPickerConfig);
        this.year.setViewAdapter(this.mYearAdapter);
        this.year.setCurrentItem(this.mRepository.getDefaultCalendar().year - minYear);
    }

    void initMonth() {
        updateMonths();
        this.month.setCurrentItem(this.mRepository.getDefaultCalendar().month - this.mRepository.getMinMonth(getCurrentYear()));
        this.month.setCyclic(this.mPickerConfig.cyclic);
    }

    void initDay() {
        updateDays();
        this.day.setCurrentItem(this.mRepository.getDefaultCalendar().day - this.mRepository.getMinDay(getCurrentYear(), getCurrentMonth()));
        this.day.setCyclic(this.mPickerConfig.cyclic);
    }

    void initHour() {
        updateHours();
        this.hour.setCurrentItem(this.mRepository.getDefaultCalendar().hour - this.mRepository.getMinHour(getCurrentYear(), getCurrentMonth(), getCurrentDay()));
        this.hour.setCyclic(this.mPickerConfig.cyclic);
    }

    void initMinute() {
        updateMinutes();
        this.minute.setCurrentItem(this.mRepository.getDefaultCalendar().minute - this.mRepository.getMinMinute(getCurrentYear(), getCurrentMonth(), getCurrentDay(), getCurrentHour()));
        this.minute.setCyclic(this.mPickerConfig.cyclic);
    }

    void updateMonths() {
        if (this.month.getVisibility() == 8) {
            return;
        }
        int currentYear = getCurrentYear();
        NumericWheelAdapter numericWheelAdapter = new NumericWheelAdapter(this.mContext, this.mRepository.getMinMonth(currentYear), this.mRepository.getMaxMonth(currentYear), PickerContants.FORMAT, this.mPickerConfig.mMonth);
        this.mMonthAdapter = numericWheelAdapter;
        numericWheelAdapter.setConfig(this.mPickerConfig);
        this.month.setViewAdapter(this.mMonthAdapter);
        if (this.mRepository.isMinYear(currentYear)) {
            this.month.setCurrentItem(0, false);
        }
    }

    void updateDays() {
        if (this.day.getVisibility() == 8) {
            return;
        }
        int currentYear = getCurrentYear();
        int currentMonth = getCurrentMonth();
        Calendar calendar = Calendar.getInstance();
        calendar.set(1, calendar.get(1) + this.year.getCurrentItem());
        calendar.set(2, currentMonth);
        int maxDay = this.mRepository.getMaxDay(currentYear, currentMonth);
        NumericWheelAdapter numericWheelAdapter = new NumericWheelAdapter(this.mContext, this.mRepository.getMinDay(currentYear, currentMonth), maxDay, PickerContants.FORMAT, this.mPickerConfig.mDay);
        this.mDayAdapter = numericWheelAdapter;
        numericWheelAdapter.setConfig(this.mPickerConfig);
        this.day.setViewAdapter(this.mDayAdapter);
        if (this.mRepository.isMinMonth(currentYear, currentMonth)) {
            this.day.setCurrentItem(0, true);
        }
        int itemsCount = this.mDayAdapter.getItemsCount();
        if (this.day.getCurrentItem() >= itemsCount) {
            this.day.setCurrentItem(itemsCount - 1, true);
        }
    }

    void updateHours() {
        if (this.hour.getVisibility() == 8) {
            return;
        }
        int currentYear = getCurrentYear();
        int currentMonth = getCurrentMonth();
        int currentDay = getCurrentDay();
        NumericWheelAdapter numericWheelAdapter = new NumericWheelAdapter(this.mContext, this.mRepository.getMinHour(currentYear, currentMonth, currentDay), this.mRepository.getMaxHour(currentYear, currentMonth, currentDay), PickerContants.FORMAT, this.mPickerConfig.mHour);
        this.mHourAdapter = numericWheelAdapter;
        numericWheelAdapter.setConfig(this.mPickerConfig);
        this.hour.setViewAdapter(this.mHourAdapter);
        if (this.mRepository.isMinDay(currentYear, currentMonth, currentDay)) {
            this.hour.setCurrentItem(0, false);
        }
    }

    void updateMinutes() {
        if (this.minute.getVisibility() == 8) {
            return;
        }
        int currentYear = getCurrentYear();
        int currentMonth = getCurrentMonth();
        int currentDay = getCurrentDay();
        int currentHour = getCurrentHour();
        NumericWheelAdapter numericWheelAdapter = new NumericWheelAdapter(this.mContext, this.mRepository.getMinMinute(currentYear, currentMonth, currentDay, currentHour), this.mRepository.getMaxMinute(currentYear, currentMonth, currentDay, currentHour), PickerContants.FORMAT, this.mPickerConfig.mMinute);
        this.mMinuteAdapter = numericWheelAdapter;
        numericWheelAdapter.setConfig(this.mPickerConfig);
        this.minute.setViewAdapter(this.mMinuteAdapter);
        if (this.mRepository.isMinHour(currentYear, currentMonth, currentDay, currentHour)) {
            this.minute.setCurrentItem(0, false);
        }
    }

    public int getCurrentYear() {
        return this.year.getCurrentItem() + this.mRepository.getMinYear();
    }

    public int getCurrentMonth() {
        return this.month.getCurrentItem() + this.mRepository.getMinMonth(getCurrentYear());
    }

    public int getCurrentDay() {
        return this.day.getCurrentItem() + this.mRepository.getMinDay(getCurrentYear(), getCurrentMonth());
    }

    public int getCurrentHour() {
        return this.hour.getCurrentItem() + this.mRepository.getMinHour(getCurrentYear(), getCurrentMonth(), getCurrentDay());
    }

    public int getCurrentMinute() {
        return this.minute.getCurrentItem() + this.mRepository.getMinMinute(getCurrentYear(), getCurrentMonth(), getCurrentDay(), getCurrentHour());
    }
}
