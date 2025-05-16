package com.jianjin.camera.widget;

import android.app.Activity;
import android.content.Context;
import android.graphics.Point;
import android.hardware.Camera;
import android.media.SoundPool;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import android.widget.SeekBar;
import com.jianjin.camera.CameraDirection;
import com.jianjin.camera.CustomCameraAgent;
import com.jianjin.camera.IActivityLifeCycle;
import com.jianjin.camera.ICameraOperation;
import com.jianjin.camera.R;
import com.jianjin.camera.SavePicHandler;
import com.jianjin.camera.SensorController;
import com.jianjin.camera.UIHandler;
import com.jianjin.camera.utils.Logger;
import com.jianjin.camera.utils.UIUtils;

/* loaded from: classes.dex */
public class CameraContainer extends FrameLayout implements IActivityLifeCycle, ICameraOperation {
    public static final int RESET_MASK_DELAY = 1000;
    private static final String TAG = "CameraContainer";
    private final Camera.AutoFocusCallback autoFocusCallback;
    private Handler handler;
    private HandlerThread handlerThread;
    private Activity mActivity;
    private CameraPreview mCameraView;
    private Context mContext;
    private FocusImageView mFocusImageView;
    private Handler mHandler;
    private Camera.PictureCallback mPictureCallback;
    private SensorController mSensorController;
    private SoundPool mSoundPool;
    private SeekBar mZoomSeekBar;
    private int mode;
    private final SeekBar.OnSeekBarChangeListener onSeekBarChangeListener;
    private ISavePicCallback savePicCallback;
    private float startDis;

    @Override // com.jianjin.camera.ICameraOperation
    public int getMaxZoom() {
        return 0;
    }

    @Override // com.jianjin.camera.ICameraOperation
    public int getZoom() {
        return 0;
    }

    @Override // com.jianjin.camera.ICameraOperation
    public void setZoom(int i) {
    }

    public CameraContainer(Context context) {
        this(context, null);
    }

