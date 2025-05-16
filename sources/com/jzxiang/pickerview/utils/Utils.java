package com.jzxiang.pickerview.utils;

import android.view.View;
import com.jzxiang.pickerview.data.WheelCalendar;

/* loaded from: classes.dex */
public class Utils {
    public static boolean isTimeEquals(WheelCalendar wheelCalendar, int... iArr) {
        int length = iArr.length;
        return length != 1 ? length != 2 ? length != 3 ? length == 4 && wheelCalendar.year == iArr[0] && wheelCalendar.month == iArr[1] && wheelCalendar.day == iArr[2] && wheelCalendar.hour == iArr[3] : wheelCalendar.year == iArr[0] && wheelCalendar.month == iArr[1] && wheelCalendar.day == iArr[2] : wheelCalendar.year == iArr[0] && wheelCalendar.month == iArr[1] : wheelCalendar.year == iArr[0];
    }

    public static void hideViews(View... viewArr) {
        for (View view : viewArr) {
            view.setVisibility(8);
        }
    }
}
