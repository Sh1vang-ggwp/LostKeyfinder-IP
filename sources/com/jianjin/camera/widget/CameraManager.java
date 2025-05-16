package com.jianjin.camera.widget;

import android.content.Context;
import android.hardware.Camera;
import android.os.Build;
import android.widget.TextView;
import com.jianjin.camera.CameraDirection;
import com.jianjin.camera.FlashLightStatus;
import com.jianjin.camera.utils.Logger;
import com.jianjin.camera.widget.PreviewLightCallback;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* loaded from: classes.dex */
public class CameraManager {
    private static final int ALLOW_PIC_LEN = 2000;
    private static final String TAG = "CameraManager";
    public static List<FlashLightStatus> mFlashLightNotSupport = new ArrayList();
    private static CameraManager mInstance;
    private String[] cameraDireHint;
    private String[] flashHint;
    private Context mContext;
    private TextView mTvCameraDirection;
    private TextView mTvFlashLight;
    private PreviewLightCallback previewLightCallback;
    private FlashLightStatus mFlashLightStatus = FlashLightStatus.valueOf(FlashLightStatus.LIGHT_OFF.ordinal());
    private CameraDirection mCameraDirection = CameraDirection.valueOf(CameraDirection.CAMERA_BACK.ordinal());

    public static CameraManager getInstance(Context context) {
        if (mInstance == null) {
            synchronized (CameraManager.class) {
                if (mInstance == null) {
                    mInstance = new CameraManager(context);
                }
            }
        }
        return mInstance;
    }

    private CameraManager(Context context) {
        this.mContext = context;
    }

    public void bindOptionMenuView(TextView textView, TextView textView2, String[] strArr, String[] strArr2) {
        this.mTvFlashLight = textView;
        this.mTvCameraDirection = textView2;
        this.flashHint = strArr;
        this.cameraDireHint = strArr2;
        setFlashLightStatus(getFlashLightStatus());
        setCameraDirection(getCameraDirection());
    }

    public void unbindView() {
        this.mTvFlashLight = null;
        this.mTvCameraDirection = null;
    }

    void setCameraDirection(CameraDirection cameraDirection) {
        this.mCameraDirection = cameraDirection;
        TextView textView = this.mTvCameraDirection;
        if (textView != null) {
            String[] strArr = this.cameraDireHint;
            if (strArr != null) {
                textView.setText(strArr[cameraDirection.ordinal()]);
            }
            this.mTvCameraDirection.setSelected(cameraDirection == CameraDirection.CAMERA_FRONT);
            TextView textView2 = this.mTvFlashLight;
            if (textView2 != null) {
                textView2.setVisibility(cameraDirection != CameraDirection.CAMERA_BACK ? 8 : 0);
            }
        }
    }

    CameraDirection getCameraDirection() {
        return this.mCameraDirection;
    }

    void setFlashLightStatus(FlashLightStatus flashLightStatus) {
        this.mFlashLightStatus = flashLightStatus;
        TextView textView = this.mTvFlashLight;
        if (textView != null) {
            String[] strArr = this.flashHint;
            if (strArr != null) {
                textView.setText(strArr[flashLightStatus.ordinal()]);
            }
            this.mTvFlashLight.setSelected(flashLightStatus == FlashLightStatus.LIGHT_ON);
        }
    }

    FlashLightStatus getFlashLightStatus() {
        return this.mFlashLightStatus;
    }

    Camera openCamera(int i) {
        Camera camera;
        if (checkCameraHardware(this.mContext)) {
            camera = Camera.open(getCameraId(i));
            setPreviewLight(camera);
        } else {
            camera = null;
        }
        mFlashLightNotSupport.clear();
        if (camera != null) {
            List<String> supportedFlashModes = camera.getParameters().getSupportedFlashModes();
            if (i == 0 && supportedFlashModes != null && !supportedFlashModes.contains("on")) {
                mFlashLightNotSupport.add(FlashLightStatus.LIGHT_ON);
            }
        }
        Logger.info(TAG, "相机初始化open");
        return camera;
    }

    private int getCameraId(int i) {
        int numberOfCameras = Camera.getNumberOfCameras();
        Camera.CameraInfo cameraInfo = new Camera.CameraInfo();
        for (int i2 = 0; i2 < numberOfCameras; i2++) {
            Camera.getCameraInfo(i2, cameraInfo);
            if (cameraInfo.facing == i) {
                return i2;
            }
        }
        return -1;
    }

    private boolean checkCameraHardware(Context context) {
        return context.getPackageManager().hasSystemFeature("android.hardware.camera");
    }

    void setPreviewLight(Camera camera) {
        if (this.mTvFlashLight != null && this.previewLightCallback == null) {
            this.previewLightCallback = new PreviewLightCallback(this, new PreviewLightCallback.OnCameraLightCallback() { // from class: com.jianjin.camera.widget.CameraManager.1
                @Override // com.jianjin.camera.widget.PreviewLightCallback.OnCameraLightCallback
                public void cameraLight(boolean z) {
                    if (CameraManager.this.getCameraDirection() == CameraDirection.CAMERA_BACK) {
                        if (z || CameraManager.this.getFlashLightStatus() == FlashLightStatus.LIGHT_ON) {
                            if (CameraManager.this.mTvFlashLight.getVisibility() != 0) {
                                CameraManager.this.mTvFlashLight.setVisibility(0);
                            }
                        } else if (CameraManager.this.mTvFlashLight.getVisibility() != 8) {
                            CameraManager.this.mTvFlashLight.setVisibility(8);
                        }
                    }
                }
            });
        }
        camera.setPreviewCallback(this.previewLightCallback);
    }

