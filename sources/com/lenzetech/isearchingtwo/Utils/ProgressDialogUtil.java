package com.lenzetech.isearchingtwo.Utils;

import android.app.AlertDialog;
import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.lenzetech.isearchingtwo.R;

/* loaded from: classes.dex */
public class ProgressDialogUtil {
    private static AlertDialog mAlertDialog;

    public static void showProgressDialog(Context context) {
        if (mAlertDialog == null) {
            mAlertDialog = new AlertDialog.Builder(context, R.style.CustomProgressDialog).create();
        }
        View inflate = LayoutInflater.from(context).inflate(R.layout.progress_dialog_view, (ViewGroup) null);
        mAlertDialog.setView(inflate, 0, 0, 0, 0);
        mAlertDialog.setCanceledOnTouchOutside(false);
        ((TextView) inflate.findViewById(R.id.tvTip)).setText("加载中...");
        mAlertDialog.show();
    }

    public static void showProgressDialog(Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            str = "加载中...";
        }
        if (mAlertDialog == null) {
            mAlertDialog = new AlertDialog.Builder(context, R.style.CustomProgressDialog).create();
        }
        View inflate = LayoutInflater.from(context).inflate(R.layout.progress_dialog_view, (ViewGroup) null);
        mAlertDialog.setView(inflate, 0, 0, 0, 0);
        mAlertDialog.setCanceledOnTouchOutside(false);
        ((TextView) inflate.findViewById(R.id.tvTip)).setText(str);
        mAlertDialog.show();
    }

    public static void dismiss() {
        AlertDialog alertDialog = mAlertDialog;
        if (alertDialog == null || !alertDialog.isShowing()) {
            return;
        }
        mAlertDialog.dismiss();
    }
}