    public CameraContainer(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public CameraContainer(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.handler = new UIHandler(this);
        this.mPictureCallback = new Camera.PictureCallback() { // from class: com.jianjin.camera.widget.CameraContainer.4
            @Override // android.hardware.Camera.PictureCallback
            public void onPictureTaken(byte[] bArr, Camera camera) {
                boolean z = true;
                if (CameraContainer.this.mCameraView != null && CameraContainer.this.mCameraView.getCameraId() != CameraDirection.CAMERA_BACK) {
                    z = false;
                }
                Logger.debug(CameraContainer.TAG, "创建线程");
                CameraContainer.this.handlerThread = new HandlerThread("save_picture");
                CameraContainer.this.handlerThread.start();
                new SavePicHandler(CameraContainer.this.handlerThread.getLooper(), CameraContainer.this.handler, bArr, z).sendEmptyMessage(0);
            }
        };
        this.onSeekBarChangeListener = new SeekBar.OnSeekBarChangeListener() { // from class: com.jianjin.camera.widget.CameraContainer.5
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int i2, boolean z) {
                CameraContainer.this.mCameraView.setZoom(i2);
                CameraContainer.this.mHandler.removeCallbacksAndMessages(CameraContainer.this.mZoomSeekBar);
                CameraContainer.this.mHandler.postAtTime(new Runnable() { // from class: com.jianjin.camera.widget.CameraContainer.5.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CameraContainer.this.mZoomSeekBar.setVisibility(8);
                    }
                }, CameraContainer.this.mZoomSeekBar, SystemClock.uptimeMillis() + 2000);
            }
        };
        this.mode = 0;
        this.mHandler = new Handler() { // from class: com.jianjin.camera.widget.CameraContainer.7
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                super.handleMessage(message);
            }
        };
        this.autoFocusCallback = new Camera.AutoFocusCallback() { // from class: com.jianjin.camera.widget.CameraContainer.9
            @Override // android.hardware.Camera.AutoFocusCallback
            public void onAutoFocus(boolean z, Camera camera) {
                if (z) {
                    CameraContainer.this.mFocusImageView.onFocusSuccess();
                } else {
                    CameraContainer.this.mFocusImageView.onFocusFailed();
                }
                CameraContainer.this.mHandler.postDelayed(new Runnable() { // from class: com.jianjin.camera.widget.CameraContainer.9.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CameraContainer.this.mSensorController.unlockFocus();
                    }
                }, 1000L);
            }
        };
        this.mContext = context;
        init();
    }

    private void init() {
        if (!CustomCameraAgent.isInit) {
            throw new IllegalStateException("custom must be init in application");
        }
        inflate(this.mContext, R.layout.custom_camera_container, this);
        this.mCameraView = (CameraPreview) findViewById(R.id.camera_preview);
        this.mFocusImageView = (FocusImageView) findViewById(R.id.iv_focus);
        this.mZoomSeekBar = (SeekBar) findViewById(R.id.seek_zoom);
        SensorController sensorController = SensorController.getInstance();
        this.mSensorController = sensorController;
        sensorController.setCameraFocusListener(new SensorController.CameraFocusListener() { // from class: com.jianjin.camera.widget.CameraContainer.1
            @Override // com.jianjin.camera.SensorController.CameraFocusListener
            public void onFocus() {
                CameraContainer.this.onCameraFocus(new Point(UIUtils.screenWidth / 2, UIUtils.screenHeight / 2));
            }
        });
        this.mCameraView.setOnCameraPrepareListener(new OnCameraPrepareListener() { // from class: com.jianjin.camera.widget.CameraContainer.2
            @Override // com.jianjin.camera.widget.OnCameraPrepareListener
            public void onPrepare(CameraDirection cameraDirection) {
                CameraContainer.this.postDelayed(new Runnable() { // from class: com.jianjin.camera.widget.CameraContainer.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                    }
                }, 1000L);
                CameraContainer.this.mZoomSeekBar.setMax(CameraContainer.this.mCameraView.getMaxZoom());
                if (cameraDirection == CameraDirection.CAMERA_BACK) {
                    CameraContainer.this.mHandler.postDelayed(new Runnable() { // from class: com.jianjin.camera.widget.CameraContainer.2.2
                        @Override // java.lang.Runnable
                        public void run() {
                            CameraContainer.this.onCameraFocus(new Point(UIUtils.screenWidth / 2, UIUtils.screenHeight / 2));
                        }
                    }, 800L);
                }
            }
        });
        this.mCameraView.setSwitchCameraCallBack(new SwitchCameraCallback() { // from class: com.jianjin.camera.widget.CameraContainer.3
            @Override // com.jianjin.camera.widget.SwitchCameraCallback
            public void switchCamera(boolean z) {
                if (z) {
                    CameraContainer.this.mHandler.postDelayed(new Runnable() { // from class: com.jianjin.camera.widget.CameraContainer.3.1
                        @Override // java.lang.Runnable
                        public void run() {
                            CameraContainer.this.onCameraFocus(new Point(UIUtils.screenWidth / 2, UIUtils.screenHeight / 2));
                        }
                    }, 300L);
                }
            }
        });
        this.mCameraView.setPictureCallback(this.mPictureCallback);
        this.mZoomSeekBar.setOnSeekBarChangeListener(this.onSeekBarChangeListener);
    }

    @Override // com.jianjin.camera.IActivityLifeCycle
    public void onStart() {
        this.mSensorController.onStart();
        CameraPreview cameraPreview = this.mCameraView;
        if (cameraPreview != null) {
            cameraPreview.onStart();
        }
        this.mSoundPool = getSoundPool();
    }

    @Override // com.jianjin.camera.IActivityLifeCycle
    public void onStop() {
        this.mSensorController.onStop();
        CameraPreview cameraPreview = this.mCameraView;
        if (cameraPreview != null) {
            cameraPreview.onStop();
        }
        this.mSoundPool.release();
        this.mSoundPool = null;
        HandlerThread handlerThread = this.handlerThread;
        if (handlerThread != null) {
            handlerThread.quit();
        }
    }

    @Override // com.jianjin.camera.ICameraOperation
    public void switchCamera() {
        this.mCameraView.switchCamera();
    }

    @Override // com.jianjin.camera.ICameraOperation
    public boolean takePicture(ISavePicCallback iSavePicCallback) {
        this.savePicCallback = iSavePicCallback;
        boolean takePicture = this.mCameraView.takePicture(iSavePicCallback);
        if (!takePicture) {
            this.mSensorController.unlockFocus();
        }
        return takePicture;
    }

    @Override // com.jianjin.camera.ICameraOperation
    public void switchFlashMode() {
        this.mCameraView.switchFlashMode();
    }

    @Override // com.jianjin.camera.ICameraOperation
    public void releaseCamera() {
        CameraPreview cameraPreview = this.mCameraView;
        if (cameraPreview != null) {
            cameraPreview.releaseCamera();
        }
    }

    public Activity getActivity() {
        return this.mActivity;
    }

    public ISavePicCallback getSavePicCallback() {
        return this.savePicCallback;
    }

    public void bindActivity(Activity activity) {
        this.mActivity = activity;
        CameraPreview cameraPreview = this.mCameraView;
        if (cameraPreview != null) {
            cameraPreview.bindActivity(activity);
        }
    }

    private SoundPool getSoundPool() {
        if (this.mSoundPool == null) {
            this.mSoundPool = new SoundPool(5, 3, 0);
        }
        return this.mSoundPool;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        SeekBar seekBar;
        int action = motionEvent.getAction() & 255;
        if (action == 0) {
            this.mode = 0;
        } else if (action != 1) {
            if (action != 2) {
                if (action != 5 || (seekBar = this.mZoomSeekBar) == null) {
                    return true;
                }
                this.mHandler.removeCallbacksAndMessages(seekBar);
                this.mZoomSeekBar.setVisibility(8);
                this.mode = 1;
                this.startDis = spacing(motionEvent);
            } else {
                if (this.mode != 1 || motionEvent.getPointerCount() < 2) {
                    return true;
                }
                float spacing = spacing(motionEvent);
                int i = (int) ((spacing - this.startDis) / 10.0f);
                if (i >= 1 || i <= -1) {
                    int zoom = this.mCameraView.getZoom() + i;
                    if (zoom > this.mCameraView.getMaxZoom()) {
                        zoom = this.mCameraView.getMaxZoom();
                    }
                    int i2 = zoom >= 0 ? zoom : 0;
                    this.mCameraView.setZoom(i2);
                    this.mZoomSeekBar.setProgress(i2);
                    this.startDis = spacing;
                }
            }
        } else if (this.mode != 1) {
            onCameraFocus(new Point((int) motionEvent.getX(), (int) motionEvent.getY()));
        } else {
            this.mHandler.postAtTime(new Runnable() { // from class: com.jianjin.camera.widget.CameraContainer.6
                @Override // java.lang.Runnable
                public void run() {
                    CameraContainer.this.mZoomSeekBar.setVisibility(8);
                }
            }, this.mZoomSeekBar, SystemClock.uptimeMillis() + 2000);
        }
        return true;
    }

    private float spacing(MotionEvent motionEvent) {
        if (motionEvent == null) {
            return 0.0f;
        }
        float x = motionEvent.getX(0) - motionEvent.getX(1);
        float y = motionEvent.getY(0) - motionEvent.getY(1);
        return (float) Math.sqrt((x * x) + (y * y));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onCameraFocus(Point point) {
        onCameraFocus(point, false);
    }

    private void onCameraFocus(final Point point, boolean z) {
        this.mHandler.postDelayed(new Runnable() { // from class: com.jianjin.camera.widget.CameraContainer.8
            @Override // java.lang.Runnable
            public void run() {
                if (CameraContainer.this.mSensorController.isFocusLocked() || !CameraContainer.this.mCameraView.onFocus(point, CameraContainer.this.autoFocusCallback)) {
                    return;
                }
                CameraContainer.this.mSensorController.lockFocus();
                CameraContainer.this.mFocusImageView.startFocus(point);
            }
        }, z ? 300L : 0L);
    }
}
