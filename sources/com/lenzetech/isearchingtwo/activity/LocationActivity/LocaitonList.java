package com.lenzetech.isearchingtwo.activity.LocationActivity;

import android.content.Intent;
import android.location.Location;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import androidx.appcompat.app.AppCompatActivity;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.Constants;
import com.lenzetech.isearchingtwo.Adapter.LocatioitemAdapter;
import com.lenzetech.isearchingtwo.Bean.UserLocationInfo;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.FetchAddressIntentService;
import com.lenzetech.isearchingtwo.Utils.GeocoderHandler;
import com.lenzetech.isearchingtwo.Utils.MyLocation;
import com.lenzetech.isearchingtwo.Utils.UserDefaults;
import com.lenzetech.isearchingtwo.application.MyApplication;
import com.lenzetech.isearchingtwo.fragment.GoogleMapFragment;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public class LocaitonList extends AppCompatActivity implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener {
    private static final String TAG = "LocaitonList";
    Button backBtn;
    GeocoderHandler geocoderHandler;
    protected Location lastLocation;
    ListView listView;
    private GoogleMapFragment.AddressResultReceiver resultReceiver;
    private List<UserLocationInfo> userLocationInfoList = new ArrayList();

    @Override // com.google.android.gms.common.api.internal.ConnectionCallbacks
    public void onConnected(Bundle bundle) {
    }

    @Override // com.google.android.gms.common.api.internal.OnConnectionFailedListener
    public void onConnectionFailed(ConnectionResult connectionResult) {
    }

    @Override // com.google.android.gms.common.api.internal.ConnectionCallbacks
    public void onConnectionSuspended(int i) {
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_locaiton_list);
        GeocoderHandler geocoderHandler = new GeocoderHandler(MyApplication.getInstance()) { // from class: com.lenzetech.isearchingtwo.activity.LocationActivity.LocaitonList.1
            @Override // com.lenzetech.isearchingtwo.Utils.GeocoderHandler
            public void onResult(GeocoderHandler.GeoResult geoResult) {
                LocaitonList.this.updateListGeocode((UserLocationInfo) geoResult.getObj(), geoResult.getResult());
                Log.d(GeocoderHandler.TAG, "onResult: " + geoResult);
            }
        };
        this.geocoderHandler = geocoderHandler;
        geocoderHandler.start();
        MyLocation.getInstance().upDateLocationDate();
        InitList();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
    }

    private void InitList() {
        this.listView = (ListView) findViewById(R.id.LocListView);
        this.userLocationInfoList.clear();
        if (MyLocation.getInstance().userLocationInfoList.size() > UserDefaults.locationListCount) {
            int size = MyLocation.getInstance().userLocationInfoList.size();
            for (int i = UserDefaults.locationListCount - 1; i >= 0; i--) {
                this.userLocationInfoList.add(MyLocation.getInstance().userLocationInfoList.get((size - 1) - i));
            }
        } else {
            int size2 = MyLocation.getInstance().userLocationInfoList.size() - 1;
            for (int i2 = size2; i2 >= 0; i2--) {
                this.userLocationInfoList.add(MyLocation.getInstance().userLocationInfoList.get(size2 - i2));
            }
        }
        Log.d(TAG, "InitList: userLocationInfoList.size=" + this.userLocationInfoList.size());
        this.listView.setAdapter((ListAdapter) new LocatioitemAdapter(getApplicationContext(), R.layout.location_item, this.userLocationInfoList));
        Button button = (Button) findViewById(R.id.setting_back_btn);
        this.backBtn = button;
        button.setOnClickListener(new View.OnClickListener() { // from class: com.lenzetech.isearchingtwo.activity.LocationActivity.LocaitonList.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                LocaitonList.this.finish();
            }
        });
        this.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.lenzetech.isearchingtwo.activity.LocationActivity.LocaitonList.3
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> adapterView, View view, int i3, long j) {
                Log.i(LocaitonList.TAG, "onItemClick: ------" + i3);
                UserLocationInfo userLocationInfo = ((LocatioitemAdapter) LocaitonList.this.listView.getAdapter()).getData().get(i3);
                Intent intent = new Intent();
                intent.putExtra("LON", userLocationInfo.getLon());
                intent.putExtra("LAT", userLocationInfo.getLat());
                intent.putExtra("AD", userLocationInfo.getGoogleaddress());
                LocaitonList.this.setResult(0, intent);
                LocaitonList.this.finish();
            }
        });
        for (UserLocationInfo userLocationInfo : this.userLocationInfoList) {
            Log.d(TAG, "upDateLocationDate: item=" + userLocationInfo);
            this.geocoderHandler.send(userLocationInfo, userLocationInfo.getLat().doubleValue(), userLocationInfo.getLon().doubleValue());
        }
    }

    protected void startIntentService() {
        Intent intent = new Intent(this, (Class<?>) FetchAddressIntentService.class);
        intent.putExtra(Constants.EXTRA_RESULT_RECEIVER, this.resultReceiver);
        startService(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateListGeocode(UserLocationInfo userLocationInfo, String str) {
        if (userLocationInfo == null) {
            return;
        }
        Iterator<UserLocationInfo> it = this.userLocationInfoList.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            UserLocationInfo next = it.next();
            if (next == userLocationInfo) {
                next.setGoogleaddress(str);
                break;
            }
        }
        Log.e(TAG, "updateListGeocode: size=" + this.userLocationInfoList.size() + ",item=" + userLocationInfo);
        runOnUiThread(new Runnable() { // from class: com.lenzetech.isearchingtwo.activity.LocationActivity.LocaitonList.4
            @Override // java.lang.Runnable
            public void run() {
                ((LocatioitemAdapter) LocaitonList.this.listView.getAdapter()).notifyDataSetChanged();
            }
        });
    }
}
