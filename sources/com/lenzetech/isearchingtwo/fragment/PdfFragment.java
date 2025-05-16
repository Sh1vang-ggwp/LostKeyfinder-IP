package com.lenzetech.isearchingtwo.fragment;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Switch;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import com.github.barteksc.pdfviewer.PDFView;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList;

/* loaded from: classes.dex */
public class PdfFragment extends Fragment implements View.OnClickListener, FragmentChangedCallback {
    private static final String TAG = "SettingFragment";
    private static SettingFragment settingFragment;
    private View mContentView;
    Button recBtn;
    Switch recording_switch;
    Switch timeSwith;
    TextView timeText;
    Switch wifiSwith;

    @Override // com.lenzetech.isearchingtwo.fragment.FragmentChangedCallback
    public void onHideFc() {
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_pdf, viewGroup, false);
        this.mContentView = inflate;
        PDFView pDFView = (PDFView) inflate.findViewById(R.id.pdfView);
        if (this.mContentView.getContext().getString(R.string.device).equals("设备")) {
            Log.e("PDF", "中文PDF");
            pDFView.fromAsset("userguidch.pdf").defaultPage(1).load();
        } else {
            Log.e("PDF", "英文PDF");
            pDFView.fromAsset("userguiden.pdf").defaultPage(1).load();
        }
        return this.mContentView;
    }

    public static SettingFragment getInstance() {
        if (settingFragment == null) {
            settingFragment = new SettingFragment();
        }
        return settingFragment;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() != R.id.recBtn) {
            return;
        }
        startActivity(new Intent(getContext(), (Class<?>) RecordList.class));
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        Log.d(TAG, "onResume: onResume");
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        Log.d(TAG, "onPause: onPause");
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy: onDestroy");
    }
}
