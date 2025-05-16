package com.lenzetech.isearchingtwo.Utils;

import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.util.Log;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes.dex */
public abstract class GeocoderHandler {
    public static final String TAG = "GeocoderHandler";
    private Geocoder mGeocoder;
    private Handler mHandler;
    private AtomicLong mTaskCount = new AtomicLong();
    private HandlerThread mHandlerThread = new HandlerThread(TAG);

    protected abstract void onResult(GeoResult geoResult);

    public GeocoderHandler(Context context) {
        this.mGeocoder = new Geocoder(context);
    }

    public void start() {
        this.mHandlerThread.start();
        this.mHandler = new Handler(this.mHandlerThread.getLooper(), new Handler.Callback() { // from class: com.lenzetech.isearchingtwo.Utils.GeocoderHandler.1
            @Override // android.os.Handler.Callback
            public boolean handleMessage(Message message) {
                GeoResult geoResult = (GeoResult) message.obj;
                geoResult.result = GeocoderHandler.this.getAddress(geoResult.lat, geoResult.lng);
                GeocoderHandler.this.onResult(geoResult);
                return false;
            }
        });
    }

    public void stop() {
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandlerThread.quit();
    }

    public void send(Object obj, double d, double d2) {
        Message obtain = Message.obtain();
        obtain.obj = new GeoResult(obj, d, d2);
        if (this.mHandler.sendMessage(obtain)) {
            this.mTaskCount.incrementAndGet();
        }
    }

    public static class GeoResult implements Serializable {
        private double lat;
        private double lng;
        private Object obj;
        private String result;

        GeoResult(Object obj, double d, double d2) {
            this.obj = obj;
            this.lat = d;
            this.lng = d2;
        }

        public Object getObj() {
            return this.obj;
        }

        public String getResult() {
            return this.result;
        }

        public String toString() {
            return "GeoResult{lat=" + this.lat + ", lng=" + this.lng + ", obj=" + this.obj + ", result='" + this.result + "'}";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getAddress(double d, double d2) {
        String sb;
        try {
            List<Address> fromLocation = this.mGeocoder.getFromLocation(d, d2, 1);
            if (fromLocation.size() > 0) {
                Address address = fromLocation.get(0);
                if (address != null && address.getMaxAddressLineIndex() != -1) {
                    if (address.getMaxAddressLineIndex() == 0) {
                        sb = address.getAddressLine(0);
                    } else {
                        StringBuilder sb2 = new StringBuilder();
                        for (int i = 1; i <= address.getMaxAddressLineIndex(); i++) {
                            sb2.append(address.getAddressLine(i));
                        }
                        sb = sb2.toString();
                    }
                    Log.d(TAG, "getAddress: address=" + sb + ",result=" + address);
                    return sb;
                }
                sb = null;
                Log.d(TAG, "getAddress: address=" + sb + ",result=" + address);
                return sb;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
