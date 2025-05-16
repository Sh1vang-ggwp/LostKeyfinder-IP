package com.lenzetech.isearchingtwo.Bean;

import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.application.MyApplication;
import org.litepal.crud.LitePalSupport;

/* loaded from: classes.dex */
public class MyBleItem extends LitePalSupport {
    private byte[] imageByte;
    private String addresss = null;
    private String bleNickName = "iTAG";
    public boolean isAlarmOnDisconnect = false;
    private boolean isConnect = false;
    private Boolean hasBattery = false;
    private Integer battery = 0;
    private boolean isAlarming = false;
    private String btnShowText = MyApplication.getInstance().getApplicationContext().getString(R.string.clickConnect);
    private Integer rssi = 0;
    private Integer ringIndex = 1;
    private boolean isMine = false;

    public boolean isAlarming() {
        return this.isAlarming;
    }

    public void setAlarming(boolean z) {
        this.isAlarming = z;
    }

    public Boolean getHasBattery() {
        return this.hasBattery;
    }

    public void setHasBattery(Boolean bool) {
        this.hasBattery = bool;
    }

    public Integer getBattery() {
        return this.battery;
    }

    public void setBattery(Integer num) {
        this.battery = num;
    }

    public String getBtnShowText() {
        return this.btnShowText;
    }

    public void setBtnShowText(String str) {
        this.btnShowText = str;
    }

    public Integer getRssi() {
        return this.rssi;
    }

    public void setRssi(Integer num) {
        this.rssi = num;
    }

    public boolean isMine() {
        return this.isMine;
    }

    public void setMine(boolean z) {
        this.isMine = z;
    }

    public Integer getRingIndex() {
        return this.ringIndex;
    }

    public void setRingIndex(Integer num) {
        this.ringIndex = num;
    }

    public boolean isConnect() {
        return this.isConnect;
    }

    public void setConnect(boolean z) {
        this.isConnect = z;
    }

    public String getBleNickName() {
        return this.bleNickName;
    }

    public void setBleNickName(String str) {
        this.bleNickName = str;
    }

    public byte[] getImageByte() {
        return this.imageByte;
    }

    public void setImageByte(byte[] bArr) {
        this.imageByte = bArr;
    }

    public String getAddresss() {
        return this.addresss;
    }

    public void setAddresss(String str) {
        this.addresss = str;
    }

    public boolean isAlarmOnDisconnect() {
        return this.isAlarmOnDisconnect;
    }

    public void setAlarmOnDisconnect(boolean z) {
        this.isAlarmOnDisconnect = z;
    }
}
