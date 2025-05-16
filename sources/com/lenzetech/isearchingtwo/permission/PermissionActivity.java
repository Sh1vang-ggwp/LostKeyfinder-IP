package com.lenzetech.isearchingtwo.permission;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import androidx.appcompat.app.AppCompatActivity;

/* loaded from: classes.dex */
public class PermissionActivity extends AppCompatActivity {
    public BlePermissionHelper blePermissionHelper;

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.blePermissionHelper = new BlePermissionHelper((Activity) this);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity, androidx.core.app.ActivityCompat.OnRequestPermissionsResultCallback
    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        super.onRequestPermissionsResult(i, strArr, iArr);
        for (String str : strArr) {
            this.blePermissionHelper.showSetPermissionDialogIfDeny(str, i);
            Log.e("TAG", "onRequestPermissionsResult: " + i + " " + str);
        }
    }
}
