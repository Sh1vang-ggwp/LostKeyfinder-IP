package com.jianjin.camera;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.media.ExifInterface;
import android.os.Build;
import android.os.Environment;
import android.text.format.DateFormat;
import com.jianjin.camera.utils.Logger;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

/* loaded from: classes.dex */
public class SavePicTask extends Thread {
    private static final String TAG = "SavePicTask";
    private byte[] data;
    private boolean isBackCamera;
    private boolean sampleSizeSuggested = false;
    private boolean ioExceptionRetried = false;

    public SavePicTask(byte[] bArr, boolean z) {
        this.data = bArr;
        this.isBackCamera = z;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        super.run();
        saveToSDCard(this.data);
    }

    private boolean saveToSDCard(byte[] bArr) {
        Bitmap rotateBitmapByDegree;
        File externalStoragePublicDirectory = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
        if (externalStoragePublicDirectory == null) {
            return false;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(externalStoragePublicDirectory);
        sb.append(File.separator);
        new DateFormat();
        sb.append(DateFormat.format("yyyyMMddHHmmss", new Date()).toString());
        sb.append(".jpg");
        String sb2 = sb.toString();
        Bitmap decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
        if (this.isBackCamera) {
            rotateBitmapByDegree = rotateBitmapByDegree(decodeByteArray, 90);
        } else {
            rotateBitmapByDegree = rotateBitmapByDegree(decodeByteArray, 270);
        }
        save(rotateBitmapByDegree, sb2);
        setPictureDegreeZero(sb2);
        return false;
    }

    public static Bitmap rotateBitmapByDegree(Bitmap bitmap, int i) {
        Bitmap bitmap2;
        Matrix matrix = new Matrix();
        matrix.postRotate(i);
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

    private void save(Bitmap bitmap, String str) {
        File file = new File(str);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        try {
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file));
            bitmap.compress(Bitmap.CompressFormat.JPEG, 80, bufferedOutputStream);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
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

    private Rect getCropRect(byte[] bArr) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        int i = options.outWidth;
        int i2 = options.outHeight;
        int i3 = i / 2;
        int i4 = i2 / 2;
        Logger.debug(TAG, "width" + i + "height" + i2);
        int i5 = i3 - i4;
        int i6 = i4 - i3;
        int i7 = i3 + i4;
        return new Rect(i5, i6, i7, i7);
    }

    /* JADX WARN: Not initialized variable reg: 3, insn: 0x008e: MOVE (r0 I:??[OBJECT, ARRAY]) = (r3 I:??[OBJECT, ARRAY]), block:B:54:0x008e */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0091 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    private android.graphics.Bitmap findFitBitmap(byte[] r6, android.graphics.Rect r7, int r8) {
        /*
            r5 = this;
            java.lang.System.gc()
            r0 = 0
            r1 = 1
            android.graphics.BitmapFactory$Options r2 = new android.graphics.BitmapFactory$Options     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            r2.<init>()     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            r3 = 0
            r2.inJustDecodeBounds = r3     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            r2.inSampleSize = r8     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            android.graphics.Bitmap$Config r3 = android.graphics.Bitmap.Config.RGB_565     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            r2.inPreferredConfig = r3     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            r2.inPurgeable = r1     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            r2.inInputShareable = r1     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            java.io.ByteArrayInputStream r3 = new java.io.ByteArrayInputStream     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            r3.<init>(r6)     // Catch: java.lang.Throwable -> L33 java.lang.Exception -> L35 java.lang.OutOfMemoryError -> L5a
            android.graphics.Bitmap r2 = decode(r3, r7, r2)     // Catch: java.lang.Exception -> L2f java.lang.OutOfMemoryError -> L31 java.lang.Throwable -> L8d
            boolean r4 = r5.isBackCamera     // Catch: java.lang.Exception -> L2f java.lang.OutOfMemoryError -> L31 java.lang.Throwable -> L8d
            android.graphics.Bitmap r6 = r5.rotateBitmap(r2, r4)     // Catch: java.lang.Exception -> L2f java.lang.OutOfMemoryError -> L31 java.lang.Throwable -> L8d
            r3.close()     // Catch: java.io.IOException -> L2a
            goto L2e
        L2a:
            r7 = move-exception
            r7.printStackTrace()
        L2e:
            return r6
        L2f:
            r2 = move-exception
            goto L37
        L31:
            r0 = move-exception
            goto L5d
        L33:
            r6 = move-exception
            goto L8f
        L35:
            r2 = move-exception
            r3 = r0
        L37:
            r2.printStackTrace()     // Catch: java.lang.Throwable -> L8d
            boolean r2 = r5.ioExceptionRetried     // Catch: java.lang.Throwable -> L8d
            if (r2 != 0) goto L4f
            r5.ioExceptionRetried = r1     // Catch: java.lang.Throwable -> L8d
            android.graphics.Bitmap r6 = r5.findFitBitmap(r6, r7, r8)     // Catch: java.lang.Throwable -> L8d
            if (r3 == 0) goto L4e
            r3.close()     // Catch: java.io.IOException -> L4a
            goto L4e
        L4a:
            r7 = move-exception
            r7.printStackTrace()
        L4e:
            return r6
        L4f:
            if (r3 == 0) goto L59
            r3.close()     // Catch: java.io.IOException -> L55
            goto L59
        L55:
            r6 = move-exception
            r6.printStackTrace()
        L59:
            return r0
        L5a:
            r1 = move-exception
            r3 = r0
            r0 = r1
        L5d:
            r0.printStackTrace()     // Catch: java.lang.Throwable -> L8d
            java.lang.System.gc()     // Catch: java.lang.Throwable -> L8d
            boolean r0 = r5.sampleSizeSuggested     // Catch: java.lang.Throwable -> L8d
            if (r0 == 0) goto L78
            int r8 = r8 * 2
            android.graphics.Bitmap r6 = r5.findFitBitmap(r6, r7, r8)     // Catch: java.lang.Throwable -> L8d
            if (r3 == 0) goto L77
            r3.close()     // Catch: java.io.IOException -> L73
            goto L77
        L73:
            r7 = move-exception
            r7.printStackTrace()
        L77:
            return r6
        L78:
            r8 = 720(0x2d0, float:1.009E-42)
            int r8 = r5.suggestSampleSize(r6, r8)     // Catch: java.lang.Throwable -> L8d
            android.graphics.Bitmap r6 = r5.findFitBitmap(r6, r7, r8)     // Catch: java.lang.Throwable -> L8d
            if (r3 == 0) goto L8c
            r3.close()     // Catch: java.io.IOException -> L88
            goto L8c
        L88:
            r7 = move-exception
            r7.printStackTrace()
        L8c:
            return r6
        L8d:
            r6 = move-exception
            r0 = r3
        L8f:
            if (r0 == 0) goto L99
            r0.close()     // Catch: java.io.IOException -> L95
            goto L99
        L95:
            r7 = move-exception
            r7.printStackTrace()
        L99:
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jianjin.camera.SavePicTask.findFitBitmap(byte[], android.graphics.Rect, int):android.graphics.Bitmap");
    }

    public Bitmap rotateBitmap(Bitmap bitmap, boolean z) {
        System.gc();
        int i = z ? 90 : -90;
        if (bitmap == null) {
            return bitmap;
        }
        Matrix matrix = new Matrix();
        matrix.setRotate(i, bitmap.getWidth() / 2, bitmap.getHeight() / 2);
        if (!z) {
            matrix.postScale(-1.0f, 1.0f, bitmap.getWidth() / 2, bitmap.getHeight() / 2);
        }
        Bitmap createBitmap = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Bitmap.Config.RGB_565);
        new Canvas(createBitmap).drawBitmap(bitmap, matrix, new Paint());
        if (bitmap != null) {
            bitmap.recycle();
        }
        return createBitmap;
    }

    public static boolean saveBitmap(Bitmap bitmap, String str, int i, Bitmap.CompressFormat compressFormat) {
        File file = new File(str);
        try {
            file.createNewFile();
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            bitmap.compress(compressFormat, i, fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Bitmap decode(InputStream inputStream, Rect rect, BitmapFactory.Options options) throws Exception {
        if (Build.VERSION.SDK_INT > 9) {
            return BitmapRegionDecoder.newInstance(inputStream, false).decodeRegion(rect, options);
        }
        Bitmap decodeStream = BitmapFactory.decodeStream(inputStream, null, options);
        Bitmap createBitmap = Bitmap.createBitmap(decodeStream, rect.left, rect.top, rect.width(), rect.height());
        if (decodeStream != null && !decodeStream.isRecycled()) {
            decodeStream.recycle();
        }
        return createBitmap;
    }

    private int suggestSampleSize(byte[] bArr, int i) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        options.inPurgeable = true;
        BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        int i2 = options.outWidth;
        int i3 = options.outHeight;
        int max = Math.max(i2 / i, i3 / i);
        if (max == 0) {
            return 1;
        }
        if (max > 1 && i2 > i && i2 / max < i) {
            max--;
        }
        return (max <= 1 || i3 <= i || i3 / max >= i) ? max : max - 1;
    }
}
