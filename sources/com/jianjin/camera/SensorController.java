package com.jianjin.camera;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import com.jianjin.camera.utils.Logger;
import java.util.Calendar;

/* loaded from: classes.dex */
public class SensorController implements IActivityLifeCycle, SensorEventListener {
    public static final int DELAY_DURATION = 500;
    public static final int STATUS_MOVE = 2;
    public static final int STATUS_NONE = 0;
    public static final int STATUS_STATIC = 1;
    public static final String TAG = "SensorController";
    private static SensorController mInstance;
    Calendar mCalendar;
    private CameraFocusListener mCameraFocusListener;
    private Sensor mSensor;
    private SensorManager mSensorManager;
    private int mX;
    private int mY;
    private int mZ;
    private long lastStaticStamp = 0;
    boolean isFocusing = false;
    boolean canFocusIn = false;
    boolean canFocus = false;
    private int STATUE = 0;
    private int focusing = 1;

    public interface CameraFocusListener {
        void onFocus();
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    private SensorController(Context context) {
        SensorManager sensorManager = (SensorManager) context.getSystemService("sensor");
        this.mSensorManager = sensorManager;
        this.mSensor = sensorManager.getDefaultSensor(1);
    }

    public static SensorController getInstance() {
        if (mInstance == null) {
            mInstance = new SensorController(CustomCameraAgent.mContext);
        }
        return mInstance;
    }

    public void setCameraFocusListener(CameraFocusListener cameraFocusListener) {
        this.mCameraFocusListener = cameraFocusListener;
    }

    @Override // com.jianjin.camera.IActivityLifeCycle
    public void onStart() {
        restParams();
        this.canFocus = true;
        this.mSensorManager.registerListener(this, this.mSensor, 3);
    }

    @Override // com.jianjin.camera.IActivityLifeCycle
    public void onStop() {
        this.mSensorManager.unregisterListener(this, this.mSensor);
        this.canFocus = false;
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent sensorEvent) {
        if (sensorEvent.sensor == null) {
            return;
        }
        if (this.isFocusing) {
            restParams();
            return;
        }
        if (sensorEvent.sensor.getType() == 1) {
            int i = (int) sensorEvent.values[0];
            int i2 = (int) sensorEvent.values[1];
            int i3 = (int) sensorEvent.values[2];
            Calendar calendar = Calendar.getInstance();
            this.mCalendar = calendar;
            long timeInMillis = calendar.getTimeInMillis();
            this.mCalendar.get(13);
            if (this.STATUE != 0) {
                int abs = Math.abs(this.mX - i);
                int abs2 = Math.abs(this.mY - i2);
                int abs3 = Math.abs(this.mZ - i3);
                if (Math.sqrt((abs * abs) + (abs2 * abs2) + (abs3 * abs3)) > 1.4d) {
                    this.STATUE = 2;
                } else {
                    if (this.STATUE == 2) {
                        this.lastStaticStamp = timeInMillis;
                        this.canFocusIn = true;
                    }
                    if (this.canFocusIn && timeInMillis - this.lastStaticStamp > 500 && !this.isFocusing) {
                        this.canFocusIn = false;
                        CameraFocusListener cameraFocusListener = this.mCameraFocusListener;
                        if (cameraFocusListener != null) {
                            cameraFocusListener.onFocus();
                        }
                    }
                    this.STATUE = 1;
                }
            } else {
                this.lastStaticStamp = timeInMillis;
                this.STATUE = 1;
            }
            this.mX = i;
            this.mY = i2;
            this.mZ = i3;
        }
    }

    private void restParams() {
        this.STATUE = 0;
        this.canFocusIn = false;
        this.mX = 0;
        this.mY = 0;
        this.mZ = 0;
    }

    public boolean isFocusLocked() {
        return this.canFocus && this.focusing <= 0;
    }

    public void lockFocus() {
        this.isFocusing = true;
        this.focusing--;
        Logger.info(TAG, "lockFocus");
    }

    public void unlockFocus() {
        this.isFocusing = false;
        this.focusing++;
        Logger.info(TAG, "unlockFocus");
    }

    public void restFocus() {
        this.focusing = 1;
    }
}
