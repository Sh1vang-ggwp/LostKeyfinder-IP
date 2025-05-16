package com.lenzetech.isearchingtwo.fragment;

import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.lenzetech.isearchingtwo.Adapter.LinearAdapter;
import com.lenzetech.isearchingtwo.Bean.UserLocationInfo;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.activity.MainActivity;
import com.lenzetech.isearchingtwo.application.MyApplication;
import com.lenzetech.isearchingtwo.dialogevent.DialogEvent;
import com.lenzetech.isearchingtwo.dialogevent.EventCallback;
import com.scwang.smartrefresh.layout.api.RefreshLayout;
import com.scwang.smartrefresh.layout.listener.OnLoadMoreListener;
import com.scwang.smartrefresh.layout.listener.OnRefreshListener;
import java.util.HashMap;

/* loaded from: classes.dex */
public class DeviceFragment extends Fragment implements View.OnClickListener, EventCallback {
    private static final String TAG = "DeviceFragment";
    static DeviceFragment deviceFragment;
    Button btn1;
    Button btn2;
    TextView dialog_new_message;
    TextView dialog_new_session;
    private View mContentView;
    private Dialog mDialog;
    private Dialog mDialog2;
    private HashMap<String, DialogInterface> mHashMap = new HashMap<>();
    private LinearAdapter myADP;
    RecyclerView myRecyclerView;
    public ImageView scanBtn;
    UserLocationInfo userLocationInfo;

    @Override // com.lenzetech.isearchingtwo.dialogevent.EventCallback
    public void onEvent(DialogEvent dialogEvent) {
    }

    public static DeviceFragment getInstance() {
        DeviceFragment deviceFragment2 = deviceFragment;
        return deviceFragment2 != null ? deviceFragment2 : new DeviceFragment();
    }

    public DeviceFragment() {
        Log.e("实例化", TAG);
        deviceFragment = this;
    }

    public LinearAdapter getMyADP() {
        return this.myADP;
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mContentView = layoutInflater.inflate(R.layout.fragment_device, viewGroup, false);
        InitRecycleView();
        ImageView imageView = (ImageView) this.mContentView.findViewById(R.id.scanBtn);
        this.scanBtn = imageView;
        imageView.setImageDrawable(getResources().getDrawable(R.drawable.add));
        this.scanBtn.setOnClickListener(this);
        RefreshLayout refreshLayout = (RefreshLayout) this.mContentView.findViewById(R.id.refreshLayout);
        refreshLayout.setOnRefreshListener(new OnRefreshListener() { // from class: com.lenzetech.isearchingtwo.fragment.DeviceFragment.1
            @Override // com.scwang.smartrefresh.layout.listener.OnRefreshListener
            public void onRefresh(RefreshLayout refreshLayout2) {
                MyApplication.getInstance().startDiscovery();
                refreshLayout2.finishRefresh(5000, true);
            }
        });
        refreshLayout.setOnLoadMoreListener(new OnLoadMoreListener() { // from class: com.lenzetech.isearchingtwo.fragment.DeviceFragment.2
            @Override // com.scwang.smartrefresh.layout.listener.OnLoadMoreListener
            public void onLoadMore(RefreshLayout refreshLayout2) {
                refreshLayout2.finishLoadMore(2000);
            }
        });
        return this.mContentView;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() != R.id.scanBtn) {
            return;
        }
        MyApplication.getInstance().startDiscovery();
        this.scanBtn.setImageDrawable(getResources().getDrawable(R.drawable.find));
        new Handler().postDelayed(new Runnable() { // from class: com.lenzetech.isearchingtwo.fragment.DeviceFragment.3
            @Override // java.lang.Runnable
            public void run() {
                DeviceFragment.this.scanBtn.setImageDrawable(DeviceFragment.this.getResources().getDrawable(R.drawable.add));
            }
        }, 5000L);
    }

    void InitRecycleView() {
        RecyclerView recyclerView = (RecyclerView) this.mContentView.findViewById(R.id.myrecycleview);
        this.myRecyclerView = recyclerView;
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        LinearAdapter linearAdapter = new LinearAdapter(getContext());
        this.myADP = linearAdapter;
        this.myRecyclerView.setAdapter(linearAdapter);
    }

    public void UpDateOnUIThread() {
        Message message = new Message();
        message.what = 123;
        if (((MainActivity) getActivity()) == null || ((MainActivity) getActivity()).mHandler == null) {
            return;
        }
        ((MainActivity) getActivity()).mHandler.sendMessage(message);
    }

    public class UpdateListReceiver extends BroadcastReceiver {
        public UpdateListReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            DeviceFragment.this.myADP.notifyDataSetChanged();
        }
    }
}
