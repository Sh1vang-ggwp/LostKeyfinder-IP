package com.lenzetech.isearchingtwo.fragment;

import android.app.Activity;
import android.content.Intent;
import android.location.Location;
import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.core.internal.view.SupportMenu;
import androidx.fragment.app.Fragment;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.PolylineOptions;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.FetchAddressIntentService;
import com.lenzetech.isearchingtwo.Utils.PermissionUtils;
import com.lenzetech.isearchingtwo.activity.LocationActivity.LocaitonList;

/* loaded from: classes.dex */
public class GoogleMapFragment extends Fragment implements OnMapReadyCallback, GoogleMap.OnMyLocationButtonClickListener, View.OnClickListener, GoogleMap.OnMarkerDragListener, GoogleMap.OnCameraMoveStartedListener, GoogleMap.OnCameraMoveCanceledListener, ActivityCompat.OnRequestPermissionsResultCallback {
    private static final String KEY_CAMERA_POSITION = "camera_position";
    private static final String KEY_LOCATION = "location";
    private static final int LOCATION_PERMISSION_REQUEST_CODE = 1;
    public static int START_FORRESULT = 123;
    private static final String TAG = "LocationFragment";
    static GoogleMapFragment googleMapFragment;
    TextView button;
    private CameraPosition cameraPosition;
    private PolylineOptions currPolylineOptions;
    private MapView googleMapView;
    private LatLng lastLatLng;
    private boolean mAddressRequested;
    private View mContentView;
    public Location mLastLocation;
    private GoogleMap mMap;
    private AddressResultReceiver mResultReceiver;
    private Marker perth;
    private LatLng perthLatLng;
    private boolean mPermissionDenied = false;
    public FusedLocationProviderClient fusedLocationClient = null;
    private boolean isCanceled = false;

    @Override // com.google.android.gms.maps.GoogleMap.OnMarkerDragListener
    public void onMarkerDrag(Marker marker) {
    }

    @Override // com.google.android.gms.maps.GoogleMap.OnMarkerDragListener
    public void onMarkerDragStart(Marker marker) {
    }

