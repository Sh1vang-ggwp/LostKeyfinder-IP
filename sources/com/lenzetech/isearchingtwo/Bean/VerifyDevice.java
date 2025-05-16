package com.lenzetech.isearchingtwo.Bean;

/* loaded from: classes.dex */
public class VerifyDevice {
    private String deviceName = "";
    private String deviceMac = "";
    private String deviceAdvInfo = "";
    private String deviceCharacterInfo = "";
    private String appVersion = "";

    public String getDeviceName() {
        return this.deviceName;
    }

    public void setDeviceName(String str) {
        this.deviceName = str;
    }

    public String getDeviceMac() {
        return this.deviceMac;
    }

    public void setDeviceMac(String str) {
        this.deviceMac = str;
    }

    public String getAppVersion() {
        return this.appVersion;
    }

    public void setAppVersion(String str) {
        this.appVersion = str;
    }

    public String getDeviceAdvInfo() {
        return this.deviceAdvInfo;
    }

    public void setDeviceAdvInfo(String str) {
        this.deviceAdvInfo = str;
    }

    public String getDeviceCharacterInfo() {
        return this.deviceCharacterInfo;
    }

    public void setDeviceCharacterInfo(String str) {
        this.deviceCharacterInfo = str;
    }
}
