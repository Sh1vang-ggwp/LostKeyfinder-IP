package com.lenzetech.isearchingtwo.application;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanFilter;
import android.bluetooth.le.ScanResult;
import android.bluetooth.le.ScanSettings;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Handler;
import android.os.Message;
import android.os.ParcelUuid;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import androidx.fragment.app.FragmentActivity;
import com.blankj.utilcode.util.ActivityUtils;
import com.blankj.utilcode.util.Utils;
import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import com.jianjin.camera.CustomCameraAgent;
import com.lenzetech.isearchingtwo.Bean.MyBleItem;
import com.lenzetech.isearchingtwo.Bean.ResponseBean;
import com.lenzetech.isearchingtwo.Bean.VerifyDevice;
import com.lenzetech.isearchingtwo.BluetoothMonitorReceiver;
import com.lenzetech.isearchingtwo.MyService;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.CustomDialog;
import com.lenzetech.isearchingtwo.Utils.MediaPlayerTools;
import com.lenzetech.isearchingtwo.Utils.MyLocation;
import com.lenzetech.isearchingtwo.Utils.MyUserSetting;
import com.lenzetech.isearchingtwo.Utils.ProgressDialogUtil;
import com.lenzetech.isearchingtwo.activity.DeviceActivity.BleSettingActivity;
import com.lenzetech.isearchingtwo.dialogevent.DialogEvent;
import com.lenzetech.isearchingtwo.dialogevent.DialogState;
import com.lenzetech.isearchingtwo.dialogevent.EventCallback;
import com.lenzetech.isearchingtwo.fragment.DeviceFragment;
import com.lenzetech.isearchingtwo.permission.BlePermissionHelper;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;
import kotlin.UByte;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.logging.HttpLoggingInterceptor;
import org.greenrobot.eventbus.EventBus;
import org.litepal.LitePal;
import org.litepal.util.Const;

