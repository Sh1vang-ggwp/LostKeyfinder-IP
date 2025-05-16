package com.jianjin.camera.widget;

import android.app.Activity;
import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.Camera;
import android.os.Build;
import android.util.AttributeSet;
import android.view.OrientationEventListener;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.widget.FrameLayout;
import androidx.core.app.NotificationManagerCompat;
import com.jianjin.camera.CameraDirection;
import com.jianjin.camera.FlashLightStatus;
import com.jianjin.camera.IActivityLifeCycle;
import com.jianjin.camera.ICameraOperation;
import com.jianjin.camera.SensorController;
import com.jianjin.camera.utils.Logger;
import com.jianjin.camera.utils.UIUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class CameraPreview extends SurfaceView implements SurfaceHolder.Callback, ICameraOperation, IActivityLifeCycle {
    private static final String TAG = "SurfaceView";
    private Camera.PictureCallback callback;
    private Activity mActivity;
    private Camera mCamera;
    private CameraDirection mCameraId;
    private CameraManager mCameraManager;
    private Context mContext;
    private int mDisplayOrientation;
    private int mLayoutOrientation;
    private int mOrientation;
    private CameraOrientationListener mOrientationListener;
    private Camera.Parameters mParameters;
    private SensorController mSensorController;
    private SwitchCameraCallback mSwitchCameraCallBack;
    private int mZoom;
    private OnCameraPrepareListener onCameraPrepareListener;

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
    }

    public CameraPreview(Context context) {
        this(context, null);
    }

    public CameraPreview(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public CameraPreview(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mOrientation = 0;
        this.mContext = context;
        CameraManager cameraManager = CameraManager.getInstance(context);
        this.mCameraManager = cameraManager;
        this.mCameraId = cameraManager.getCameraDirection();
        setFocusable(true);
        getHolder().addCallback(this);
        this.mSensorController = SensorController.getInstance();
        CameraOrientationListener cameraOrientationListener = new CameraOrientationListener(this.mContext);
        this.mOrientationListener = cameraOrientationListener;
        cameraOrientationListener.enable();
    }

    public void bindActivity(Activity activity) {
        this.mActivity = activity;
    }

    public void initCamera() {
        Camera.Parameters parameters = this.mCamera.getParameters();
        this.mParameters = parameters;
        parameters.setPictureFormat(256);
        if (this.mParameters.getSupportedFocusModes().contains("auto")) {
            this.mParameters.setFocusMode("auto");
        }
        try {
            this.mCamera.setParameters(this.mParameters);
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.mCameraManager.setFitPreSize(this.mCamera);
        Camera.Size previewSize = this.mCamera.getParameters().getPreviewSize();
        this.mCameraManager.setFitPicSize(this.mCamera, previewSize.width / previewSize.height);
        String str = TAG;
        Logger.info(str, "adpterSize Preview-->width:" + previewSize.width + "  height:" + previewSize.height);
        Camera.Size pictureSize = this.mCamera.getParameters().getPictureSize();
        Logger.info(str, "adpterSize Picture-->width:" + pictureSize.width + "  height:" + pictureSize.height);
        adjustView(pictureSize);
        determineDisplayOrientation();
        this.mCamera.startPreview();
        turnLight(this.mCameraManager.getFlashLightStatus());
    }

    private void adjustView(Camera.Size size) {
        int i = UIUtils.screenWidth;
        int i2 = (size.width * i) / size.height;
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) getLayoutParams();
        layoutParams.width = i;
        layoutParams.height = i2;
        setLayoutParams(layoutParams);
    }

    private void turnLight(FlashLightStatus flashLightStatus) {
        if (CameraManager.mFlashLightNotSupport.contains(flashLightStatus)) {
            turnLight(flashLightStatus.next());
            return;
        }
        Camera camera = this.mCamera;
        if (camera == null || camera.getParameters() == null || this.mCamera.getParameters().getSupportedFlashModes() == null) {
            return;
        }
        Camera.Parameters parameters = this.mCamera.getParameters();
        List<String> supportedFlashModes = this.mCamera.getParameters().getSupportedFlashModes();
        int i = AnonymousClass2.$SwitchMap$com$jianjin$camera$FlashLightStatus[flashLightStatus.ordinal()];
        if (i == 1) {
            parameters.setFlashMode("off");
        } else if (i == 2) {
            if (supportedFlashModes.contains("torch")) {
                parameters.setFlashMode("torch");
            } else if (supportedFlashModes.contains("off")) {
                parameters.setFlashMode("off");
            }
        }
        this.mCamera.setParameters(parameters);
        this.mCameraManager.setFlashLightStatus(flashLightStatus);
    }

    /* renamed from: com.jianjin.camera.widget.CameraPreview$2, reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$jianjin$camera$FlashLightStatus;

        static {
            int[] iArr = new int[FlashLightStatus.values().length];
            $SwitchMap$com$jianjin$camera$FlashLightStatus = iArr;
            try {
                iArr[FlashLightStatus.LIGHT_OFF.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$jianjin$camera$FlashLightStatus[FlashLightStatus.LIGHT_ON.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    private void determineDisplayOrientation() {
        int i;
        if (this.mActivity == null) {
            throw new IllegalStateException("please bind activity");
        }
        Camera.CameraInfo cameraInfo = new Camera.CameraInfo();
        Camera.getCameraInfo(this.mCameraId.ordinal(), cameraInfo);
        int rotation = this.mActivity.getWindowManager().getDefaultDisplay().getRotation();
        int i2 = 0;
        if (rotation != 0) {
            if (rotation == 1) {
                i2 = 90;
            } else if (rotation == 2) {
                i2 = 180;
            } else if (rotation == 3) {
                i2 = 270;
            }
        }
        if (cameraInfo.facing == 1) {
            i = (360 - ((cameraInfo.orientation + i2) % 360)) % 360;
        } else {
            i = ((cameraInfo.orientation - i2) + 360) % 360;
        }
        this.mDisplayOrientation = ((cameraInfo.orientation - i2) + 360) % 360;
        this.mLayoutOrientation = i2;
        this.mCamera.setDisplayOrientation(i);
        Logger.info(TAG, "displayOrientation:" + i);
    }

    public void setOnCameraPrepareListener(OnCameraPrepareListener onCameraPrepareListener) {
        this.onCameraPrepareListener = onCameraPrepareListener;
    }

    public void setPictureCallback(Camera.PictureCallback pictureCallback) {
        this.callback = pictureCallback;
    }

    public void setSwitchCameraCallBack(SwitchCameraCallback switchCameraCallback) {
        this.mSwitchCameraCallBack = switchCameraCallback;
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        Logger.info(TAG, "surfaceCreated");
        if (this.mCamera == null) {
            setUpCamera(this.mCameraId, false);
            OnCameraPrepareListener onCameraPrepareListener = this.onCameraPrepareListener;
            if (onCameraPrepareListener != null) {
                onCameraPrepareListener.onPrepare(this.mCameraId);
            }
            if (this.mCamera != null) {
                startOrientationChangeListener();
            }
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        try {
            releaseCamera();
            if (surfaceHolder == null || Build.VERSION.SDK_INT < 14) {
                return;
            }
            surfaceHolder.getSurface().release();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override // com.jianjin.camera.IActivityLifeCycle
    public void onStart() {
        this.mOrientationListener.enable();
        Camera camera = this.mCamera;
        if (camera != null) {
            this.mCameraManager.setPreviewLight(camera);
            this.mCamera.startPreview();
        }
    }

    @Override // com.jianjin.camera.IActivityLifeCycle
    public void onStop() {
        this.mOrientationListener.disable();
        Camera camera = this.mCamera;
        if (camera != null) {
            camera.setPreviewCallback(null);
            this.mCamera.setPreviewCallbackWithBuffer(null);
            this.mCamera.stopPreview();
        }
    }

    @Override // com.jianjin.camera.ICameraOperation
    public void switchCamera() {
        this.mCameraId = this.mCameraId.next();
        releaseCamera();
        CameraDirection cameraDirection = this.mCameraId;
        setUpCamera(cameraDirection, cameraDirection == CameraDirection.CAMERA_BACK);
    }

    @Override // com.jianjin.camera.ICameraOperation
    public boolean takePicture(ISavePicCallback iSavePicCallback) {
        try {
            this.mSensorController.lockFocus();
            this.mCamera.takePicture(null, null, this.callback);
            this.mOrientationListener.rememberOrientation();
            return true;
        } catch (Throwable th) {
            th.printStackTrace();
            Logger.info(TAG, "photo fail after Photo Clicked");
            return false;
        }
    }

    @Override // com.jianjin.camera.ICameraOperation
    public void switchFlashMode() {
        turnLight(this.mCameraManager.getFlashLightStatus().next());
    }

    @Override // com.jianjin.camera.ICameraOperation
    public int getMaxZoom() {
        Camera camera = this.mCamera;
        if (camera == null) {
            return -1;
        }
        Camera.Parameters parameters = camera.getParameters();
        if (!parameters.isZoomSupported()) {
            return -1;
        }
        if (parameters.getMaxZoom() > 40) {
            return 40;
        }
        return parameters.getMaxZoom();
    }

    @Override // com.jianjin.camera.ICameraOperation
    public void setZoom(int i) {
        Camera.Parameters parameters = this.mCamera.getParameters();
        if (parameters.isZoomSupported()) {
            parameters.setZoom(i);
            this.mCamera.setParameters(parameters);
            this.mZoom = i;
        }
    }

    @Override // com.jianjin.camera.ICameraOperation
    public int getZoom() {
        return this.mZoom;
    }

    @Override // com.jianjin.camera.ICameraOperation
    public void releaseCamera() {
        this.mCameraManager.releaseCamera(this.mCamera);
        this.mCamera = null;
    }

    public CameraDirection getCameraId() {
        return this.mCameraId;
    }

    private void startOrientationChangeListener() {
        new OrientationEventListener(getContext()) { // from class: com.jianjin.camera.widget.CameraPreview.1
            @Override // android.view.OrientationEventListener
            public void onOrientationChanged(int i) {
                int i2 = 0;
                if ((i < 0 || i > 45) && i <= 315) {
                    if (i > 45 && i <= 135) {
                        i2 = 90;
                    } else if (i > 135 && i <= 225) {
                        i2 = 180;
                    } else if (i > 225 && i <= 315) {
                        i2 = 270;
                    }
                }
                if (i2 == CameraPreview.this.mOrientation) {
                    return;
                }
                CameraPreview.this.mOrientation = i2;
            }
        }.enable();
    }

    private void setUpCamera(CameraDirection cameraDirection, boolean z) {
        try {
            this.mCamera = this.mCameraManager.openCamera(cameraDirection.ordinal());
            this.mSensorController.restFocus();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Camera camera = this.mCamera;
        if (camera != null) {
            try {
                camera.setPreviewDisplay(getHolder());
                initCamera();
                this.mCameraManager.setCameraDirection(cameraDirection);
                if (cameraDirection == CameraDirection.CAMERA_FRONT) {
                    this.mSensorController.lockFocus();
                } else {
                    this.mSensorController.unlockFocus();
                }
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
        SwitchCameraCallback switchCameraCallback = this.mSwitchCameraCallBack;
        if (switchCameraCallback != null) {
            switchCameraCallback.switchCamera(z);
        }
    }

    public int getPicRotation() {
        return ((this.mDisplayOrientation + this.mOrientationListener.getRememberedNormalOrientation()) + this.mLayoutOrientation) % 360;
    }

    private class CameraOrientationListener extends OrientationEventListener {
        private int mCurrentNormalizedOrientation;
        private int mRememberedNormalOrientation;

        public CameraOrientationListener(Context context) {
            super(context, 3);
        }

        @Override // android.view.OrientationEventListener
        public void onOrientationChanged(int i) {
            if (i != -1) {
                this.mCurrentNormalizedOrientation = normalize(i);
            }
        }

        private int normalize(int i) {
            if (i > 315 || i <= 45) {
                return 0;
            }
            if (i > 45 && i <= 135) {
                return 90;
            }
            if (i > 135 && i <= 225) {
                return 180;
            }
            if (i <= 225 || i > 315) {
                throw new RuntimeException("The physics as we know them are no more. Watch out for anomalies.");
            }
            return 270;
        }

        public void rememberOrientation() {
            this.mRememberedNormalOrientation = this.mCurrentNormalizedOrientation;
        }

        public int getRememberedNormalOrientation() {
            return this.mRememberedNormalOrientation;
        }
    }

    protected boolean onFocus(Point point, Camera.AutoFocusCallback autoFocusCallback) {
        Camera camera = this.mCamera;
        if (camera == null) {
            return false;
        }
        try {
            Camera.Parameters parameters = camera.getParameters();
            if (Build.VERSION.SDK_INT >= 14) {
                if (parameters.getMaxNumFocusAreas() <= 0) {
                    return focus(autoFocusCallback);
                }
                Logger.info(TAG, "onCameraFocus:" + point.x + "," + point.y);
                ArrayList arrayList = new ArrayList();
                int i = point.x + (-300);
                int i2 = point.y + (-300);
                int i3 = point.x + 300;
                int i4 = point.y + 300;
                if (i < -1000) {
                    i = NotificationManagerCompat.IMPORTANCE_UNSPECIFIED;
                }
                if (i2 < -1000) {
                    i2 = NotificationManagerCompat.IMPORTANCE_UNSPECIFIED;
                }
                if (i3 > 1000) {
                    i3 = 1000;
                }
                if (i4 > 1000) {
                    i4 = 1000;
                }
                arrayList.add(new Camera.Area(new Rect(i, i2, i3, i4), 100));
                parameters.setFocusAreas(arrayList);
                try {
                    this.mCamera.setParameters(parameters);
                } catch (Exception e) {
                    e.printStackTrace();
                    return false;
                }
            }
            return focus(autoFocusCallback);
        } catch (Exception e2) {
            e2.printStackTrace();
            return false;
        }
    }

    private boolean focus(Camera.AutoFocusCallback autoFocusCallback) {
        try {
            this.mCamera.autoFocus(autoFocusCallback);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
