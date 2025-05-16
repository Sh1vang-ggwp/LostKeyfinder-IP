package com.lenzetech.isearchingtwo;

import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.util.Log;
import com.lenzetech.isearchingtwo.application.MyApplication;

/* loaded from: classes.dex */
public class MyService extends Service {
    Handler mHandler = new Handler();
    Runnable r = new Runnable() { // from class: com.lenzetech.isearchingtwo.MyService.1
        @Override // java.lang.Runnable
        public void run() {
            Log.e("运行", "运行");
            MyApplication.getInstance().UPDATERssi();
            MyService.this.mHandler.postDelayed(this, 3000L);
        }
    };

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mHandler.postDelayed(this.r, 100L);
        Log.e("运行1", "运行1");
    }
}
