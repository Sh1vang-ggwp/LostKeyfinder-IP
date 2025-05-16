package com.jzxiang.pickerview.config;

import com.jzxiang.pickerview.data.Type;
import com.jzxiang.pickerview.data.WheelCalendar;
import com.jzxiang.pickerview.listener.OnDateSetListener;

/* loaded from: classes.dex */
public class PickerConfig {
    public OnDateSetListener mCallBack;
    public Type mType = DefaultConfig.TYPE;
    public int mThemeColor = DefaultConfig.COLOR;
    public String mCancelString = DefaultConfig.CANCEL;
    public String mSureString = DefaultConfig.SURE;
    public String mTitleString = DefaultConfig.TITLE;
    public int mToolBarTVColor = -1;
    public int mWheelTVNormalColor = DefaultConfig.TV_NORMAL_COLOR;
    public int mWheelTVSelectorColor = DefaultConfig.TV_SELECTOR_COLOR;
    public int mWheelTVSize = 12;
    public boolean cyclic = true;
    public String mYear = DefaultConfig.YEAR;
    public String mMonth = DefaultConfig.MONTH;
    public String mDay = DefaultConfig.DAY;
    public String mHour = DefaultConfig.HOUR;
    public String mMinute = DefaultConfig.MINUTE;
    public WheelCalendar mMinCalendar = new WheelCalendar(0);
    public WheelCalendar mMaxCalendar = new WheelCalendar(0);
    public WheelCalendar mCurrentCalendar = new WheelCalendar(System.currentTimeMillis());
}
