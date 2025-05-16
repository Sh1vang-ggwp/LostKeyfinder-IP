package com.lenzetech.isearchingtwo.application;

import com.lenzetech.isearchingtwo.Bean.ResponseBean;

/* loaded from: classes.dex */
public class MessageEvent {
    private byte[] bytesInfo;
    private String deviceMac;
    private EventType eventType;
    private ResponseBean responseBean;

    public MessageEvent(EventType eventType, byte[] bArr, ResponseBean responseBean, String str) {
        setEventType(eventType);
        setBytesInfo(bArr);
        setResponseBean(responseBean);
        setDeviceMac(str);
    }

    public byte[] getBytesInfo() {
        return this.bytesInfo;
    }

    public void setBytesInfo(byte[] bArr) {
        this.bytesInfo = bArr;
    }

    public EventType getEventType() {
        return this.eventType;
    }

    public void setEventType(EventType eventType) {
        this.eventType = eventType;
    }

    public ResponseBean getResponseBean() {
        return this.responseBean;
    }

    public void setResponseBean(ResponseBean responseBean) {
        this.responseBean = responseBean;
    }

    public String getDeviceMac() {
        return this.deviceMac;
    }

    public void setDeviceMac(String str) {
        this.deviceMac = str;
    }
}
