package com.lenzetech.isearchingtwo.Utils;

import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Looper;
import android.util.Log;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.lenzetech.isearchingtwo.Bean.UserLocationInfo;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.litepal.LitePal;

/* loaded from: classes.dex */
public class MyLocation {
    private static final String TAG = "MyLocation";
    public static Location location;
    private static MyLocation myLocation;
    private FusedLocationProviderClient fusedLocationProviderClient;
    private LocationManager locationManager;
    private String locationProvider;
    private LocationRequest locationRequest;
    private Context mContext;
    LocationListener locationListener = new LocationListener() { // from class: com.lenzetech.isearchingtwo.Utils.MyLocation.2
        @Override // android.location.LocationListener
        public void onProviderDisabled(String str) {
        }

        @Override // android.location.LocationListener
        public void onProviderEnabled(String str) {
        }

        @Override // android.location.LocationListener
        public void onStatusChanged(String str, int i, Bundle bundle) {
        }

        @Override // android.location.LocationListener
        public void onLocationChanged(Location location2) {
            MyLocation.this.setLocation(location2);
        }
    };
    public List<UserLocationInfo> userLocationInfoList = new ArrayList();

    public void init(Context context) {
        this.mContext = context;
        getLocation();
    }

    public static MyLocation getInstance() {
        if (myLocation == null) {
            myLocation = new MyLocation();
        }
        return myLocation;
    }

    private void getLocation() {
        LocationManager locationManager = (LocationManager) this.mContext.getSystemService("location");
        this.locationManager = locationManager;
        List<String> providers = locationManager.getProviders(true);
        if (providers.contains("network")) {
            this.locationProvider = "network";
        } else if (!providers.contains("gps")) {
            return;
        } else {
            this.locationProvider = "gps";
        }
        Location lastKnownLocation = this.locationManager.getLastKnownLocation(this.locationProvider);
        if (lastKnownLocation != null) {
            setLocation(lastKnownLocation);
        }
        this.locationManager.requestLocationUpdates(this.locationProvider, 120000L, 0.0f, this.locationListener);
        this.locationRequest = new LocationRequest.Builder(60000L).setPriority(100).build();
        FusedLocationProviderClient fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(this.mContext);
        this.fusedLocationProviderClient = fusedLocationProviderClient;
        fusedLocationProviderClient.requestLocationUpdates(this.locationRequest, new LocationCallback() { // from class: com.lenzetech.isearchingtwo.Utils.MyLocation.1
            @Override // com.google.android.gms.location.LocationCallback
            public void onLocationResult(LocationResult locationResult) {
                super.onLocationResult(locationResult);
                if (locationResult.getLastLocation() != null) {
                    MyLocation.this.setLocation(locationResult.getLastLocation());
                }
            }
        }, (Looper) null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setLocation(Location location2) {
        location = location2;
        Log.e(TAG, "纬度：" + location2.getLatitude() + "经度：" + location2.getLongitude());
    }

    public void getCurrentLocation(String str, String str2) {
        Log.e("定位", "进入方法");
        UserLocationInfo userLocationInfo = new UserLocationInfo();
        userLocationInfo.setLostName(str);
        userLocationInfo.setAddressInfo(getAddressFromLocation(location));
        userLocationInfo.setLat(Double.valueOf(location.getLatitude()));
        userLocationInfo.setLon(Double.valueOf(location.getLongitude()));
        UserDefaults.setLat(location.getLatitude());
        UserDefaults.setLon(location.getLongitude());
        userLocationInfo.setBleMac(str2);
        userLocationInfo.setDateString(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ").format(new Date(System.currentTimeMillis())));
        userLocationInfo.save();
    }

    private String getAddressFromLocation(Location location2) {
        try {
            List<Address> fromLocation = new Geocoder(this.mContext, Locale.getDefault()).getFromLocation(location2.getLatitude(), location2.getLongitude(), 1);
            return (fromLocation == null || fromLocation.isEmpty()) ? "" : fromLocation.get(0).getAddressLine(0);
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

    public void upDateLocationDate() {
        this.userLocationInfoList.clear();
        this.userLocationInfoList = LitePal.findAll(UserLocationInfo.class, new long[0]);
    }

    public UserLocationInfo getLocationByIndex(int i) {
        if (this.userLocationInfoList.size() <= 0) {
            return null;
        }
        return this.userLocationInfoList.get(i);
    }
}
