package com.lenzetech.isearchingtwo;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.lenzetech.isearchingtwo.application.MyApplication;

/* loaded from: classes.dex */
public class BluetoothMonitorReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (action == null || !action.equals("android.bluetooth.adapter.action.STATE_CHANGED")) {
            return;
        }
        int intExtra = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0);
        if (intExtra == 10) {
            MyApplication.getInstance().initByCloseBl();
        } else if (intExtra == 12) {
            MyApplication.getInstance().startDiscovery();
        }
    }
}
