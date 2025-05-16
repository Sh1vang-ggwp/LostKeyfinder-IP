package com.jzxiang.pickerview.data.source;

import com.jzxiang.pickerview.config.PickerConfig;
import com.jzxiang.pickerview.data.WheelCalendar;
import com.jzxiang.pickerview.utils.PickerContants;
import com.jzxiang.pickerview.utils.Utils;
import java.util.Calendar;

/* loaded from: classes.dex */
public class TimeRepository implements TimeDataSource {
    WheelCalendar mCalendarMax;
    WheelCalendar mCalendarMin;
    boolean mIsMaxNoRange;
    boolean mIsMinNoRange;
    PickerConfig mPickerConfig;

    public TimeRepository(PickerConfig pickerConfig) {
        this.mPickerConfig = pickerConfig;
        this.mCalendarMin = pickerConfig.mMinCalendar;
        this.mCalendarMax = pickerConfig.mMaxCalendar;
        this.mIsMinNoRange = this.mCalendarMin.isNoRange();
        this.mIsMaxNoRange = this.mCalendarMax.isNoRange();
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMinYear() {
        return this.mIsMinNoRange ? PickerContants.DEFAULT_MIN_YEAR : this.mCalendarMin.year;
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMaxYear() {
        if (this.mIsMaxNoRange) {
            return getMinYear() + 50;
        }
        return this.mCalendarMax.year;
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMinMonth(int i) {
        if (this.mIsMinNoRange || !Utils.isTimeEquals(this.mCalendarMin, i)) {
            return 1;
        }
        return this.mCalendarMin.month;
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMaxMonth(int i) {
        if (this.mIsMaxNoRange || !Utils.isTimeEquals(this.mCalendarMax, i)) {
            return 12;
        }
        return this.mCalendarMax.month;
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMinDay(int i, int i2) {
        if (this.mIsMinNoRange || !Utils.isTimeEquals(this.mCalendarMin, i, i2)) {
            return 1;
        }
        return this.mCalendarMin.day;
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMaxDay(int i, int i2) {
        if (!this.mIsMaxNoRange && Utils.isTimeEquals(this.mCalendarMax, i, i2)) {
            return this.mCalendarMax.day;
        }
        Calendar calendar = Calendar.getInstance();
        calendar.set(1, i);
        calendar.set(5, 1);
        calendar.set(2, i2 - 1);
        return calendar.getActualMaximum(5);
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMinHour(int i, int i2, int i3) {
        if (this.mIsMinNoRange || !Utils.isTimeEquals(this.mCalendarMin, i, i2, i3)) {
            return 0;
        }
        return this.mCalendarMin.hour;
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMaxHour(int i, int i2, int i3) {
        if (this.mIsMaxNoRange || !Utils.isTimeEquals(this.mCalendarMax, i, i2, i3)) {
            return 23;
        }
        return this.mCalendarMax.hour;
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMinMinute(int i, int i2, int i3, int i4) {
        if (this.mIsMinNoRange || !Utils.isTimeEquals(this.mCalendarMin, i, i2, i3, i4)) {
            return 0;
        }
        return this.mCalendarMin.minute + 1;
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public int getMaxMinute(int i, int i2, int i3, int i4) {
        if (this.mIsMaxNoRange || !Utils.isTimeEquals(this.mCalendarMax, i, i2, i3, i4)) {
            return 59;
        }
        return this.mCalendarMax.minute;
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public boolean isMinYear(int i) {
        return Utils.isTimeEquals(this.mCalendarMin, i);
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public boolean isMinMonth(int i, int i2) {
        return Utils.isTimeEquals(this.mCalendarMin, i, i2);
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public boolean isMinDay(int i, int i2, int i3) {
        return Utils.isTimeEquals(this.mCalendarMin, i, i2, i3);
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public boolean isMinHour(int i, int i2, int i3, int i4) {
        return Utils.isTimeEquals(this.mCalendarMin, i, i2, i3, i4);
    }

    @Override // com.jzxiang.pickerview.data.source.TimeDataSource
    public WheelCalendar getDefaultCalendar() {
        return this.mPickerConfig.mCurrentCalendar;
    }
}
