package com.lenzetech.isearchingtwo.Adapter;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.lenzetech.isearchingtwo.Bean.MyBleItem;
import com.lenzetech.isearchingtwo.Bean.UserLocationInfo;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.GeocoderHandler;
import com.lenzetech.isearchingtwo.Utils.ImageDispose;
import com.lenzetech.isearchingtwo.Utils.MyLocation;
import com.lenzetech.isearchingtwo.Utils.UserDefaults;
import com.lenzetech.isearchingtwo.application.MyApplication;
import com.lenzetech.isearchingtwo.fragment.GoogleMapFragment;
import java.util.List;

/* loaded from: classes.dex */
public class LocatioitemAdapter extends ArrayAdapter<UserLocationInfo> {
    public ImageView bleimg;
    GeocoderHandler geocoderHandler;
    GoogleMapFragment googleMapFragment;
    List<UserLocationInfo> mData;
    private int resourceId;

    public LocatioitemAdapter(Context context, int i, List<UserLocationInfo> list) {
        super(context, i, list);
        this.resourceId = i;
        this.mData = list;
    }

    public List<UserLocationInfo> getData() {
        return this.mData;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int i, View view, ViewGroup viewGroup) {
        UserLocationInfo item;
        if (MyLocation.getInstance().userLocationInfoList.size() > UserDefaults.locationListCount) {
            item = getItem((UserDefaults.locationListCount - 1) - i);
        } else {
            item = getItem((MyLocation.getInstance().userLocationInfoList.size() - 1) - i);
        }
        View inflate = LayoutInflater.from(getContext()).inflate(this.resourceId, viewGroup, false);
        this.bleimg = (ImageView) inflate.findViewById(R.id.location_ble_img);
        MyBleItem bleItemByMac = MyApplication.getInstance().getBleItemByMac(item.getBleMac());
        if (bleItemByMac != null) {
            if (bleItemByMac.getImageByte() == null || bleItemByMac.getImageByte().length <= 0) {
                Log.e("进入蓝牙设置", "用户图片信息为空,不做处理");
            } else {
                Log.e("进入蓝牙设置", "得到用户自定义的图片");
                this.bleimg.setImageBitmap(ImageDispose.getPicFromBytes(bleItemByMac.getImageByte(), null));
            }
        }
        TextView textView = (TextView) inflate.findViewById(R.id.textItemadd);
        ((TextView) inflate.findViewById(R.id.location_ble_name)).setText(item.getLostName());
        ((TextView) inflate.findViewById(R.id.location_ble_time)).setText(item.getDateString());
        textView.setText(item.getGoogleaddress());
        return inflate;
    }

    public static boolean isZh(Context context) {
        return context.getResources().getConfiguration().locale.getLanguage().endsWith("zh");
    }
}
