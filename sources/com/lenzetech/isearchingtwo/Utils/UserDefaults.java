package com.lenzetech.isearchingtwo.Utils;

/* loaded from: classes.dex */
public class UserDefaults {
    public static double Lat = 0.0d;
    public static double Lon = 0.0d;
    public static int RecordListCount = 5;
    public static int locationListCount = 30;

    public static double getLon() {
        return Lon;
    }

    public static void setLon(double d) {
        Lon = d;
    }

    public static double getLat() {
        return Lat;
    }

    public static void setLat(double d) {
        Lat = d;
    }
}
