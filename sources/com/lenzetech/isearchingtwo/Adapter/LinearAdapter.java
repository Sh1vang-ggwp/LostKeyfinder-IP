package com.lenzetech.isearchingtwo.Adapter;

import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.RecyclerView;
import com.lenzetech.isearchingtwo.Bean.MyBleItem;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.application.MyApplication;

/* loaded from: classes.dex */
public class LinearAdapter extends RecyclerView.Adapter<LinearViewHolder> {
    static LinearAdapter linearAdapter;
    private Context mContext;
    private LayoutInflater mLayoutInflater;

    public LinearAdapter(Context context) {
        this.mContext = context;
        this.mLayoutInflater = LayoutInflater.from(context);
        linearAdapter = this;
    }

    public static LinearAdapter getInstance(Context context) {
        if (linearAdapter == null) {
            linearAdapter = new LinearAdapter(context);
        }
        return linearAdapter;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public LinearViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new LinearViewHolder(this.mLayoutInflater.inflate(R.layout.item_bledevice, viewGroup, false));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(LinearViewHolder linearViewHolder, int i) {
        ((LinearLayout) linearViewHolder.itemView).setBackgroundColor(Color.green(1));
        linearViewHolder.id = i;
        MyBleItem bleItemByid = MyApplication.getInstance().getBleItemByid(Integer.valueOf(i));
        linearViewHolder.SetConnBtnText(bleItemByid.getBtnShowText());
        linearViewHolder.SetLableName(bleItemByid.getAddresss());
        linearViewHolder.macAddress = bleItemByid.getAddresss();
        linearViewHolder.SetNickName(bleItemByid.getBleNickName());
        if (bleItemByid.getBleNickName().contains("Tag-It")) {
            linearViewHolder.SetNickName("iTAG");
        } else {
            linearViewHolder.SetNickName(bleItemByid.getBleNickName());
        }
        if (bleItemByid.isAlarming()) {
            linearViewHolder.SetIsArlarUI(true);
        } else {
            linearViewHolder.SetIsArlarUI(false);
        }
        if (bleItemByid.getImageByte() != null) {
            linearViewHolder.SetHeadImg(bleItemByid.getImageByte());
        } else {
            linearViewHolder.SetHeadImg(bleItemByid.getImageByte());
        }
        Integer rssi = bleItemByid.getRssi();
        linearViewHolder.SetRssi(rssi);
        linearViewHolder.SetBatteryIcon(bleItemByid.getBattery().intValue(), bleItemByid.getHasBattery().booleanValue());
        Log.e("信号变化222", rssi + "");
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return MyApplication.getInstance().bleItemHashMap.size();
    }
}
