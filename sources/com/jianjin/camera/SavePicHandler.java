package com.jianjin.camera;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.media.ExifInterface;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.format.DateFormat;
import com.jianjin.camera.utils.Consts;
import com.jianjin.camera.utils.FileUtils;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

/* loaded from: classes.dex */
public class SavePicHandler extends Handler {
    private static final String TAG = "SavePicHandler";
    private byte[] data;
    private Handler handler;
    private boolean ioExceptionRetried;
    private boolean isBackCamera;
    private boolean sampleSizeSuggested;

    public SavePicHandler(Looper looper, Handler handler, byte[] bArr, boolean z) {
        super(looper);
        this.handler = handler;
        this.sampleSizeSuggested = false;
        this.ioExceptionRetried = false;
        this.data = bArr;
        this.isBackCamera = z;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        super.handleMessage(message);
        String saveToSDCard = saveToSDCard(this.data);
        Message obtain = Message.obtain();
        if (saveToSDCard == null) {
            obtain.what = -1;
        } else {
            obtain.what = 1;
            Bundle bundle = new Bundle();
            bundle.putString(Consts.SAVE_IMG_PATH, saveToSDCard);
            obtain.setData(bundle);
        }
        this.handler.sendMessage(obtain);
    }

    private String saveToSDCard(byte[] bArr) {
        if (Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES) == null) {
            return null;
        }
        String photoPathForLockWallPaper = FileUtils.getPhotoPathForLockWallPaper();
        StringBuilder sb = new StringBuilder();
        sb.append(photoPathForLockWallPaper);
        sb.append(File.separator);
        new DateFormat();
        sb.append(DateFormat.format("yyyyMMddHHmmss", new Date()).toString());
        sb.append(".jpg");
        String sb2 = sb.toString();
        if (!save(rotateReversalBitmap(BitmapFactory.decodeByteArray(bArr, 0, bArr.length), this.isBackCamera), sb2)) {
            return null;
        }
        setPictureDegreeZero(sb2);
        return sb2;
    }

    public static Bitmap rotateReversalBitmap(Bitmap bitmap, boolean z) {
        Bitmap bitmap2;
        Matrix matrix = new Matrix();
        matrix.postRotate(z ? 90.0f : 270.0f);
        if (!z) {
            matrix.postScale(-1.0f, 1.0f);
        }
        try {
            bitmap2 = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
        } catch (OutOfMemoryError unused) {
            bitmap2 = null;
        }
        if (bitmap2 == null) {
            bitmap2 = bitmap;
        }
        if (bitmap != bitmap2) {
            bitmap.recycle();
        }
        return bitmap2;
    }

    private boolean save(Bitmap bitmap, String str) {
        File file = new File(str);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        BufferedOutputStream bufferedOutputStream = null;
        try {
            try {
                BufferedOutputStream bufferedOutputStream2 = new BufferedOutputStream(new FileOutputStream(file));
                try {
                    bitmap.compress(Bitmap.CompressFormat.JPEG, 80, bufferedOutputStream2);
                    try {
                        bufferedOutputStream2.flush();
                        bufferedOutputStream2.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    return true;
                } catch (Exception e2) {
                    e = e2;
                    bufferedOutputStream = bufferedOutputStream2;
                    e.printStackTrace();
                    if (bufferedOutputStream != null) {
                        try {
                            bufferedOutputStream.flush();
                            bufferedOutputStream.close();
                        } catch (IOException e3) {
                            e3.printStackTrace();
                        }
                    }
                    return false;
                } catch (Throwable th) {
                    th = th;
                    bufferedOutputStream = bufferedOutputStream2;
                    if (bufferedOutputStream != null) {
                        try {
                            bufferedOutputStream.flush();
                            bufferedOutputStream.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                        }
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception e5) {
            e = e5;
        }
    }

    private void setPictureDegreeZero(String str) {
        try {
            ExifInterface exifInterface = new ExifInterface(str);
            if (this.isBackCamera) {
                exifInterface.setAttribute(androidx.exifinterface.media.ExifInterface.TAG_ORIENTATION, "ExifInterface.ORIENTATION_ROTATE_90");
            } else {
                exifInterface.setAttribute(androidx.exifinterface.media.ExifInterface.TAG_ORIENTATION, "ExifInterface.ORIENTATION_ROTATE_270");
            }
            exifInterface.saveAttributes();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
