package com.lenzetech.isearchingtwo.Bean;

import org.litepal.crud.LitePalSupport;

/* loaded from: classes.dex */
public class UserLocationInfo extends LitePalSupport {
    private String addressInfo;
    private String bleMac;
    private String dateString;
    private String googleaddress;
    private boolean isAmapHistroy = true;
    private Double lat;
    private Double lon;
    private String lostName;

    public String getGoogleaddress() {
        return this.googleaddress;
    }

    public void setGoogleaddress(String str) {
        this.googleaddress = str;
    }

    public String getAddressInfo() {
        return this.addressInfo;
    }

    public void setAddressInfo(String str) {
        this.addressInfo = str;
    }

    public String getBleMac() {
        return this.bleMac;
    }

    public void setBleMac(String str) {
        this.bleMac = str;
    }

    public String getDateString() {
        return this.dateString;
    }

    public void setDateString(String str) {
        this.dateString = str;
    }

    public String getLostName() {
        return this.lostName;
    }

    public void setLostName(String str) {
        this.lostName = str;
    }

    public Double getLat() {
        return this.lat;
    }

    public void setLat(Double d) {
        this.lat = d;
    }

    public Double getLon() {
        return this.lon;
    }

    public void setLon(Double d) {
        this.lon = d;
    }

    public boolean isAmapHistroy() {
        return this.isAmapHistroy;
    }

    public void setAmapHistroy(boolean z) {
        this.isAmapHistroy = z;
    }

    public String toString() {
        return "UserLocationInfo{lostName='" + this.lostName + "', googleaddress='" + this.googleaddress + "', addressInfo='" + this.addressInfo + "', bleMac='" + this.bleMac + "', lat=" + this.lat + ", lon=" + this.lon + ", dateString='" + this.dateString + "', isAmapHistroy=" + this.isAmapHistroy + '}';
    }
}
