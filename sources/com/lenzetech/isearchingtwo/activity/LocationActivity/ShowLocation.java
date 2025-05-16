package com.lenzetech.isearchingtwo.activity.LocationActivity;

import com.lenzetech.isearchingtwo.Bean.UserLocationInfo;

/* loaded from: classes.dex */
public class ShowLocation {
    private static boolean sholdShow = false;
    private static UserLocationInfo userLocationInfo;

    public static boolean isSholdShow() {
        return sholdShow;
    }

    public static void setSholdShow(boolean z) {
        sholdShow = z;
    }

    public static UserLocationInfo getUserLocationInfo() {
        return userLocationInfo;
    }

    public static void setUserLocationInfo(UserLocationInfo userLocationInfo2) {
        userLocationInfo = userLocationInfo2;
    }
}
