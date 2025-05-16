package com.jzxiang.pickerview.data;

import java.util.Calendar;

/* loaded from: classes.dex */
public class WheelCalendar {
    public int day;
    public int hour;
    public int minute;
    public int month;
    private boolean noRange;
    public int year;

    public WheelCalendar(long j) {
        initData(j);
    }

    private void initData(long j) {
        if (j == 0) {
            this.noRange = true;
            return;
        }
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.setTimeInMillis(j);
        this.year = calendar.get(1);
        this.month = calendar.get(2) + 1;
        this.day = calendar.get(5);
        this.hour = calendar.get(11);
        this.minute = calendar.get(12);
    }

    public boolean isNoRange() {
        return this.noRange;
    }
}