    public static GoogleMapFragment getInstance() {
        GoogleMapFragment googleMapFragment2 = googleMapFragment;
        return googleMapFragment2 != null ? googleMapFragment2 : new GoogleMapFragment();
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.mLastLocation = (Location) bundle.getParcelable(KEY_LOCATION);
            this.cameraPosition = (CameraPosition) bundle.getParcelable(KEY_CAMERA_POSITION);
        }
        this.fusedLocationClient = LocationServices.getFusedLocationProviderClient((Activity) requireActivity());
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_google_map, viewGroup, false);
        this.mContentView = inflate;
        this.googleMapView = (MapView) inflate.findViewById(R.id.googlemapview);
        TextView textView = (TextView) this.mContentView.findViewById(R.id.googlelocationHis);
        this.button = textView;
        textView.setOnClickListener(this);
        this.googleMapView.onCreate(bundle);
        this.googleMapView.onResume();
        this.mResultReceiver = new AddressResultReceiver(new Handler());
        this.googleMapView.getMapAsync(this);
        MapsInitializer.initialize(requireActivity());
        MapsInitializer.initialize(requireActivity());
        return this.mContentView;
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        GoogleMap googleMap = this.mMap;
        if (googleMap != null) {
            bundle.putParcelable(KEY_CAMERA_POSITION, googleMap.getCameraPosition());
            bundle.putParcelable(KEY_LOCATION, this.mLastLocation);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        this.googleMapView.onPause();
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        Log.d(TAG, "onStart: ");
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        this.googleMapView.onResume();
        if (this.mPermissionDenied) {
            showMissingPermissionError();
            this.mPermissionDenied = false;
        }
        Log.d(TAG, "onResume: ");
    }

    @Override // androidx.fragment.app.Fragment
    public void onStop() {
        super.onStop();
        Log.d(TAG, "onStop: ");
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        this.googleMapView.onDestroy();
        super.onDestroy();
    }

    @Override // androidx.fragment.app.Fragment, android.content.ComponentCallbacks
    public void onLowMemory() {
        super.onLowMemory();
        this.googleMapView.onLowMemory();
    }

    @Override // com.google.android.gms.maps.OnMapReadyCallback
    public void onMapReady(GoogleMap googleMap) {
        this.mMap = googleMap;
        googleMap.setOnMyLocationButtonClickListener(this);
        this.mMap.setOnMarkerDragListener(this);
        this.mMap.setOnCameraMoveStartedListener(this);
        this.mMap.setOnCameraMoveCanceledListener(this);
        enableMyLocation();
    }

    private void checkIsGooglePlayConn() {
        if (this.mLastLocation != null) {
            startIntentService(new LatLng(this.mLastLocation.getLatitude(), this.mLastLocation.getLongitude()));
        }
        this.mAddressRequested = true;
    }

    private void enableMyLocation() {
        if (ContextCompat.checkSelfPermission(getContext(), "android.permission.ACCESS_FINE_LOCATION") != 0) {
            PermissionUtils.requestPermission((AppCompatActivity) getActivity(), 1, "android.permission.ACCESS_FINE_LOCATION", true);
            return;
        }
        GoogleMap googleMap = this.mMap;
        if (googleMap != null) {
            googleMap.setMyLocationEnabled(true);
            this.fusedLocationClient.getLastLocation().addOnCompleteListener(requireActivity(), new OnCompleteListener() { // from class: com.lenzetech.isearchingtwo.fragment.GoogleMapFragment$$ExternalSyntheticLambda0
                @Override // com.google.android.gms.tasks.OnCompleteListener
                public final void onComplete(Task task) {
                    GoogleMapFragment.this.m247x840bd182(task);
                }
            });
        }
    }

    /* renamed from: lambda$enableMyLocation$0$com-lenzetech-isearchingtwo-fragment-GoogleMapFragment, reason: not valid java name */
    /* synthetic */ void m247x840bd182(Task task) {
        if (task.isSuccessful()) {
            Location location = (Location) task.getResult();
            this.mLastLocation = location;
            if (location != null) {
                LatLng latLng = new LatLng(this.mLastLocation.getLatitude(), this.mLastLocation.getLongitude());
                this.lastLatLng = latLng;
                displayPerth(true, latLng);
                initCamera(this.lastLatLng);
            }
        }
    }

    @Override // com.google.android.gms.maps.GoogleMap.OnMyLocationButtonClickListener
    public boolean onMyLocationButtonClick() {
        if (this.mLastLocation != null) {
            Log.i("MapsActivity", "Latitude-->" + String.valueOf(this.mLastLocation.getLatitude()));
            Log.i("MapsActivity", "Longitude-->" + String.valueOf(this.mLastLocation.getLongitude()));
        }
        LatLng latLng = this.lastLatLng;
        if (latLng != null) {
            this.perth.setPosition(latLng);
        }
        checkIsGooglePlayConn();
        return false;
    }

    protected void startIntentService(LatLng latLng) {
        Intent intent = new Intent(getContext(), (Class<?>) FetchAddressIntentService.class);
        intent.putExtra(FetchAddressIntentService.RECEIVER, this.mResultReceiver);
        intent.putExtra(FetchAddressIntentService.LATLNG_DATA_EXTRA, latLng);
        requireActivity().startService(intent);
    }

    @Override // androidx.fragment.app.Fragment
    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        if (i != 1) {
            return;
        }
        if (PermissionUtils.isPermissionGranted(strArr, iArr, "android.permission.ACCESS_FINE_LOCATION")) {
            enableMyLocation();
        } else {
            this.mPermissionDenied = true;
        }
    }

    private void showMissingPermissionError() {
        PermissionUtils.PermissionDeniedDialog.newInstance(true).show(getActivity().getSupportFragmentManager(), "dialog");
    }

    private void displayPerth(boolean z, LatLng latLng) {
        if (this.perth == null) {
            Marker addMarker = this.mMap.addMarker(new MarkerOptions().position(latLng).title("Your Position"));
            this.perth = addMarker;
            addMarker.setDraggable(z);
        }
    }

    private void initCamera(final LatLng latLng) {
        new Thread(new Runnable() { // from class: com.lenzetech.isearchingtwo.fragment.GoogleMapFragment.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Thread.sleep(800L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                GoogleMapFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.lenzetech.isearchingtwo.fragment.GoogleMapFragment.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        GoogleMapFragment.this.mMap.animateCamera(CameraUpdateFactory.newLatLngZoom(latLng, 16.0f));
                    }
                });
            }
        }).start();
    }

    @Override // com.google.android.gms.maps.GoogleMap.OnMarkerDragListener
    public void onMarkerDragEnd(Marker marker) {
        LatLng position = marker.getPosition();
        this.perthLatLng = position;
        startIntentService(position);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() != R.id.googlelocationHis) {
            return;
        }
        startActivityForResult(new Intent(getContext(), (Class<?>) LocaitonList.class), START_FORRESULT);
    }

    @Override // com.google.android.gms.maps.GoogleMap.OnCameraMoveStartedListener
    public void onCameraMoveStarted(int i) {
        String str;
        PolylineOptions width = new PolylineOptions().width(5.0f);
        this.currPolylineOptions = width;
        if (i == 1) {
            width.color(-16776961);
            str = "GESTURE";
        } else if (i == 2) {
            width.color(SupportMenu.CATEGORY_MASK);
            str = "API_ANIMATION";
        } else if (i != 3) {
            str = "UNKNOWN_REASON";
        } else {
            width.color(-16711936);
            str = "DEVELOPER_ANIMATION";
        }
        Log.i(TAG, "onCameraMoveStarted(" + str + ")");
    }

    @Override // com.google.android.gms.maps.GoogleMap.OnCameraMoveCanceledListener
    public void onCameraMoveCanceled() {
        PolylineOptions polylineOptions = this.currPolylineOptions;
        if (polylineOptions != null) {
            this.mMap.addPolyline(polylineOptions);
        }
        this.isCanceled = true;
        this.currPolylineOptions = null;
        Log.i(TAG, "onCameraMoveCancelled");
    }

    public class AddressResultReceiver extends ResultReceiver {
        private String mAddressOutput;

        public AddressResultReceiver(Handler handler) {
            super(handler);
        }

        @Override // android.os.ResultReceiver
        protected void onReceiveResult(int i, Bundle bundle) {
            this.mAddressOutput = bundle.getString(FetchAddressIntentService.RESULT_DATA_KEY);
            if (i == 0) {
                Log.i("MapsActivity", "mAddressOutput-->" + this.mAddressOutput);
            }
        }
    }

    public void getGoogleLocation() {
        if (ActivityCompat.checkSelfPermission(getContext(), "android.permission.ACCESS_FINE_LOCATION") == 0 || ActivityCompat.checkSelfPermission(getContext(), "android.permission.ACCESS_COARSE_LOCATION") == 0) {
            this.fusedLocationClient.getLastLocation().addOnSuccessListener(getActivity(), new OnSuccessListener<Location>() { // from class: com.lenzetech.isearchingtwo.fragment.GoogleMapFragment.2
                @Override // com.google.android.gms.tasks.OnSuccessListener
                public void onSuccess(Location location) {
                }
            });
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
    }

    public void notifyPosition(double d, double d2, String str) {
        this.mMap.addMarker(new MarkerOptions().position(new LatLng(d2, d)).title(str));
    }
}
