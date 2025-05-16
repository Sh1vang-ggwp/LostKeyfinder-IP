package com.lenzetech.isearchingtwo.Utils;

import android.app.IntentService;
import android.content.Intent;
import android.location.Address;
import android.location.Geocoder;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.maps.model.LatLng;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/* loaded from: classes.dex */
public class FetchAddressIntentService extends IntentService {
    public static final int FAILURE_RESULT = 1;
    public static final String LATLNG_DATA_EXTRA = "com.example.mylocationdemo.LATLNG_DATA_EXTRA";
    public static final String PACKAGE_NAME = "com.example.mylocationdemo";
    public static final String RECEIVER = "com.example.mylocationdemo.RECEIVER";
    public static final String RESULT_DATA_KEY = "com.example.mylocationdemo.RESULT_DATA_KEY";
    public static final int SUCCESS_RESULT = 0;
    private final String TAG;
    protected ResultReceiver mReceiver;

    public FetchAddressIntentService(String str) {
        super(str);
        this.TAG = "FetchAddress";
    }

    public FetchAddressIntentService() {
        this("AddressIntentService");
    }

    private void deliverResultToReceiver(int i, String str) {
        Bundle bundle = new Bundle();
        bundle.putString(RESULT_DATA_KEY, str);
        this.mReceiver.send(i, bundle);
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        String str;
        Geocoder geocoder = new Geocoder(this, Locale.getDefault());
        LatLng latLng = (LatLng) intent.getParcelableExtra(LATLNG_DATA_EXTRA);
        this.mReceiver = (ResultReceiver) intent.getParcelableExtra(RECEIVER);
        List<Address> list = null;
        try {
            list = geocoder.getFromLocation(latLng.latitude, latLng.longitude, 5);
            str = "";
        } catch (IOException unused) {
            str = "service_not_available";
            Log.e("FetchAddress", "service_not_available");
        } catch (IllegalArgumentException unused2) {
            str = "invalid_lat_long_used";
            Log.e("FetchAddress", "invalid_lat_long_used");
        }
        if (list == null || list.size() == 0) {
            if (str.isEmpty()) {
                str = "no_address_found";
                Log.e("FetchAddress", "no_address_found");
            }
            deliverResultToReceiver(1, str);
            return;
        }
        Address address = list.get(0);
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < address.getMaxAddressLineIndex(); i++) {
            arrayList.add(address.getAddressLine(i));
        }
        Log.i("FetchAddress", "address_found");
        deliverResultToReceiver(0, TextUtils.join(System.getProperty("line.separator"), arrayList));
    }
}
