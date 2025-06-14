package com.blankj.utilcode.util;

import android.app.PendingIntent;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.telephony.SmsManager;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import java.lang.reflect.Method;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class PhoneUtils {
    private PhoneUtils() {
        throw new UnsupportedOperationException("u can't instantiate me...");
    }

    public static boolean isPhone() {
        return getTelephonyManager().getPhoneType() != 0;
    }

    public static String getDeviceId() {
        TelephonyManager telephonyManager = getTelephonyManager();
        String deviceId = telephonyManager.getDeviceId();
        if (!TextUtils.isEmpty(deviceId)) {
            return deviceId;
        }
        if (Build.VERSION.SDK_INT < 26) {
            return "";
        }
        String imei = telephonyManager.getImei();
        if (!TextUtils.isEmpty(imei)) {
            return imei;
        }
        String meid = telephonyManager.getMeid();
        return TextUtils.isEmpty(meid) ? "" : meid;
    }

    public static String getSerial() {
        return Build.VERSION.SDK_INT >= 26 ? Build.getSerial() : Build.SERIAL;
    }

    public static String getIMEI() {
        TelephonyManager telephonyManager = getTelephonyManager();
        if (Build.VERSION.SDK_INT >= 26) {
            return telephonyManager.getImei();
        }
        if (Build.VERSION.SDK_INT >= 21) {
            try {
                Method declaredMethod = telephonyManager.getClass().getDeclaredMethod("getImei", new Class[0]);
                declaredMethod.setAccessible(true);
                String str = (String) declaredMethod.invoke(telephonyManager, new Object[0]);
                if (str != null) {
                    return str;
                }
            } catch (Exception e) {
                Log.e("PhoneUtils", "getIMEI: ", e);
            }
        }
        String deviceId = telephonyManager.getDeviceId();
        return (deviceId == null || deviceId.length() != 15) ? "" : deviceId;
    }

    public static String getIMEI(int i) {
        TelephonyManager telephonyManager = getTelephonyManager();
        if (Build.VERSION.SDK_INT >= 26) {
            return telephonyManager.getImei(i);
        }
        if (Build.VERSION.SDK_INT >= 21) {
            try {
                Method declaredMethod = telephonyManager.getClass().getDeclaredMethod("getImei", Integer.TYPE);
                declaredMethod.setAccessible(true);
                String str = (String) declaredMethod.invoke(telephonyManager, Integer.valueOf(i));
                if (str != null) {
                    return str;
                }
            } catch (Exception e) {
                Log.e("PhoneUtils", "getIMEI: ", e);
            }
        }
        return getIMEI();
    }

    public static String getMEID() {
        TelephonyManager telephonyManager = getTelephonyManager();
        if (Build.VERSION.SDK_INT >= 26) {
            return telephonyManager.getMeid();
        }
        return telephonyManager.getDeviceId();
    }

    public static String getMEID(int i) {
        TelephonyManager telephonyManager = getTelephonyManager();
        if (Build.VERSION.SDK_INT >= 26) {
            return telephonyManager.getMeid(i);
        }
        return getMEID();
    }

    public static String getIMSI() {
        return getTelephonyManager().getSubscriberId();
    }

    public static int getPhoneType() {
        return getTelephonyManager().getPhoneType();
    }

    public static boolean isSimCardReady() {
        return getTelephonyManager().getSimState() == 5;
    }

    public static String getSimOperatorName() {
        return getTelephonyManager().getSimOperatorName();
    }

    public static String getSimOperatorByMnc() {
        String simOperator = getTelephonyManager().getSimOperator();
        if (simOperator == null) {
            return "";
        }
        simOperator.hashCode();
        switch (simOperator) {
            case "46000":
            case "46002":
            case "46007":
            case "46020":
                return "中国移动";
            case "46001":
            case "46006":
            case "46009":
                return "中国联通";
            case "46003":
            case "46005":
            case "46011":
                return "中国电信";
            default:
                return simOperator;
        }
    }

    public static String getPhoneStatus() {
        TelephonyManager telephonyManager = getTelephonyManager();
        return (((((((((((((("DeviceId(IMEI) = " + telephonyManager.getDeviceId() + "\n") + "DeviceSoftwareVersion = " + telephonyManager.getDeviceSoftwareVersion() + "\n") + "Line1Number = " + telephonyManager.getLine1Number() + "\n") + "NetworkCountryIso = " + telephonyManager.getNetworkCountryIso() + "\n") + "NetworkOperator = " + telephonyManager.getNetworkOperator() + "\n") + "NetworkOperatorName = " + telephonyManager.getNetworkOperatorName() + "\n") + "NetworkType = " + telephonyManager.getNetworkType() + "\n") + "PhoneType = " + telephonyManager.getPhoneType() + "\n") + "SimCountryIso = " + telephonyManager.getSimCountryIso() + "\n") + "SimOperator = " + telephonyManager.getSimOperator() + "\n") + "SimOperatorName = " + telephonyManager.getSimOperatorName() + "\n") + "SimSerialNumber = " + telephonyManager.getSimSerialNumber() + "\n") + "SimState = " + telephonyManager.getSimState() + "\n") + "SubscriberId(IMSI) = " + telephonyManager.getSubscriberId() + "\n") + "VoiceMailNumber = " + telephonyManager.getVoiceMailNumber();
    }

    public static boolean dial(String str) {
        Intent intent = new Intent("android.intent.action.DIAL", Uri.parse("tel:" + str));
        if (!isIntentAvailable(intent)) {
            return false;
        }
        Utils.getApp().startActivity(intent.addFlags(268435456));
        return true;
    }

    public static boolean call(String str) {
        Intent intent = new Intent("android.intent.action.CALL", Uri.parse("tel:" + str));
        if (!isIntentAvailable(intent)) {
            return false;
        }
        Utils.getApp().startActivity(intent.addFlags(268435456));
        return true;
    }

    public static boolean sendSms(String str, String str2) {
        Intent intent = new Intent("android.intent.action.SENDTO", Uri.parse("smsto:" + str));
        if (!isIntentAvailable(intent)) {
            return false;
        }
        intent.putExtra("sms_body", str2);
        Utils.getApp().startActivity(intent.addFlags(268435456));
        return true;
    }

    public static void sendSmsSilent(String str, String str2) {
        if (TextUtils.isEmpty(str2)) {
            return;
        }
        PendingIntent broadcast = PendingIntent.getBroadcast(Utils.getApp(), 0, new Intent("send"), 0);
        SmsManager smsManager = SmsManager.getDefault();
        if (str2.length() >= 70) {
            Iterator<String> it = smsManager.divideMessage(str2).iterator();
            while (it.hasNext()) {
                smsManager.sendTextMessage(str, null, it.next(), broadcast, null);
            }
            return;
        }
        smsManager.sendTextMessage(str, null, str2, broadcast, null);
    }

    private static TelephonyManager getTelephonyManager() {
        return (TelephonyManager) Utils.getApp().getSystemService("phone");
    }

    private static boolean isIntentAvailable(Intent intent) {
        return Utils.getApp().getPackageManager().queryIntentActivities(intent, 65536).size() > 0;
    }
}
