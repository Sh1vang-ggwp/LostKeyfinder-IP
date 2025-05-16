package com.lenzetech.isearchingtwo.permission;

import android.app.Activity;
import android.app.AlertDialog;
import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import com.lenzetech.isearchingtwo.R;

/* loaded from: classes.dex */
public class BlePermissionHelper {
    private static final String TAG = "BlePermissionHelper";
    private final LocationManager locationManager;
    private Activity mActivity;
    private Context mContext;
    private AlertDialog mDialog;
    private final String[] gpsPermissions = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"};
    private final String[] blPermissions = {"android.permission.BLUETOOTH_SCAN", "android.permission.BLUETOOTH_CONNECT"};
    private final int OPEN_BLUETOOTH = 1;
    public final int REQUEST_GPS_PERMISSIONS = 202;
    public final int REQUEST_BLUETOOTH_PERMISSIONS = 303;
    private final BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

    public BlePermissionHelper(final Activity activity) {
        this.mActivity = activity;
        this.mContext = activity;
        this.locationManager = (LocationManager) this.mContext.getSystemService("location");
        AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
        builder.setTitle(R.string.get_permission).setMessage(R.string.permission_tips).setPositiveButton(R.string.set_up, new DialogInterface.OnClickListener() { // from class: com.lenzetech.isearchingtwo.permission.BlePermissionHelper$$ExternalSyntheticLambda0
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                BlePermissionHelper.lambda$new$0(activity, dialogInterface, i);
            }
        }).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null);
        AlertDialog create = builder.create();
        this.mDialog = create;
        create.setCanceledOnTouchOutside(true);
    }

    static /* synthetic */ void lambda$new$0(Activity activity, DialogInterface dialogInterface, int i) {
        Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
        intent.setData(Uri.fromParts("package", activity.getPackageName(), null));
        activity.startActivity(intent);
    }

    public BlePermissionHelper(Context context) {
        this.mContext = context;
        this.locationManager = (LocationManager) this.mContext.getSystemService("location");
    }

    public void requestGpsPermissions() {
        if (Build.VERSION.SDK_INT < 23 || isLocationPermission()) {
            return;
        }
        Log.e(TAG, "request gps permission");
        ActivityCompat.requestPermissions(this.mActivity, this.gpsPermissions, 202);
    }

    public void requestBlePermissions() {
        if (Build.VERSION.SDK_INT < 31 || isBlPermission()) {
            return;
        }
        Log.e(TAG, "request bl ");
        ActivityCompat.requestPermissions(this.mActivity, this.blPermissions, 303);
    }

    public boolean checkNOpenGps() {
        if (!isLocationPermission()) {
            requestGpsPermissions();
            return false;
        }
        if (isEnableGps()) {
            return true;
        }
        this.mActivity.startActivity(new Intent("android.settings.LOCATION_SOURCE_SETTINGS"));
        return false;
    }

    public boolean checkNOpenBl() {
        if (!isBlPermission()) {
            requestBlePermissions();
            return false;
        }
        if (isEnableBluetooth()) {
            return true;
        }
        this.mActivity.startActivityForResult(new Intent("android.bluetooth.adapter.action.REQUEST_ENABLE"), 1);
        return false;
    }

    public boolean isSupportBLE() {
        if (Build.VERSION.SDK_INT < 18) {
            return false;
        }
        return this.mContext.getPackageManager().hasSystemFeature("android.hardware.bluetooth_le");
    }

    public boolean isEnableBluetooth() {
        if (isSupportBLE()) {
            return this.bluetoothAdapter.isEnabled();
        }
        return false;
    }

    public boolean isEnableGps() {
        return this.locationManager.isProviderEnabled("gps") || this.locationManager.isProviderEnabled("network");
    }

    public boolean isLocationPermission() {
        return ContextCompat.checkSelfPermission(this.mContext, "android.permission.ACCESS_COARSE_LOCATION") == 0 || ContextCompat.checkSelfPermission(this.mContext, "android.permission.ACCESS_FINE_LOCATION") == 0;
    }

    public boolean isBlPermission() {
        if (Build.VERSION.SDK_INT >= 31) {
            return ContextCompat.checkSelfPermission(this.mContext, "android.permission.BLUETOOTH_CONNECT") == 0 && ContextCompat.checkSelfPermission(this.mContext, "android.permission.BLUETOOTH_SCAN") == 0;
        }
        return true;
    }

    public boolean isPermission(String str) {
        return ContextCompat.checkSelfPermission(this.mContext, str) == 0;
    }

    public void showSetPermissionDialogIfDeny(String str, int i) {
        if ((i != 303 && i != 202) || ActivityCompat.shouldShowRequestPermissionRationale(this.mActivity, str) || ContextCompat.checkSelfPermission(this.mActivity, str) == 0) {
            return;
        }
        Log.e(TAG, "show dialog" + str);
        if (this.mDialog.isShowing()) {
            return;
        }
        this.mDialog.show();
    }

    public void requestPermission(String str, int i) {
        if (ContextCompat.checkSelfPermission(this.mContext, str) != 0) {
            ActivityCompat.requestPermissions(this.mActivity, new String[]{str}, i);
        }
    }
}
