package com.lenzetech.isearchingtwo.Bean;

import org.litepal.crud.LitePalSupport;

/* loaded from: classes.dex */
public class MySetting extends LitePalSupport {
    boolean timeDisTr = true;
    Integer startHour = 23;
    Integer startMin = 0;
    Integer endHour = 7;
    Integer endMin = 0;
    boolean WifiDisTr = false;
    boolean doubleClickIsRecording = false;

    public boolean isWifiDisTr() {
        return this.WifiDisTr;
    }

    public void setWifiDisTr(boolean z) {
        this.WifiDisTr = z;
    }

    public boolean isDoubleClickIsRecording() {
        return this.doubleClickIsRecording;
    }

    public void setDoubleClickIsRecording(boolean z) {
        this.doubleClickIsRecording = z;
    }

    public boolean isTimeDisTr() {
        return this.timeDisTr;
    }

    public void setTimeDisTr(boolean z) {
        this.timeDisTr = z;
    }

    public Integer getStartHour() {
        return this.startHour;
    }

    public void setStartHour(Integer num) {
        this.startHour = num;
    }

    public Integer getStartMin() {
        return this.startMin;
    }

    public void setStartMin(Integer num) {
        this.startMin = num;
    }

    public Integer getEndHour() {
        return this.endHour;
    }

    public void setEndHour(Integer num) {
        this.endHour = num;
    }

    public Integer getEndMin() {
        return this.endMin;
    }

    public void setEndMin(Integer num) {
        this.endMin = num;
    }
}
