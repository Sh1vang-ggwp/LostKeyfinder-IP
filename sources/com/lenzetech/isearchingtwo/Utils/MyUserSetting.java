package com.lenzetech.isearchingtwo.Utils;

import android.util.Log;
import com.lenzetech.isearchingtwo.Bean.MySetting;
import com.lenzetech.isearchingtwo.application.MyApplication;
import java.util.Calendar;
import java.util.List;
import org.litepal.LitePal;

/* loaded from: classes.dex */
public class MyUserSetting {
    private static MyUserSetting myUserSetting;
    private MySetting mySetting = null;

    public static MyUserSetting getInstance() {
        if (myUserSetting == null) {
            myUserSetting = new MyUserSetting();
        }
        return myUserSetting;
    }

    public void InitUserSetting() {
        List findAll = LitePal.findAll(MySetting.class, new long[0]);
        if (findAll.size() <= 0) {
            Log.e("用户设置不存在！创建一个用户设置", "设置");
            MySetting mySetting = new MySetting();
            mySetting.save();
            this.mySetting = mySetting;
            return;
        }
        Log.e("用户设置存在!保存到当前", "设置");
        this.mySetting = (MySetting) findAll.get(0);
    }

    public MySetting getMySetting() {
        return this.mySetting;
    }

    public boolean shouleWifiSettingAlarm() {
        if (this.mySetting.isWifiDisTr()) {
            if (MyApplication.getInstance().isWifi()) {
                Log.e("打开WIFI勿扰在WIFI下 报警", "设置");
                return false;
            }
            Log.e("打开WIFI勿扰但是不再WIFI下 需要报警", "设置");
            return true;
        }
        Log.e("未打开WIFI勿扰 需要报警", "设置");
        return true;
    }

    public boolean showTimeAlarm() {
        Integer valueOf = Integer.valueOf((this.mySetting.getEndHour().intValue() * 60) + this.mySetting.getEndMin().intValue());
        Integer valueOf2 = Integer.valueOf((this.mySetting.getStartHour().intValue() * 60) + this.mySetting.getStartMin().intValue());
        Calendar calendar = Calendar.getInstance();
        System.out.println("年: " + calendar.get(1));
        System.out.println("月: " + (calendar.get(2) + 1) + "");
        System.out.println("日: " + calendar.get(5));
        System.out.println("时: " + calendar.get(11));
        System.out.println("分: " + calendar.get(12));
        System.out.println("秒: " + calendar.get(13));
        System.out.println("当前时间毫秒数：" + calendar.getTimeInMillis());
        Integer valueOf3 = Integer.valueOf((calendar.get(11) * 60) + calendar.get(12));
        if (this.mySetting.isTimeDisTr()) {
            if (valueOf.intValue() >= valueOf2.intValue()) {
                if (valueOf3.intValue() > valueOf2.intValue() || valueOf3.intValue() < valueOf.intValue()) {
                    Log.e("同一天", "在勿扰时间内");
                    return false;
                }
                Log.e("同一天", "不再勿扰时间内");
                return true;
            }
            if (valueOf3.intValue() > valueOf2.intValue() || valueOf3.intValue() < valueOf.intValue()) {
                Log.e("时间判断在勿扰时间内 不报警", "");
                return false;
            }
            Log.e("不再勿扰时间内", "");
            return true;
        }
        Log.e("未打开时间报警", "应该报警");
        return true;
    }
}
