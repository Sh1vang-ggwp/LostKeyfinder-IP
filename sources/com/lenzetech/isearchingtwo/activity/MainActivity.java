package com.lenzetech.isearchingtwo.activity;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MenuItem;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.exifinterface.media.ExifInterface;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.lenzetech.isearchingtwo.Bean.ResponseBean;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.ClickMODE;
import com.lenzetech.isearchingtwo.Utils.MyClickMode;
import com.lenzetech.isearchingtwo.Utils.MyLocation;
import com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList;
import com.lenzetech.isearchingtwo.application.EventType;
import com.lenzetech.isearchingtwo.application.MessageEvent;
import com.lenzetech.isearchingtwo.application.MyApplication;
import com.lenzetech.isearchingtwo.fragment.CameraFragment;
import com.lenzetech.isearchingtwo.fragment.DeviceFragment;
import com.lenzetech.isearchingtwo.fragment.GoogleMapFragment;
import com.lenzetech.isearchingtwo.fragment.LocationFragment;
import com.lenzetech.isearchingtwo.fragment.PdfFragment;
import com.lenzetech.isearchingtwo.fragment.SettingFragment;
import com.lenzetech.isearchingtwo.permission.PermissionActivity;
import java.util.Locale;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/* loaded from: classes.dex */
public class MainActivity extends PermissionActivity {
    public static String TAG = "MainActivity";
    public CameraFragment cameraFragment;
    public DeviceFragment deviceFragment;
    private FragmentManager fragmentManager;
    public GoogleMapFragment googleMapFragment;
    public LocationFragment locationFragment;
    private Fragment mCurrent;
    public PdfFragment pdfFragment;
    public SettingFragment settingFragment;
    private int fragmentId = 0;
    public Handler mHandler = new Handler() { // from class: com.lenzetech.isearchingtwo.activity.MainActivity.1
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            super.handleMessage(message);
            if (message.what == 123) {
                Log.e("notify", "更新");
                MainActivity.this.deviceFragment.getMyADP().notifyDataSetChanged();
            }
        }
    };
    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener = new BottomNavigationView.OnNavigationItemSelectedListener() { // from class: com.lenzetech.isearchingtwo.activity.MainActivity.2
        @Override // com.google.android.material.bottomnavigation.BottomNavigationView.OnNavigationItemSelectedListener
        public boolean onNavigationItemSelected(MenuItem menuItem) {
            switch (menuItem.getItemId()) {
                case R.id.navigation_camera /* 2131230936 */:
                    MyClickMode.nowMode = ClickMODE.Photo;
                    Log.e("底部", ExifInterface.GPS_MEASUREMENT_2D);
                    MainActivity.this.setFragment(1);
                    MainActivity.this.requestCameraPermission();
                    return true;
                case R.id.navigation_header_container /* 2131230937 */:
                default:
                    return false;
                case R.id.navigation_home /* 2131230938 */:
                    Log.e("底部", "1");
                    MyClickMode.nowMode = ClickMODE.Normal;
                    MainActivity.this.setFragment(0);
                    MyApplication.getInstance().UPDATERssi();
                    return true;
                case R.id.navigation_location /* 2131230939 */:
                    Log.e("底部", ExifInterface.GPS_MEASUREMENT_3D);
                    MyClickMode.nowMode = ClickMODE.Normal;
                    MainActivity.this.setFragment(2);
                    return true;
                case R.id.navigation_setting /* 2131230940 */:
                    Log.e("底部", "4");
                    MyClickMode.nowMode = ClickMODE.Normal;
                    MainActivity.this.setFragment(3);
                    return true;
                case R.id.navigation_setting_2 /* 2131230941 */:
                    Log.e("底部", "5");
                    MyClickMode.nowMode = ClickMODE.Normal;
                    MainActivity.this.setFragment(4);
                    return true;
            }
        }
    };
    private FusedLocationProviderClient fusedLocationClient = null;

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onStart() {
        super.onStart();
        EventBus.getDefault().register(this);
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onStop() {
        super.onStop();
        EventBus.getDefault().unregister(this);
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onMessageEvent(MessageEvent messageEvent) {
        if (messageEvent.getEventType() == EventType.DEVICE_VERIFY) {
            if (messageEvent.getResponseBean().getOpt() == 2) {
                showAlertDialog(messageEvent.getResponseBean());
                MyApplication.getInstance().deleteItemByMac(messageEvent.getDeviceMac());
            } else if (messageEvent.getResponseBean().getOpt() == 3) {
                finish();
            }
        }
    }

    private void showAlertDialog(final ResponseBean responseBean) {
        new AlertDialog.Builder(this).setTitle(responseBean.getTitle()).setMessage(responseBean.getContent()).setPositiveButton("确定", new DialogInterface.OnClickListener() { // from class: com.lenzetech.isearchingtwo.activity.MainActivity$$ExternalSyntheticLambda0
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                MainActivity.this.m243xebe12103(responseBean, dialogInterface, i);
            }
        }).setCancelable(false).show();
    }

    /* renamed from: lambda$showAlertDialog$0$com-lenzetech-isearchingtwo-activity-MainActivity, reason: not valid java name */
    /* synthetic */ void m243xebe12103(ResponseBean responseBean, DialogInterface dialogInterface, int i) {
        startActivity(new Intent("android.intent.action.VIEW", Uri.parse(responseBean.getWww())));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void requestCameraPermission() {
        if (Build.VERSION.SDK_INT > 28) {
            ActivityCompat.requestPermissions(this, new String[]{"android.permission.CAMERA"}, 4);
        } else {
            ActivityCompat.requestPermissions(this, new String[]{"android.permission.CAMERA", "android.permission.WRITE_EXTERNAL_STORAGE"}, 4);
        }
    }

    @Override // com.lenzetech.isearchingtwo.permission.PermissionActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        checkPermission();
        setContentView(R.layout.activity_main);
        ((BottomNavigationView) findViewById(R.id.navigation)).setOnNavigationItemSelectedListener(this.mOnNavigationItemSelectedListener);
        if (bundle == null) {
            setFragment(0);
        }
        Locale locale = getApplicationContext().getResources().getConfiguration().locale;
        MyApplication.getInstance().InitBle(this);
        MyApplication.getInstance().startDiscovery();
        RecordList.getInstance();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        Log.e("进入了前台", "设备进入前台");
        MyApplication.getInstance().UPDATERssi();
        if (this.blePermissionHelper.isLocationPermission() && this.blePermissionHelper.isEnableGps()) {
            MyLocation.getInstance().init(this);
        }
    }

    @Override // androidx.appcompat.app.AppCompatActivity, android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4) {
            moveTaskToBack(true);
            return true;
        }
        return super.onKeyDown(i, keyEvent);
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onSaveInstanceState(Bundle bundle) {
        bundle.putInt("fragment_id", this.fragmentId);
        super.onSaveInstanceState(bundle);
    }

    @Override // android.app.Activity
    protected void onRestoreInstanceState(Bundle bundle) {
        super.onRestoreInstanceState(bundle);
        FragmentManager supportFragmentManager = getSupportFragmentManager();
        this.deviceFragment = (DeviceFragment) supportFragmentManager.findFragmentByTag("main_fragment");
        this.cameraFragment = (CameraFragment) supportFragmentManager.findFragmentByTag("camera_fragment");
        Log.e("地图", "加载地图1：谷歌模式");
        this.googleMapFragment = (GoogleMapFragment) supportFragmentManager.findFragmentByTag("location_fragment");
        this.settingFragment = (SettingFragment) supportFragmentManager.findFragmentByTag("setting_fragment");
        this.pdfFragment = (PdfFragment) supportFragmentManager.findFragmentByTag("setting_fragment2");
        setFragment(bundle.getInt("fragment_id"));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setFragment(int i) {
        FragmentTransaction beginTransaction = getSupportFragmentManager().beginTransaction();
        hideFragments(beginTransaction);
        if (i == 0) {
            CameraFragment cameraFragment = this.cameraFragment;
            if (cameraFragment != null) {
                cameraFragment.releaseCamera();
            }
            this.fragmentId = 0;
            Fragment fragment = this.deviceFragment;
            if (fragment == null) {
                DeviceFragment deviceFragment = new DeviceFragment();
                this.deviceFragment = deviceFragment;
                beginTransaction.add(R.id.content_layout, deviceFragment, "main_fragment");
            } else {
                beginTransaction.show(fragment);
            }
        } else if (i == 1) {
            this.fragmentId = 1;
            Fragment fragment2 = this.cameraFragment;
            if (fragment2 == null) {
                CameraFragment cameraFragment2 = new CameraFragment();
                this.cameraFragment = cameraFragment2;
                beginTransaction.add(R.id.content_layout, cameraFragment2, "camera_fragment");
            } else {
                beginTransaction.show(fragment2);
                this.cameraFragment.InitCameraView();
            }
        } else if (i == 2) {
            this.fragmentId = 2;
            CameraFragment cameraFragment3 = this.cameraFragment;
            if (cameraFragment3 != null) {
                cameraFragment3.releaseCamera();
            }
            Log.e("地图", "加载地图：谷歌模式：" + getApplicationContext().getString(R.string.device));
            Fragment fragment3 = this.googleMapFragment;
            if (fragment3 == null) {
                GoogleMapFragment googleMapFragment = new GoogleMapFragment();
                this.googleMapFragment = googleMapFragment;
                beginTransaction.add(R.id.content_layout, googleMapFragment, "location_fragment");
            } else {
                beginTransaction.show(fragment3);
            }
        } else if (i == 3) {
            this.fragmentId = 3;
            CameraFragment cameraFragment4 = this.cameraFragment;
            if (cameraFragment4 != null) {
                cameraFragment4.releaseCamera();
            }
            Fragment fragment4 = this.settingFragment;
            if (fragment4 == null) {
                SettingFragment settingFragment = new SettingFragment();
                this.settingFragment = settingFragment;
                beginTransaction.add(R.id.content_layout, settingFragment, "setting_fragment");
            } else {
                beginTransaction.show(fragment4);
            }
        } else if (i == 4) {
            this.fragmentId = 4;
            CameraFragment cameraFragment5 = this.cameraFragment;
            if (cameraFragment5 != null) {
                cameraFragment5.releaseCamera();
            }
            Fragment fragment5 = this.pdfFragment;
            if (fragment5 == null) {
                PdfFragment pdfFragment = new PdfFragment();
                this.pdfFragment = pdfFragment;
                beginTransaction.add(R.id.content_layout, pdfFragment, "setting_fragment2");
            } else {
                beginTransaction.show(fragment5);
            }
        }
        beginTransaction.commit();
    }

    private void hideFragments(FragmentTransaction fragmentTransaction) {
        DeviceFragment deviceFragment = this.deviceFragment;
        if (deviceFragment != null) {
            fragmentTransaction.hide(deviceFragment);
        }
        CameraFragment cameraFragment = this.cameraFragment;
        if (cameraFragment != null) {
            fragmentTransaction.hide(cameraFragment);
        }
        GoogleMapFragment googleMapFragment = this.googleMapFragment;
        if (googleMapFragment != null) {
            fragmentTransaction.hide(googleMapFragment);
        }
        SettingFragment settingFragment = this.settingFragment;
        if (settingFragment != null) {
            fragmentTransaction.hide(settingFragment);
            this.settingFragment.onHideFc();
        }
        PdfFragment pdfFragment = this.pdfFragment;
        if (pdfFragment != null) {
            fragmentTransaction.hide(pdfFragment);
            this.pdfFragment.onHideFc();
        }
    }

    private void checkPermission() {
        if (ContextCompat.checkSelfPermission(getApplicationContext(), "android.permission.CAMERA") != 0 || ContextCompat.checkSelfPermission(getApplicationContext(), "android.permission.WRITE_EXTERNAL_STORAGE") != 0 || ContextCompat.checkSelfPermission(getApplicationContext(), "android.permission.READ_EXTERNAL_STORAGE") != 0 || ContextCompat.checkSelfPermission(getApplicationContext(), "android.permission.LOCATION_HARDWARE") != 0 || ContextCompat.checkSelfPermission(getApplicationContext(), "android.permission.ACCESS_COARSE_LOCATION") != 0 || ContextCompat.checkSelfPermission(getApplicationContext(), "android.permission.ACCESS_FINE_LOCATION") != 0 || ContextCompat.checkSelfPermission(getApplicationContext(), "android.permission.RECORD_AUDIO") != 0 || ContextCompat.checkSelfPermission(getApplicationContext(), "android.permission.BLUETOOTH_ADMIN") != 0) {
            if (ActivityCompat.shouldShowRequestPermissionRationale(this, "android.permission.CAMERA")) {
                ActivityCompat.requestPermissions(this, new String[]{"android.permission.CAMERA", "android.permission.WRITE_EXTERNAL_STORAGE", "android.permission.READ_EXTERNAL_STORAGE", "android.permission.LOCATION_HARDWARE", "android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION", "android.permission.RECORD_AUDIO", "android.permission.BLUETOOTH_ADMIN"}, 1);
                return;
            } else {
                ActivityCompat.requestPermissions(this, new String[]{"android.permission.CAMERA", "android.permission.WRITE_EXTERNAL_STORAGE", "android.permission.READ_EXTERNAL_STORAGE", "android.permission.LOCATION_HARDWARE", "android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION", "android.permission.RECORD_AUDIO", "android.permission.BLUETOOTH_ADMIN"}, 2);
                return;
            }
        }
        MyLocation.getInstance().init(this);
    }
}
