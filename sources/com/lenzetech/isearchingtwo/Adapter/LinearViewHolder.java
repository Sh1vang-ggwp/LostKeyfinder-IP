package com.lenzetech.isearchingtwo.Adapter;

import android.app.ProgressDialog;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.ImageDispose;
import com.lenzetech.isearchingtwo.Utils.ProgressDialogUtil;
import com.lenzetech.isearchingtwo.application.MyApplication;
import com.lenzetech.isearchingtwo.fragment.DeviceFragment;

/* loaded from: classes.dex */
public class LinearViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
    public ImageView batteryImage;
    public TextView button;
    private TextView connBtn;
    public ImageView headImageView;
    public int id;
    public LinearLayout itemRelativlayout;
    LocatioitemAdapter locatioitemAdapter;
    public String macAddress;
    public LinearAdapter myAdapter;
    private TextView nameText;
    public String nickName;
    public ProgressDialog progressDialog;
    private LinearLayout relativeLayout;
    public ImageView rssiImage;
    private TextView settingBtn;
    private TextView textView;

    public LinearViewHolder(View view) {
        super(view);
        this.nickName = "";
        this.headImageView = null;
        this.progressDialog = null;
        this.relativeLayout = (LinearLayout) view.findViewById(R.id.bleitem);
        TextView textView = (TextView) view.findViewById(R.id.btnDelete);
        this.button = textView;
        textView.setOnClickListener(this);
        this.textView = (TextView) view.findViewById(R.id.myText);
        TextView textView2 = (TextView) view.findViewById(R.id.blesetting);
        this.settingBtn = textView2;
        textView2.setOnClickListener(this);
        TextView textView3 = (TextView) view.findViewById(R.id.bleconn);
        this.connBtn = textView3;
        textView3.setOnClickListener(this);
        this.connBtn.setText(MyApplication.getInstance().getBleItemByid(Integer.valueOf(this.id)).getBtnShowText());
        this.nameText = (TextView) view.findViewById(R.id.nameText);
        this.batteryImage = (ImageView) view.findViewById(R.id.batteryImage);
        this.headImageView = (ImageView) view.findViewById(R.id.fdqImg);
        this.rssiImage = (ImageView) view.findViewById(R.id.rssiImg);
        this.itemRelativlayout = (LinearLayout) view.findViewById(R.id.bleitem);
    }

    public void SetIsArlarUI(boolean z) {
        if (z) {
            this.itemRelativlayout.setBackgroundColor(this.itemView.getResources().getColor(R.color.red));
        } else {
            this.itemRelativlayout.setBackgroundColor(this.itemView.getResources().getColor(R.color.bg_gary));
        }
    }

    public void SetConnBtnText(String str) {
        this.connBtn.setText(str);
    }

    public void SetLableName(String str) {
        this.textView.setText(str);
    }

    public void SetNickName(String str) {
        this.nameText.setText(str);
    }

    public void SetHeadImg(byte[] bArr) {
        if (bArr != null && bArr.length > 0) {
            this.headImageView.setImageBitmap(ImageDispose.getPicFromBytes(bArr, null));
        } else {
            this.headImageView.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.ic_bledevices));
        }
    }

    public void SetRssi(Integer num) {
        Log.e("设备信号强度", num + ":");
        if (num.intValue() > -50) {
            this.rssiImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.rssi4));
            return;
        }
        if (num.intValue() > -60) {
            this.rssiImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.rssi3));
        } else if (num.intValue() > -70) {
            this.rssiImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.rssi2));
        } else if (num.intValue() > -80) {
            this.rssiImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.rssi1));
        }
    }

    public void SetBatteryIcon(int i, boolean z) {
        if (!z) {
            this.batteryImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.batteryno));
            return;
        }
        Log.e("设备信号强度", i + ":");
        if (i > 80) {
            this.batteryImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.battery4));
            return;
        }
        if (i > 60) {
            this.batteryImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.battery3));
            return;
        }
        if (i > 40) {
            this.batteryImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.battery2));
        } else if (i > 20) {
            this.batteryImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.battery1));
        } else {
            this.batteryImage.setImageDrawable(this.itemView.getResources().getDrawable(R.drawable.battery0));
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        int id = view.getId();
        if (id != R.id.bleconn) {
            if (id != R.id.blesetting) {
                if (id != R.id.btnDelete) {
                    return;
                }
                Log.e("删除设备", "delete");
                MyApplication.getInstance().deleteItemByMac(this.macAddress);
                return;
            }
            Log.e("设置按钮", this.id + "");
            MyApplication.getInstance().OnItemSettingClick(this.macAddress);
            return;
        }
        Log.e("连接按钮", this.id + "");
        if (this.connBtn.getText() == MyApplication.getInstance().getApplicationContext().getString(R.string.clickConnect) || this.connBtn.getText() == MyApplication.getInstance().getApplicationContext().getString(R.string.un_conn_ble)) {
            Log.e("蓝牙", "连接到设备" + this.id);
            MyApplication.getInstance().ConnectBleByIndexORMac(Integer.valueOf(this.id), null);
            MyApplication.getInstance().setBtnTextById(Integer.valueOf(this.id), MyApplication.getInstance().getApplicationContext().getString(R.string.connecting));
            ProgressDialogUtil.showProgressDialog(DeviceFragment.getInstance().getContext());
            DeviceFragment.getInstance().UpDateOnUIThread();
            return;
        }
        if (this.connBtn.getText() == MyApplication.getInstance().getApplicationContext().getString(R.string.click_alarm)) {
            MyApplication.getInstance().AlarmByAddress(this.macAddress);
        } else if (this.connBtn.getText() == MyApplication.getInstance().getApplicationContext().getString(R.string.cancle_alarm)) {
            MyApplication.getInstance().CancleAlarmByAddress(this.macAddress);
        }
    }
}
