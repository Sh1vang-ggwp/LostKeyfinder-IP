package com.jianjin.camera;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.provider.MediaStore;
import com.jianjin.camera.utils.Consts;
import com.jianjin.camera.utils.Logger;
import com.jianjin.camera.widget.CameraContainer;
import com.jianjin.camera.widget.ISavePicCallback;
import java.lang.ref.SoftReference;

/* loaded from: classes.dex */
public class UIHandler extends Handler {
    private String TAG = "UIHandler";
    private SoftReference<CameraContainer> softReference;

    public UIHandler(CameraContainer cameraContainer) {
        this.softReference = new SoftReference<>(cameraContainer);
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        Activity activity;
        Bundle data;
        super.handleMessage(message);
        CameraContainer cameraContainer = this.softReference.get();
        if (cameraContainer == null || (activity = cameraContainer.getActivity()) == null || (data = message.getData()) == null) {
            return;
        }
        ISavePicCallback savePicCallback = cameraContainer.getSavePicCallback();
        int i = message.what;
        if (i == -1) {
            if (savePicCallback != null) {
                savePicCallback.saveFailure("失败");
            }
        } else {
            if (i != 1) {
                return;
            }
            Logger.debug(this.TAG, "存储成功，打开第二个界面展示照片");
            String string = data.getString(Consts.SAVE_IMG_PATH);
            if (string.isEmpty()) {
                return;
            }
            insertMediaStore(activity, string);
            if (savePicCallback != null) {
                savePicCallback.saveComplete(string);
            }
        }
    }

    private void insertMediaStore(Activity activity, String str) {
        ContentValues contentValues = new ContentValues();
        ContentResolver contentResolver = activity.getContentResolver();
        contentValues.put("_data", str);
        contentValues.put("title", str.substring(str.lastIndexOf("/") + 1));
        contentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
        contentValues.put("mime_type", "image/jpeg");
        contentResolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues);
    }
}