    void releaseCamera(Camera camera) {
        if (camera != null) {
            try {
                camera.setPreviewCallback(null);
                camera.setPreviewCallbackWithBuffer(null);
                camera.stopPreview();
                camera.release();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void setUpPicSize(Camera camera) {
        Camera.Parameters parameters = camera.getParameters();
        try {
            Camera.Size findBestResolution = findBestResolution(camera, 1.0d, 1);
            parameters.setPictureSize(findBestResolution.width, findBestResolution.height);
            camera.setParameters(parameters);
            Logger.info(TAG, "setUpPicSize:" + findBestResolution.width + "*" + findBestResolution.height);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setUpPreviewSize(Camera camera) {
        Camera.Parameters parameters = camera.getParameters();
        try {
            Camera.Size findBestResolution = findBestResolution(camera, 1.0d, 0);
            parameters.setPreviewSize(findBestResolution.width, findBestResolution.height);
            camera.setParameters(parameters);
            Logger.info(TAG, "setUpPreviewSize:" + findBestResolution.width + "*" + findBestResolution.height);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void setFitPicSize(Camera camera, float f) {
        Camera.Parameters parameters = camera.getParameters();
        try {
            Camera.Size findFitPicResolution = findFitPicResolution(camera, f);
            parameters.setPictureSize(findFitPicResolution.width, findFitPicResolution.height);
            camera.setParameters(parameters);
            Logger.info(TAG, "setFitPicSize:" + findFitPicResolution.width + "*" + findFitPicResolution.height);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void setFitPreSize(Camera camera) {
        Camera.Parameters parameters = camera.getParameters();
        try {
            Camera.Size findFitPreResolution = findFitPreResolution(camera);
            parameters.setPreviewSize(findFitPreResolution.width, findFitPreResolution.height);
            camera.setParameters(parameters);
            Logger.info(TAG, "setFitPreSize:" + findFitPreResolution.width + "*" + findFitPreResolution.height);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Camera.Size findBestResolution(Camera camera, double d, int i) throws Exception {
        Camera.Parameters parameters = camera.getParameters();
        List<Camera.Size> supportedPreviewSizes = i == 0 ? parameters.getSupportedPreviewSizes() : parameters.getSupportedPictureSizes();
        StringBuilder sb = new StringBuilder();
        for (Camera.Size size : supportedPreviewSizes) {
            sb.append(size.width);
            sb.append('x');
            sb.append(size.height);
            sb.append(" ");
        }
        String str = TAG;
        Logger.debug(str, "Supported picture resolutions: " + ((Object) sb));
        Camera.Size pictureSize = parameters.getPictureSize();
        Logger.debug(str, "default picture resolution " + pictureSize.width + "x" + pictureSize.height);
        ArrayList arrayList = new ArrayList(supportedPreviewSizes);
        Collections.sort(arrayList, new Comparator<Camera.Size>() { // from class: com.jianjin.camera.widget.CameraManager.2
            @Override // java.util.Comparator
            public int compare(Camera.Size size2, Camera.Size size3) {
                return Math.abs((size2.width / size2.height) - 1) <= Math.abs((size3.width / size2.height) - 1) ? -1 : 1;
            }
        });
        return (Camera.Size) arrayList.get(0);
    }

    private Camera.Size findFitPicResolution(Camera camera, float f) throws Exception {
        List<Camera.Size> supportedPictureSizes = camera.getParameters().getSupportedPictureSizes();
        Camera.Size size = null;
        for (Camera.Size size2 : supportedPictureSizes) {
            if (size2.width / size2.height == f && size2.width <= ALLOW_PIC_LEN && size2.height <= ALLOW_PIC_LEN && (size == null || size2.width > size.width)) {
                size = size2;
            }
        }
        return size == null ? supportedPictureSizes.get(0) : size;
    }

    private Camera.Size findFitPreResolution(Camera camera) throws Exception {
        List<Camera.Size> supportedPreviewSizes = camera.getParameters().getSupportedPreviewSizes();
        Camera.Size size = null;
        for (Camera.Size size2 : supportedPreviewSizes) {
            if (size2.width <= ALLOW_PIC_LEN && (size == null || size2.width > size.width)) {
                size = size2;
            }
        }
        return size == null ? supportedPreviewSizes.get(0) : size;
    }

    private void setDisplay(Camera camera) {
        if (Build.VERSION.SDK_INT >= 14) {
            camera.setDisplayOrientation(90);
        } else if (Build.VERSION.SDK_INT >= 8) {
            setDisplayOrientation(camera, 90);
        }
    }

    private void setDisplayOrientation(Camera camera, int i) {
        try {
            Method method = camera.getClass().getMethod("setDisplayOrientation", Integer.TYPE);
            if (method != null) {
                method.invoke(camera, Integer.valueOf(i));
            }
        } catch (Exception unused) {
            Logger.error(TAG, "图像出错");
        }
    }
}
