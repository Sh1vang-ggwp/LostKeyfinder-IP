package com.lenzetech.isearchingtwo.fragment;

import android.content.Intent;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.camera.core.Camera;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.Preview;
import androidx.camera.lifecycle.ProcessCameraProvider;
import androidx.camera.view.PreviewView;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import com.google.common.util.concurrent.ListenableFuture;
import com.jianjin.camera.utils.UriUtils;
import com.lenzetech.isearchingtwo.Camera.PicActivity;
import com.lenzetech.isearchingtwo.R;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.concurrent.ExecutionException;

/* loaded from: classes.dex */
public class CameraFragment extends Fragment implements View.OnClickListener {
    static final int CAMERA_REQUEST_CODE = 100;
    static CameraFragment cameraFragment;
    private Camera camera;
    private ProcessCameraProvider cameraProvider;
    private ListenableFuture<ProcessCameraProvider> cameraProviderFuture;
    private CheckBox flash;
    private ImageCapture imageCapture;
    private ImageView iv_pic;
    private View mContentView;
    private TextView mSwitch;
    private ImageView mTakePictureBtn;
    private ImageView picture;
    private Preview preview;
    private PreviewView pv;
    private int REQUEST_PICTURE = 2;
    private int lensFacing = 1;

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mContentView = layoutInflater.inflate(R.layout.fragment_camera, viewGroup, false);
        InitCameraView();
        return this.mContentView;
    }

    public static CameraFragment getInstance() {
        CameraFragment cameraFragment2 = cameraFragment;
        return cameraFragment2 != null ? cameraFragment2 : new CameraFragment();
    }

    public CameraFragment() {
        cameraFragment = this;
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        Log.e("生命周期", "onViewCreated");
    }

    public void InitCameraView() {
        initView();
        setListener();
        ListenableFuture<ProcessCameraProvider> processCameraProvider = ProcessCameraProvider.getInstance(requireContext());
        this.cameraProviderFuture = processCameraProvider;
        processCameraProvider.addListener(new Runnable() { // from class: com.lenzetech.isearchingtwo.fragment.CameraFragment$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                CameraFragment.this.m244x2a6bf55c();
            }
        }, ContextCompat.getMainExecutor(requireContext()));
    }

    /* renamed from: lambda$InitCameraView$0$com-lenzetech-isearchingtwo-fragment-CameraFragment, reason: not valid java name */
    /* synthetic */ void m244x2a6bf55c() {
        try {
            this.cameraProvider = this.cameraProviderFuture.get();
            this.preview = new Preview.Builder().build();
            this.imageCapture = new ImageCapture.Builder().setCaptureMode(1).build();
            CameraSelector build = new CameraSelector.Builder().requireLensFacing(this.lensFacing).build();
            this.cameraProvider.unbindAll();
            this.camera = this.cameraProvider.bindToLifecycle(this, build, this.preview, this.imageCapture);
            this.preview.setSurfaceProvider(this.pv.getSurfaceProvider());
        } catch (InterruptedException | ExecutionException unused) {
        }
    }

    private void initView() {
        this.flash = (CheckBox) this.mContentView.findViewById(R.id.cb_light);
        this.picture = (ImageView) this.mContentView.findViewById(R.id.camera_iv_picture);
        this.mSwitch = (TextView) this.mContentView.findViewById(R.id.camera_tv_switch);
        this.mTakePictureBtn = (ImageView) this.mContentView.findViewById(R.id.camera_iv_take);
        this.pv = (PreviewView) this.mContentView.findViewById(R.id.pv);
        this.iv_pic = (ImageView) this.mContentView.findViewById(R.id.iv_pic);
    }

    public void takePhotots() {
        if (Build.VERSION.SDK_INT >= 23) {
            this.picture.setBackgroundColor(requireContext().getColor(R.color.black));
            this.mContentView.postDelayed(new Runnable() { // from class: com.lenzetech.isearchingtwo.fragment.CameraFragment$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    CameraFragment.this.m246x4c3a6b73();
                }
            }, 100L);
        }
        final File file = new File(requireContext().getFilesDir().getAbsolutePath() + "iSearching_" + System.currentTimeMillis() + ".jpg");
        this.imageCapture.m112lambda$takePicture$3$androidxcameracoreImageCapture(new ImageCapture.OutputFileOptions.Builder(file).build(), ContextCompat.getMainExecutor(requireContext()), new ImageCapture.OnImageSavedCallback() { // from class: com.lenzetech.isearchingtwo.fragment.CameraFragment.1
            @Override // androidx.camera.core.ImageCapture.OnImageSavedCallback
            public void onImageSaved(ImageCapture.OutputFileResults outputFileResults) {
                try {
                    MediaStore.Images.Media.insertImage(CameraFragment.this.requireContext().getContentResolver(), file.getAbsolutePath(), (String) null, (String) null);
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                }
                Intent intent = new Intent(CameraFragment.this.getActivity(), (Class<?>) PicActivity.class);
                intent.putExtra("imgUri", file.getAbsolutePath());
                CameraFragment.this.startActivity(intent);
                new Intent("android.intent.action.MEDIA_SHARED");
                CameraFragment.this.picture.setImageBitmap(BitmapFactory.decodeFile(file.getAbsolutePath()));
            }

            @Override // androidx.camera.core.ImageCapture.OnImageSavedCallback
            public void onError(ImageCaptureException imageCaptureException) {
                Log.e("onError", imageCaptureException.toString());
            }
        });
    }

    /* renamed from: lambda$takePhotots$1$com-lenzetech-isearchingtwo-fragment-CameraFragment, reason: not valid java name */
    /* synthetic */ void m246x4c3a6b73() {
        this.iv_pic.setBackground(null);
    }

    private void setListener() {
        this.mTakePictureBtn.setOnClickListener(new View.OnClickListener() { // from class: com.lenzetech.isearchingtwo.fragment.CameraFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CameraFragment.this.takePhotots();
            }
        });
        this.mSwitch.setOnClickListener(new View.OnClickListener() { // from class: com.lenzetech.isearchingtwo.fragment.CameraFragment$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                CameraFragment.this.m245xc3644980(view);
            }
        });
        this.flash.setOnClickListener(new View.OnClickListener() { // from class: com.lenzetech.isearchingtwo.fragment.CameraFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CameraFragment.this.camera.getCameraControl().enableTorch(CameraFragment.this.camera.getCameraInfo().getTorchState().getValue().equals(0));
            }
        });
        this.picture.setOnClickListener(new View.OnClickListener() { // from class: com.lenzetech.isearchingtwo.fragment.CameraFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Intent intent = new Intent("android.intent.action.PICK", MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                CameraFragment cameraFragment2 = CameraFragment.this;
                cameraFragment2.startActivityForResult(intent, cameraFragment2.REQUEST_PICTURE);
            }
        });
    }

    /* renamed from: lambda$setListener$2$com-lenzetech-isearchingtwo-fragment-CameraFragment, reason: not valid java name */
    /* synthetic */ void m245xc3644980(View view) {
        int i = this.lensFacing;
        if (i == 1) {
            this.lensFacing = 0;
            this.flash.setVisibility(4);
        } else if (i == 0) {
            this.lensFacing = 1;
            this.flash.setVisibility(0);
        }
        InitCameraView();
    }

    private void checkPermission() {
        if (ContextCompat.checkSelfPermission(this.mContentView.getContext(), "android.permission.CAMERA") == 0 && ContextCompat.checkSelfPermission(this.mContentView.getContext(), "android.permission.WRITE_EXTERNAL_STORAGE") == 0 && ContextCompat.checkSelfPermission(this.mContentView.getContext(), "android.permission.READ_EXTERNAL_STORAGE") == 0) {
            return;
        }
        if (ActivityCompat.shouldShowRequestPermissionRationale(getActivity(), "android.permission.CAMERA")) {
            ActivityCompat.requestPermissions(getActivity(), new String[]{"android.permission.CAMERA", "android.permission.WRITE_EXTERNAL_STORAGE", "android.permission.READ_EXTERNAL_STORAGE"}, 100);
        } else {
            ActivityCompat.requestPermissions(getActivity(), new String[]{"android.permission.CAMERA", "android.permission.WRITE_EXTERNAL_STORAGE", "android.permission.READ_EXTERNAL_STORAGE"}, 100);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        if (iArr[0] == 0 && iArr[1] == 0) {
            int i2 = iArr[2];
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        if (i2 == -1) {
            try {
                Uri data = intent.getData();
                int i3 = Build.VERSION.SDK_INT;
                if (data != null) {
                    Intent intent2 = new Intent(getActivity(), (Class<?>) PicActivity.class);
                    intent2.putExtra("imgUri", UriUtils.getPath(getActivity(), data));
                    startActivity(intent2);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        InitCameraView();
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
    }

    public void releaseCamera() {
        ProcessCameraProvider processCameraProvider = this.cameraProvider;
        if (processCameraProvider != null) {
            processCameraProvider.unbindAll();
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
    }
}