/* loaded from: classes.dex */
public class MyApplication extends Application implements EventCallback {
    private static final String TAG = "MyApplication";
    private static MyApplication myApplication;
    public BlePermissionHelper blePermissionHelper;
    private BluetoothMonitorReceiver bluetoothMonitorReceiver;
    private FragmentActivity context;
    TextView dialog_new_message;
    TextView dialog_new_session;
    BluetoothAdapter mBluetoothAdapter;
    private Dialog mDialog;
    private Dialog mDialog2;
    private EventCallback mEventCallback;
    private Handler mHandler;
    MediaPlayerTools mediaPlayerTools;
    private HashMap<String, DialogInterface> mHashMap = new HashMap<>();
    private HashMap<String, VerifyDevice> verifyDic = new HashMap<>();
    public HashMap<String, MyBleItem> bleItemHashMap = new HashMap<>();
    public HashMap<String, BluetoothDevice> bleDeviceMap = new HashMap<>();
    public HashMap<String, BluetoothGattCharacteristic> bleWrireCharaterMap = new HashMap<>();
    public HashMap<String, BluetoothGatt> bleGattMap = new HashMap<>();
    public HashMap<String, BluetoothGattCharacteristic> bleAlarmWrireCharaterMap = new HashMap<>();
    private BluetoothLeScanner mLeScanner = null;
    private ScanCallback scanCallbackH = new ScanCallback() { // from class: com.lenzetech.isearchingtwo.application.MyApplication.2
        @Override // android.bluetooth.le.ScanCallback
        public void onScanResult(int i, ScanResult scanResult) {
            super.onScanResult(i, scanResult);
            if (scanResult.getDevice().getName() == null) {
                return;
            }
            byte[] bytes = scanResult.getScanRecord().getBytes();
            Log.e("发现设备", "" + scanResult.getDevice().getName());
            boolean z = false;
            for (int i2 = 0; i2 < bytes.length; i2++) {
                Log.e("发现设备" + i2, "" + ((int) scanResult.getScanRecord().getBytes()[i2]));
            }
            if ((bytes[6] != 3 || bytes[7] != 25) && bytes[9] == 5 && bytes[10] == 1) {
                z = true;
            }
            MyApplication.this.OnMyDeviceFound(scanResult.getDevice(), Boolean.valueOf(z));
            VerifyDevice verifyDevice = new VerifyDevice();
            verifyDevice.setDeviceName(scanResult.getDevice().getName());
            verifyDevice.setDeviceMac(scanResult.getDevice().getAddress());
            verifyDevice.setDeviceAdvInfo(MyApplication.bytesToHex(scanResult.getScanRecord().getBytes()));
            verifyDevice.setAppVersion(MyApplication.getVersionName(MyApplication.this.context));
            MyApplication.this.verifyDic.put(scanResult.getDevice().getAddress(), verifyDevice);
            Log.e("发现设备", "" + scanResult.getDevice().getName());
        }
    };
    BluetoothStateReceiver mBluetoothStateReceiver = new BluetoothStateReceiver();
    private MyBleItem myBleItem = null;

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        Utils.init((Application) this);
        setEventCallbackZ(this);
        LitePal.initialize(this);
        MyUserSetting.getInstance().InitUserSetting();
        myApplication = this;
        this.mHandler = new Handler(getMainLooper()) { // from class: com.lenzetech.isearchingtwo.application.MyApplication.1
            @Override // android.os.Handler
            public void handleMessage(Message message) {
            }
        };
        Log.e("MyApplication代码启动了！", "MyApplication代码启动了！");
        CustomCameraAgent.init(this);
        LoadFromDisk();
        if (Build.VERSION.SDK_INT < 26) {
            startService(new Intent(this, (Class<?>) MyService.class));
        }
        this.bluetoothMonitorReceiver = new BluetoothMonitorReceiver();
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        registerReceiver(this.bluetoothMonitorReceiver, intentFilter);
    }

    public void initByCloseBl() {
        this.bleItemHashMap = new HashMap<>();
        this.bleDeviceMap = new HashMap<>();
        this.bleWrireCharaterMap = new HashMap<>();
        this.bleGattMap = new HashMap<>();
        this.bleAlarmWrireCharaterMap = new HashMap<>();
        LoadFromDisk();
    }

    public void LoadFromDisk() {
        List findAll = LitePal.findAll(MyBleItem.class, new long[0]);
        Log.e("LoadFromDisk从本地开始加载设备", findAll.size() + "");
        for (int i = 0; i < findAll.size(); i++) {
            if (this.bleItemHashMap.containsKey(((MyBleItem) findAll.get(i)).getAddresss())) {
                Log.e("LoadFromDisk", i + "设备列表中存在");
            } else {
                Log.e("LoadFromDisk", i + "设备列表中不存在，添加到显示列表");
                this.bleItemHashMap.put(((MyBleItem) findAll.get(i)).getAddresss(), (MyBleItem) findAll.get(i));
                MyBleItem myBleItem = this.bleItemHashMap.get(((MyBleItem) findAll.get(i)).getAddresss());
                myBleItem.setBtnShowText(getString(R.string.un_conn_ble));
                myBleItem.setConnect(false);
                myBleItem.setMine(true);
            }
            DeviceFragment.getInstance().UpDateOnUIThread();
        }
    }

    public static MyApplication getInstance() {
        return myApplication;
    }

    public void InitBle(FragmentActivity fragmentActivity) {
        this.context = fragmentActivity;
        BlePermissionHelper blePermissionHelper = new BlePermissionHelper((Activity) fragmentActivity);
        this.blePermissionHelper = blePermissionHelper;
        if (!blePermissionHelper.isSupportBLE()) {
            Toast.makeText(fragmentActivity, R.string.no_bl_tips, 1).show();
            return;
        }
        this.mBluetoothAdapter = ((BluetoothManager) fragmentActivity.getApplicationContext().getSystemService("bluetooth")).getAdapter();
        if (Build.VERSION.SDK_INT >= 21) {
            this.mLeScanner = this.mBluetoothAdapter.getBluetoothLeScanner();
        }
        if (this.mBluetoothAdapter.isEnabled()) {
            Log.e("蓝牙", "设备开启蓝牙");
            startDiscovery();
        } else {
            Log.e("蓝牙", "设备没有开启蓝牙");
            this.blePermissionHelper.checkNOpenBl();
        }
    }

    public void ChangeBLeItemSetting(String str, String str2, Boolean bool, Integer num, byte[] bArr) {
        Log.e("修改", "开始修改设备设置");
        MyBleItem myBleItem = this.bleItemHashMap.get(str);
        if (this.bleItemHashMap.keySet().contains(str)) {
            Log.e("修改成功，获取到设备", "222");
        } else {
            Log.e("修改失败，设备为空", "333");
        }
        if (str2 != null) {
            myBleItem.setBleNickName(str2);
            myBleItem.save();
        }
        if (bArr != null) {
            myBleItem.setImageByte(bArr);
            myBleItem.save();
        }
        if (bool != null) {
            myBleItem.setAlarmOnDisconnect(bool.booleanValue());
            myBleItem.save();
        }
        if (num != null) {
            myBleItem.setRingIndex(num);
            myBleItem.save();
        }
        DeviceFragment.getInstance().UpDateOnUIThread();
    }

    public static String getVersionName(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String bytesToHex(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bArr) {
            String hexString = Integer.toHexString(b & UByte.MAX_VALUE);
            if (hexString.length() == 1) {
                sb.append('0');
            }
            sb.append(hexString);
        }
        return sb.toString();
    }

    public void startDiscovery() {
        if (!this.blePermissionHelper.checkNOpenGps() || !this.blePermissionHelper.checkNOpenBl()) {
            Log.e(TAG, "scan fail");
            return;
        }
        if (this.mBluetoothAdapter == null) {
            Log.e("蓝牙", "蓝牙搜索失败");
            return;
        }
        Log.e("蓝牙", "开始搜索蓝牙");
        if (this.mBluetoothAdapter.isDiscovering()) {
            return;
        }
        if (this.bleItemHashMap.size() > 0) {
            ArrayList arrayList = new ArrayList(this.bleItemHashMap.keySet());
            for (int i = 0; i < arrayList.size(); i++) {
                if (!this.bleItemHashMap.get(arrayList.get(i)).isMine()) {
                    this.bleItemHashMap.remove(arrayList.get(i));
                }
            }
        }
        DeviceFragment.getInstance().UpDateOnUIThread();
        if (this.mBluetoothAdapter.isEnabled()) {
            Log.e("蓝牙", "开始扫描");
            ArrayList arrayList2 = new ArrayList();
            ScanFilter.Builder builder = new ScanFilter.Builder();
            builder.setServiceUuid(ParcelUuid.fromString("0000ffe0-0000-1000-8000-00805f9b34fb"));
            final ScanFilter build = builder.build();
            arrayList2.add(build);
            ScanSettings.Builder builder2 = new ScanSettings.Builder();
            builder2.setScanMode(2);
            if (Build.VERSION.SDK_INT >= 23) {
                builder2.setMatchMode(1);
            }
            if (Build.VERSION.SDK_INT >= 23) {
                builder2.setCallbackType(1);
            }
            if (Build.VERSION.SDK_INT >= 26) {
                builder2.setLegacy(true);
            }
            final ScanSettings build2 = builder2.build();
            new Handler().postDelayed(new Runnable() { // from class: com.lenzetech.isearchingtwo.application.MyApplication.3
                @Override // java.lang.Runnable
                public void run() {
                    Log.e("蓝牙", "开始扫描");
                    MyApplication.this.mLeScanner.startScan(Collections.singletonList(build), build2, MyApplication.this.scanCallbackH);
                }
            }, 200L);
            Log.e("扫描", "扫描一段时间后停止");
            new Handler().postDelayed(new Runnable() { // from class: com.lenzetech.isearchingtwo.application.MyApplication.4
                @Override // java.lang.Runnable
                public void run() {
                    Log.e("蓝牙", "停止扫描");
                    MyApplication.this.mLeScanner.stopScan(MyApplication.this.scanCallbackH);
                }
            }, 5000L);
        }
    }

    public void OnMyDeviceFound(BluetoothDevice bluetoothDevice, Boolean bool) {
        this.bleDeviceMap.put(bluetoothDevice.getAddress(), bluetoothDevice);
        if (this.bleItemHashMap.containsKey(bluetoothDevice.getAddress())) {
            if (this.bleItemHashMap.get(bluetoothDevice.getAddress()).getBtnShowText().equals(getString(R.string.un_conn_ble))) {
                this.bleItemHashMap.get(bluetoothDevice.getAddress()).setBtnShowText(getString(R.string.clickConnect));
                if (this.bleItemHashMap.get(bluetoothDevice.getAddress()).isMine()) {
                    Log.e("发现我们的设备，", "连接到我的设备");
                    ConnectBleByIndexORMac(null, bluetoothDevice.getAddress());
                    this.bleItemHashMap.get(bluetoothDevice.getAddress()).setBtnShowText(getString(R.string.connecting));
                } else {
                    Log.e("发现我们的设222备，", "连接到我的222设备");
                }
                DeviceFragment.getInstance().UpDateOnUIThread();
                Log.e("刷新设备1", "设备存在");
                return;
            }
            Log.e("刷新设备2", this.bleItemHashMap.get(bluetoothDevice.getAddress()).getBtnShowText());
            return;
        }
        if (this.bleItemHashMap.size() >= 8) {
            return;
        }
        MyBleItem myBleItem = new MyBleItem();
        String trim = Pattern.compile(" [\n`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。， 、？] 0").matcher(bluetoothDevice.getName()).replaceAll(" ").trim();
        myBleItem.setBleNickName(trim);
        Log.d(TAG, "OnMyDeviceFound123: " + trim);
        myBleItem.setAddresss(bluetoothDevice.getAddress());
        myBleItem.setBtnShowText(getString(R.string.un_conn_ble));
        myBleItem.setImageByte(null);
        if (bool.booleanValue()) {
            myBleItem.setHasBattery(bool);
        }
        this.bleItemHashMap.put(bluetoothDevice.getAddress(), myBleItem);
        DeviceFragment.getInstance().UpDateOnUIThread();
    }

    public MyBleItem getBleItemByid(Integer num) {
        return (MyBleItem) this.bleItemHashMap.values().toArray()[num.intValue()];
    }

    public void setBtnTextById(Integer num, String str) {
        ((MyBleItem) this.bleItemHashMap.values().toArray()[num.intValue()]).setBtnShowText(str);
        DeviceFragment.getInstance().UpDateOnUIThread();
    }

    public void SetBtnTextByAddress(String str, String str2) {
        this.bleItemHashMap.get(str).setBtnShowText(str2);
        DeviceFragment.getInstance().UpDateOnUIThread();
    }

    public void onDeviceSucceedWrite(String str) {
        String btnShowText = this.bleItemHashMap.get(str).getBtnShowText();
        if (btnShowText.equals(getString(R.string.cancle_alarm))) {
            this.bleItemHashMap.get(str).setBtnShowText(getString(R.string.click_alarm));
        } else if (btnShowText.equals(getString(R.string.click_alarm))) {
            this.bleItemHashMap.get(str).setBtnShowText(getString(R.string.cancle_alarm));
        }
        DeviceFragment.getInstance().UpDateOnUIThread();
    }

    public void AlarmByAddress(String str) {
        Log.e("开始报警1", "开始报警" + str);
        if (this.bleGattMap.containsKey(str) && this.bleGattMap.containsKey(str)) {
            Log.e("开始报警2", "开始报警" + str);
            Log.e("开始报警4", "开始报警" + str);
            this.bleWrireCharaterMap.get(str).setValue(new byte[]{1});
            Log.e("开始报警5", "开始报警" + str);
            this.bleGattMap.get(str).writeCharacteristic(this.bleWrireCharaterMap.get(str));
            return;
        }
        Log.e("开始报警3", "开始报警" + str);
    }

    public void CancleAlarmByAddress(String str) {
        Log.e("开始报警1", "开始报警" + str);
        if (this.bleGattMap.containsKey(str)) {
            Log.e("开始报警2", "开始报警" + str);
            Log.e("开始报警4", "开始报警" + str);
            this.bleWrireCharaterMap.get(str).setValue(new byte[]{0});
            Log.e("开始报警5", "开始报警" + str);
            this.bleGattMap.get(str).writeCharacteristic(this.bleWrireCharaterMap.get(str));
            return;
        }
        Log.e("开始报警3", "开始报警" + str);
    }

    public void SetDeviceISAlarm(String str, boolean z) {
        Log.e("设置断开是否报警", "设置断开是否报警" + str);
        if (!this.bleAlarmWrireCharaterMap.containsKey(str)) {
            Log.e("设置断开是否报警", "设置断开是否报警" + str);
            return;
        }
        Log.e("设置断开是否报警", "设置断开是否报警" + str);
        if (z) {
            Log.e("设置断开是否报警:断开报警", "设置断开是否报警" + str);
            this.bleAlarmWrireCharaterMap.get(str).setValue(new byte[]{1});
        } else {
            Log.e("设置断开是否报警:不报警", "设置断开是否报警" + str);
            this.bleAlarmWrireCharaterMap.get(str).setValue(new byte[]{0});
        }
        Log.e("设置断开是否报警", "设置断开是否报警OK" + str);
        if (this.bleGattMap.containsKey(str)) {
            this.bleGattMap.get(str).writeCharacteristic(this.bleAlarmWrireCharaterMap.get(str));
        }
    }

    public void SetIsAlarmingByMac(String str, Boolean bool) {
        if (str == null || !this.bleItemHashMap.containsKey(str)) {
            return;
        }
        this.bleItemHashMap.get(str).setAlarming(bool.booleanValue());
    }

    public void OnItemSettingClick(String str) {
        if (str == null) {
            Log.e("蓝牙", "mac地址为空，不进行设置" + str);
            return;
        }
        if (this.bleItemHashMap.containsKey(str) && this.bleItemHashMap.get(str).isConnect()) {
            Intent intent = new Intent(getApplicationContext(), (Class<?>) BleSettingActivity.class);
            intent.putExtra("mac", str);
            intent.addFlags(268435456);
            startActivity(intent);
        }
    }

    public MyBleItem getBleItemByMac(String str) {
        return this.bleItemHashMap.get(str);
    }

    public void deleteItemByMac(String str) {
        this.bleItemHashMap.get(str).delete();
        this.bleItemHashMap.remove(str);
        if (this.bleGattMap.containsKey(str)) {
            this.bleGattMap.get(str).disconnect();
            this.bleGattMap.remove(str);
        }
        LoadFromDisk();
        DeviceFragment.getInstance().UpDateOnUIThread();
    }

    public void ConnectBleByIndexORMac(Integer num, String str) {
        BluetoothDevice bluetoothDevice;
        if (num != null) {
            Log.e("蓝牙bluetoothDevice1", "更新bluetoothDevice");
            bluetoothDevice = this.bleDeviceMap.get(((MyBleItem) this.bleItemHashMap.values().toArray()[num.intValue()]).getAddresss());
        } else if (str != null) {
            Log.e("蓝牙bluetoothDevice2", "更新bluetoothDevice");
            this.bleItemHashMap.get(str);
            bluetoothDevice = this.bleDeviceMap.get(str);
        } else {
            bluetoothDevice = null;
        }
        if (bluetoothDevice == null) {
            Log.e("蓝牙bluetoothDevice3", "更新bluetoothDevice");
        } else {
            Log.e("蓝牙bluetoothDevice", "更新bluetoothDevice");
            bluetoothDevice.connectGatt(getApplicationContext(), false, new BluetoothGattCallback() { // from class: com.lenzetech.isearchingtwo.application.MyApplication.5
                @Override // android.bluetooth.BluetoothGattCallback
                public void onPhyUpdate(BluetoothGatt bluetoothGatt, int i, int i2, int i3) {
                    super.onPhyUpdate(bluetoothGatt, i, i2, i3);
                    Log.e("蓝牙", "更新");
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onPhyRead(BluetoothGatt bluetoothGatt, int i, int i2, int i3) {
                    super.onPhyRead(bluetoothGatt, i, i2, i3);
                    Log.e("蓝牙", "阅读");
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onConnectionStateChange(BluetoothGatt bluetoothGatt, int i, int i2) {
                    super.onConnectionStateChange(bluetoothGatt, i, i2);
                    Log.d(MyApplication.TAG, "onConnectionStateChange: status=" + i);
                    if (i2 != 0) {
                        if (i2 != 2) {
                            return;
                        }
                        Log.e("蓝牙", "已经连接 开始发现服务" + i2);
                        bluetoothGatt.discoverServices();
                        ProgressDialogUtil.dismiss();
                        MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).setMine(true);
                        MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).save();
                        MyApplication.this.sendDialogEvent(new DialogEvent(DialogState.DIALOG_DISMISS, bluetoothGatt.getDevice().getAddress()));
                        return;
                    }
                    Log.e("蓝牙", "设备断开连接" + i2);
                    if (MyApplication.this.bleItemHashMap.containsKey(bluetoothGatt.getDevice().getAddress())) {
                        MyApplication.this.ConnectBleByIndexORMac(null, bluetoothGatt.getDevice().getAddress());
                        if (MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).isConnect()) {
                            if (MyApplication.this.bleItemHashMap.containsKey(bluetoothGatt.getDevice().getAddress())) {
                                MyApplication.this.sendDialogEvent(new DialogEvent(DialogState.DIALOG_SHOW, bluetoothGatt.getDevice().getAddress()));
                            }
                            MyApplication.this.SetBtnTextByAddress(bluetoothGatt.getDevice().getAddress(), MyApplication.getInstance().getApplicationContext().getString(R.string.disconn_ble));
                            ProgressDialogUtil.dismiss();
                            MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).setConnect(false);
                            Log.e("设备连接成功，设置报警为fals", "");
                            MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).setAlarming(true);
                            DeviceFragment.getInstance().UpDateOnUIThread();
                            MyLocation.getInstance().getCurrentLocation(MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).getBleNickName(), MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).getAddresss());
                            if (!MyApplication.this.getBleItemByMac(bluetoothGatt.getDevice().getAddress()).isAlarmOnDisconnect()) {
                                Log.e("断开不报警，不报警", "");
                                return;
                            }
                            if (!MyUserSetting.getInstance().shouleWifiSettingAlarm()) {
                                Log.e("Wifi判断在WIFI勿扰模式下，不报警", "");
                            } else if (!MyUserSetting.getInstance().showTimeAlarm()) {
                                Log.e("时间判断在勿扰时间内 不报警", "");
                            } else {
                                MediaPlayerTools.getInstance().PlaySound(bluetoothGatt.getDevice().getAddress());
                            }
                        }
                    }
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onServicesDiscovered(BluetoothGatt bluetoothGatt, int i) {
                    super.onServicesDiscovered(bluetoothGatt, i);
                    Log.e("蓝牙", "发现服务完毕:" + i);
                    if (i == 0) {
                        Log.e("蓝牙", "蓝牙连接到服务");
                        String str2 = "";
                        for (BluetoothGattService bluetoothGattService : bluetoothGatt.getServices()) {
                            Log.e("蓝牙", "服务uuid" + bluetoothGattService.getUuid().toString());
                            for (BluetoothGattCharacteristic bluetoothGattCharacteristic : bluetoothGattService.getCharacteristics()) {
                                Log.e("蓝牙", "特征值uuid" + bluetoothGattCharacteristic.getUuid().toString());
                                String str3 = "";
                                for (int i2 = 0; i2 < bluetoothGattCharacteristic.getDescriptors().size(); i2++) {
                                    str3 = str3 + " Descriptors UUID:" + bluetoothGattCharacteristic.getDescriptors().get(i2).getUuid().toString() + " Descriptors Value" + Arrays.toString(bluetoothGattCharacteristic.getDescriptors().get(i2).getValue());
                                }
                                str2 = str2 + "ServerUUID:" + bluetoothGattService.getUuid().toString() + " CharaUUID:" + bluetoothGattCharacteristic.getUuid().toString() + " CharaProperities:" + bluetoothGattCharacteristic.getProperties() + ":" + str3;
                                if (bluetoothGattCharacteristic.getUuid().toString().equals("00002a06-0000-1000-8000-00805f9b34fb")) {
                                    Log.d("蓝牙", "防丢器要响了");
                                    MyApplication.this.bleGattMap.put(bluetoothGatt.getDevice().getAddress(), bluetoothGatt);
                                    MyApplication.this.bleWrireCharaterMap.put(bluetoothGatt.getDevice().getAddress(), bluetoothGattCharacteristic);
                                    MyApplication.this.UPDATERssi();
                                } else if (bluetoothGattCharacteristic.getUuid().toString().equals("0000ffe1-0000-1000-8000-00805f9b34fb")) {
                                    bluetoothGatt.setCharacteristicNotification(bluetoothGattCharacteristic, true);
                                    Log.e("蓝牙" + bluetoothGatt.getDevice().getName(), "发现FFE1-" + bluetoothGattCharacteristic.getStringValue(1));
                                } else if (bluetoothGattCharacteristic.getUuid().toString().equals("0000ffe2-0000-1000-8000-00805f9b34fb")) {
                                    Log.d("蓝牙", "发现写入服务的Chara");
                                    MyApplication.this.bleAlarmWrireCharaterMap.put(bluetoothGatt.getDevice().getAddress(), bluetoothGattCharacteristic);
                                    if (MyApplication.this.bleItemHashMap.containsKey(bluetoothGatt.getDevice().getAddress())) {
                                        MyApplication.this.SetDeviceISAlarm(bluetoothGatt.getDevice().getAddress(), MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).isAlarmOnDisconnect());
                                    } else {
                                        MyApplication.this.SetDeviceISAlarm(bluetoothGatt.getDevice().getAddress(), false);
                                    }
                                } else if (bluetoothGattCharacteristic.getUuid().toString().equals("00002a19-0000-1000-8000-00805f9b34fb")) {
                                    Log.e("读取电量信息", "蓝牙");
                                    bluetoothGatt.readCharacteristic(bluetoothGattCharacteristic);
                                }
                                Log.e("打印特征", str2);
                            }
                        }
                        final VerifyDevice verifyDevice = (VerifyDevice) MyApplication.this.verifyDic.get(bluetoothGatt.getDevice().getAddress());
                        verifyDevice.setDeviceCharacterInfo(str2);
                        new OkHttpClient.Builder().addInterceptor(new HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BODY)).build().newCall(new Request.Builder().url("http://47.122.0.200:1234/fdqverify/Index/androidLogin").post(new FormBody.Builder().add(Const.TableSchema.COLUMN_NAME, verifyDevice.getDeviceName()).add("adv", verifyDevice.getDeviceAdvInfo()).add("mac", verifyDevice.getDeviceMac()).add("charc", verifyDevice.getDeviceCharacterInfo()).add("appv", verifyDevice.getAppVersion()).build()).build()).enqueue(new Callback() { // from class: com.lenzetech.isearchingtwo.application.MyApplication.5.1
                            @Override // okhttp3.Callback
                            public void onFailure(Call call, IOException iOException) {
                                iOException.printStackTrace();
                                Log.e("onFailure", "fail");
                            }

                            @Override // okhttp3.Callback
                            public void onResponse(Call call, Response response) throws IOException {
                                String string = response.body().string();
                                Log.e("onResponse", string);
                                Gson gson = new Gson();
                                try {
                                    new JsonParser().parse(string);
                                    ResponseBean responseBean = (ResponseBean) gson.fromJson(string, ResponseBean.class);
                                    Log.e("responseBean == ", String.valueOf(responseBean.getVerify()));
                                    if (responseBean.getVerify().booleanValue()) {
                                        return;
                                    }
                                    EventBus.getDefault().post(new MessageEvent(EventType.DEVICE_VERIFY, null, responseBean, verifyDevice.getDeviceMac()));
                                } catch (JsonSyntaxException unused) {
                                    Log.e("JsonSyntaxException", "解析错误");
                                }
                            }
                        });
                        MyApplication.this.SetBtnTextByAddress(bluetoothGatt.getDevice().getAddress(), MyApplication.getInstance().getApplicationContext().getString(R.string.click_alarm));
                        MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).setConnect(true);
                        MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).setAlarming(false);
                        MyApplication.this.SetBtnTextByAddress(bluetoothGatt.getDevice().getAddress(), MyApplication.getInstance().getApplicationContext().getString(R.string.click_alarm));
                        MediaPlayerTools.getInstance().Pause();
                        DeviceFragment.getInstance().UpDateOnUIThread();
                        return;
                    }
                    Log.e("发现服务失败", "服务失败");
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onCharacteristicRead(BluetoothGatt bluetoothGatt, BluetoothGattCharacteristic bluetoothGattCharacteristic, int i) {
                    super.onCharacteristicRead(bluetoothGatt, bluetoothGattCharacteristic, i);
                    if (bluetoothGattCharacteristic.getValue() == null || bluetoothGattCharacteristic.getValue().length < 1) {
                        return;
                    }
                    byte b = bluetoothGattCharacteristic.getValue()[0];
                    MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).setBattery(Integer.valueOf(b));
                    Log.e("蓝牙", "设置电量" + ((int) b));
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onCharacteristicWrite(BluetoothGatt bluetoothGatt, BluetoothGattCharacteristic bluetoothGattCharacteristic, int i) {
                    super.onCharacteristicWrite(bluetoothGatt, bluetoothGattCharacteristic, i);
                    Log.e("蓝牙", "写入");
                    MyApplication.this.onDeviceSucceedWrite(bluetoothGatt.getDevice().getAddress());
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onCharacteristicChanged(BluetoothGatt bluetoothGatt, BluetoothGattCharacteristic bluetoothGattCharacteristic) {
                    super.onCharacteristicChanged(bluetoothGatt, bluetoothGattCharacteristic);
                    if (bluetoothGattCharacteristic.getUuid().toString().equals("0000ffe1-0000-1000-8000-00805f9b34fb")) {
                        byte[] value = bluetoothGattCharacteristic.getValue();
                        for (int i = 0; i < value.length; i++) {
                            Log.e("蓝牙" + i, "获取到按键" + ((int) value[i]));
                        }
                        if (value.length <= 0 || value[0] != 1) {
                            return;
                        }
                        Log.e(bluetoothGattCharacteristic.getUuid().toString(), bluetoothGattCharacteristic.getValue().toString());
                        Log.e("蓝牙特征值" + bluetoothGattCharacteristic.getUuid().toString(), "改变");
                        MediaPlayerTools.getInstance().OnFDQClick(bluetoothGatt.getDevice().getAddress());
                    }
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onDescriptorRead(BluetoothGatt bluetoothGatt, BluetoothGattDescriptor bluetoothGattDescriptor, int i) {
                    super.onDescriptorRead(bluetoothGatt, bluetoothGattDescriptor, i);
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onDescriptorWrite(BluetoothGatt bluetoothGatt, BluetoothGattDescriptor bluetoothGattDescriptor, int i) {
                    super.onDescriptorWrite(bluetoothGatt, bluetoothGattDescriptor, i);
                    Log.e("蓝牙", "描述");
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onReliableWriteCompleted(BluetoothGatt bluetoothGatt, int i) {
                    super.onReliableWriteCompleted(bluetoothGatt, i);
                    Log.e("蓝牙", "可读");
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onReadRemoteRssi(BluetoothGatt bluetoothGatt, int i, int i2) {
                    super.onReadRemoteRssi(bluetoothGatt, i, i2);
                    if (MyApplication.this.bleItemHashMap.containsKey(bluetoothGatt.getDevice().getAddress())) {
                        Log.e("bleItemHashMap设置", "信号" + i);
                        MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).setRssi(Integer.valueOf(i));
                        MyApplication.this.bleItemHashMap.get(bluetoothGatt.getDevice().getAddress()).save();
                        MyApplication.this.bleItemHashMap.containsKey(bluetoothGatt.getDevice().getAddress());
                    }
                }

                @Override // android.bluetooth.BluetoothGattCallback
                public void onMtuChanged(BluetoothGatt bluetoothGatt, int i, int i2) {
                    super.onMtuChanged(bluetoothGatt, i, i2);
                    Log.e("蓝牙", "Mtu改变");
                }
            });
        }
    }

    public boolean isWifi() {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) getApplicationContext().getSystemService("connectivity")).getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.getType() == 1;
    }

    public void UPDATERssi() {
        for (String str : this.bleGattMap.keySet()) {
            Log.e(str, "设备信息");
            this.bleGattMap.get(str).readRemoteRssi();
            DeviceFragment.getInstance().UpDateOnUIThread();
        }
    }

    public void setEventCallbackZ(EventCallback eventCallback) {
        this.mEventCallback = eventCallback;
    }

    private class BluetoothStateReceiver extends BroadcastReceiver {
        private BluetoothStateReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            Log.d("hello", "BluetoothStateReceiver onReceive: " + intent.toString());
            if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction()) && intent.getIntExtra("android.bluetooth.adapter.extra.STATE", -1) == 12) {
                MyApplication.getInstance().startDiscovery();
            }
        }
    }

    private void registerReceiver() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        registerReceiver(this.mBluetoothStateReceiver, intentFilter);
    }

    private void unregisterReceiver() {
        unregisterReceiver(this.mBluetoothStateReceiver);
    }

    public void sendDialogEvent(final DialogEvent dialogEvent) {
        this.mHandler.post(new Runnable() { // from class: com.lenzetech.isearchingtwo.application.MyApplication.6
            @Override // java.lang.Runnable
            public void run() {
                if (MyApplication.this.mEventCallback != null) {
                    MyApplication.this.mEventCallback.onEvent(dialogEvent);
                }
            }
        });
    }

    @Override // com.lenzetech.isearchingtwo.dialogevent.EventCallback
    public void onEvent(DialogEvent dialogEvent) {
        if (dialogEvent.getmDialogState() == DialogState.DIALOG_DISMISS) {
            Log.d(TAG, "onEvent: DialogState.DIALOG_DISMISS");
            if (dialogEvent.isDoubleClick()) {
                Dialog dialog = this.mDialog2;
                if (dialog != null) {
                    dialog.dismiss();
                    this.mDialog2 = null;
                    return;
                }
                return;
            }
            Dialog dialog2 = this.mDialog;
            if (dialog2 != null) {
                dialog2.dismiss();
                this.mDialog = null;
                return;
            }
            return;
        }
        if (dialogEvent.getmDialogState() == DialogState.DIALOG_SHOW) {
            if (dialogEvent.isDoubleClick()) {
                if (this.mDialog2 == null) {
                    this.mDialog2 = dialogbledoubleclick(dialogEvent.getAddress());
                } else {
                    Log.d(TAG, "onEvent: mDialog2不做处理");
                }
            } else if (this.mDialog == null) {
                this.mDialog = dialogbleconnect(dialogEvent.getAddress());
            } else {
                Log.d(TAG, "onEvent: 不做处理");
            }
            Log.d(TAG, "onEvent: DialogState.DIALOG_SHOW ");
        }
    }

    public Dialog dialogbleconnect(String str) {
        String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ").format(new Date(System.currentTimeMillis()));
        CustomDialog build = new CustomDialog.Builder(ActivityUtils.getTopActivity()).style(R.style.Dialog).cancelTouchout(false).widthdp(300).heightdp(430).view(R.layout.dialog).build();
        build.addViewOnclick(R.id.dialog_btn_set_now, new DialogClick(build) { // from class: com.lenzetech.isearchingtwo.application.MyApplication.7
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (view.getId() != R.id.dialog_btn_set_now) {
                    return;
                }
                this.mDialogInterface.dismiss();
                if (MediaPlayerTools.getInstance().isPlaying) {
                    MediaPlayerTools.getInstance().Pause();
                }
                MyApplication.this.mDialog = null;
            }
        });
        build.show();
        build.setCancelable(false);
        String bleNickName = this.bleItemHashMap.containsKey(str) ? this.bleItemHashMap.get(str).getBleNickName() : "iTAG";
        TextView textView = (TextView) build.findViewById(R.id.dialog_new_session);
        this.dialog_new_session = textView;
        textView.setText(bleNickName + " " + getString(R.string.devices_disconnect));
        TextView textView2 = (TextView) build.findViewById(R.id.dialog_new_message);
        this.dialog_new_message = textView2;
        textView2.setText(format);
        return build;
    }

    public static abstract class DialogClick implements View.OnClickListener {
        DialogInterface mDialogInterface;

        public DialogClick(DialogInterface dialogInterface) {
            this.mDialogInterface = dialogInterface;
        }
    }

    public Dialog dialogbledoubleclick(String str) {
        String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ").format(new Date(System.currentTimeMillis()));
        CustomDialog build = new CustomDialog.Builder(ActivityUtils.getTopActivity()).style(R.style.Dialog).cancelTouchout(false).widthdp(300).heightdp(430).view(R.layout.dialog).build();
        build.addViewOnclick(R.id.dialog_btn_set_now, new DialogClick(build) { // from class: com.lenzetech.isearchingtwo.application.MyApplication.8
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (view.getId() != R.id.dialog_btn_set_now) {
                    return;
                }
                this.mDialogInterface.dismiss();
                MyApplication.this.mDialog2 = null;
                MediaPlayerTools.getInstance().Pause();
            }
        });
        build.show();
        build.setCancelable(false);
        String bleNickName = this.bleItemHashMap.containsKey(str) ? this.bleItemHashMap.get(str).getBleNickName() : "iTAG";
        TextView textView = (TextView) build.findViewById(R.id.dialog_new_session);
        this.dialog_new_session = textView;
        textView.setText(bleNickName + " " + getString(R.string.devices_doubleclick_dialog));
        TextView textView2 = (TextView) build.findViewById(R.id.dialog_new_message);
        this.dialog_new_message = textView2;
        textView2.setText(format);
        return build;
    }
}
