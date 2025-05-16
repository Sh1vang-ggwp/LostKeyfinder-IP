package com.lenzetech.isearchingtwo.Utils;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.dex */
public class ImageDispose {
    public static byte[] readStream(InputStream inputStream) throws Exception {
        byte[] bArr = new byte[1024];
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        while (true) {
            int read = inputStream.read(bArr);
            if (read != -1) {
                byteArrayOutputStream.write(bArr, 0, read);
            } else {
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                byteArrayOutputStream.close();
                inputStream.close();
                return byteArray;
            }
        }
    }

    public static Bitmap getPicFromBytes(byte[] bArr, BitmapFactory.Options options) {
        if (bArr == null) {
            return null;
        }
        if (options != null) {
            return BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        }
        return BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
    }

    public static Bitmap zoomBitmap(Bitmap bitmap, int i, int i2) {
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Matrix matrix = new Matrix();
        matrix.postScale(i / width, i2 / height);
        return Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true);
    }

    public static byte[] Bitmap2Bytes(Bitmap bitmap) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 10, byteArrayOutputStream);
        return byteArrayOutputStream.toByteArray();
    }

    public static File getFileFromBytes(byte[] bArr, String str) {
        File file;
        BufferedOutputStream bufferedOutputStream = null;
        try {
            try {
                try {
                    file = new File(str);
                    try {
                        BufferedOutputStream bufferedOutputStream2 = new BufferedOutputStream(new FileOutputStream(file));
                        try {
                            bufferedOutputStream2.write(bArr);
                            bufferedOutputStream2.close();
                        } catch (Exception e) {
                            e = e;
                            bufferedOutputStream = bufferedOutputStream2;
                            e.printStackTrace();
                            if (bufferedOutputStream != null) {
                                bufferedOutputStream.close();
                            }
                            return file;
                        } catch (Throwable th) {
                            th = th;
                            bufferedOutputStream = bufferedOutputStream2;
                            if (bufferedOutputStream != null) {
                                try {
                                    bufferedOutputStream.close();
                                } catch (IOException e2) {
                                    e2.printStackTrace();
                                }
                            }
                            throw th;
                        }
                    } catch (Exception e3) {
                        e = e3;
                    }
                } catch (Exception e4) {
                    e = e4;
                    file = null;
                }
            } catch (IOException e5) {
                e5.printStackTrace();
            }
            return file;
        } catch (Throwable th2) {
            th = th2;
        }
    }

    public static Bitmap adjustPhotoRotation(Bitmap bitmap, int i) {
        Matrix matrix = new Matrix();
        matrix.setRotate(i, bitmap.getWidth() / 2.0f, bitmap.getHeight() / 2.0f);
        try {
            return Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
        } catch (OutOfMemoryError unused) {
            return null;
        }
    }

    public static Bitmap centerSquareScaleBitmap(Bitmap bitmap, int i) {
        if (bitmap == null || i <= 0) {
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        if (width <= i || height <= i) {
            return bitmap;
        }
        int max = (Math.max(width, height) * i) / Math.min(width, height);
        int i2 = width > height ? max : i;
        if (width > height) {
            max = i;
        }
        try {
            Bitmap createScaledBitmap = Bitmap.createScaledBitmap(bitmap, i2, max, true);
            Bitmap createBitmap = Bitmap.createBitmap(createScaledBitmap, (i2 - i) / 2, (max - i) / 2, i, i);
            createScaledBitmap.recycle();
            return createBitmap;
        } catch (Exception unused) {
            return null;
        }
    }
}
