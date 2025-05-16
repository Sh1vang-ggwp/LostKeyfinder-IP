package com.lenzetech.isearchingtwo.Utils;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.DialogFragment;
import com.lenzetech.isearchingtwo.R;

/* loaded from: classes.dex */
public class PermissionUtils {
    public static void requestPermission(AppCompatActivity appCompatActivity, int i, String str, boolean z) {
        if (ActivityCompat.shouldShowRequestPermissionRationale(appCompatActivity, str)) {
            RationaleDialog.newInstance(i, z).show(appCompatActivity.getSupportFragmentManager(), "dialog");
        } else {
            ActivityCompat.requestPermissions(appCompatActivity, new String[]{str}, i);
        }
    }

    public static boolean isPermissionGranted(String[] strArr, int[] iArr, String str) {
        for (int i = 0; i < strArr.length; i++) {
            if (str.equals(strArr[i])) {
                return iArr[i] == 0;
            }
        }
        return false;
    }

    public static class PermissionDeniedDialog extends DialogFragment {
        private static final String ARGUMENT_FINISH_ACTIVITY = "finish";
        private boolean mFinishActivity = false;

        public static PermissionDeniedDialog newInstance(boolean z) {
            Bundle bundle = new Bundle();
            bundle.putBoolean(ARGUMENT_FINISH_ACTIVITY, z);
            PermissionDeniedDialog permissionDeniedDialog = new PermissionDeniedDialog();
            permissionDeniedDialog.setArguments(bundle);
            return permissionDeniedDialog;
        }

        @Override // androidx.fragment.app.DialogFragment
        public Dialog onCreateDialog(Bundle bundle) {
            this.mFinishActivity = getArguments().getBoolean(ARGUMENT_FINISH_ACTIVITY);
            return new AlertDialog.Builder(getActivity()).setMessage(R.string.location_permission_denied).setPositiveButton(android.R.string.ok, (DialogInterface.OnClickListener) null).create();
        }

        @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnDismissListener
        public void onDismiss(DialogInterface dialogInterface) {
            super.onDismiss(dialogInterface);
            if (this.mFinishActivity) {
                Toast.makeText(getActivity(), R.string.permission_required_toast, 0).show();
                getActivity().finish();
            }
        }
    }

    public static class RationaleDialog extends DialogFragment {
        private static final String ARGUMENT_FINISH_ACTIVITY = "finish";
        private static final String ARGUMENT_PERMISSION_REQUEST_CODE = "requestCode";
        private boolean mFinishActivity = false;

        public static RationaleDialog newInstance(int i, boolean z) {
            Bundle bundle = new Bundle();
            bundle.putInt(ARGUMENT_PERMISSION_REQUEST_CODE, i);
            bundle.putBoolean(ARGUMENT_FINISH_ACTIVITY, z);
            RationaleDialog rationaleDialog = new RationaleDialog();
            rationaleDialog.setArguments(bundle);
            return rationaleDialog;
        }

        @Override // androidx.fragment.app.DialogFragment
        public Dialog onCreateDialog(Bundle bundle) {
            Bundle arguments = getArguments();
            final int i = arguments.getInt(ARGUMENT_PERMISSION_REQUEST_CODE);
            this.mFinishActivity = arguments.getBoolean(ARGUMENT_FINISH_ACTIVITY);
            return new AlertDialog.Builder(getActivity()).setMessage(R.string.permission_rationale_location).setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() { // from class: com.lenzetech.isearchingtwo.Utils.PermissionUtils.RationaleDialog.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i2) {
                    ActivityCompat.requestPermissions(RationaleDialog.this.getActivity(), new String[]{"android.permission.ACCESS_FINE_LOCATION"}, i);
                    RationaleDialog.this.mFinishActivity = false;
                }
            }).setNegativeButton(android.R.string.cancel, (DialogInterface.OnClickListener) null).create();
        }

        @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnDismissListener
        public void onDismiss(DialogInterface dialogInterface) {
            super.onDismiss(dialogInterface);
            if (this.mFinishActivity) {
                getActivity().finish();
            }
        }
    }
}
