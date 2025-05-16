package com.lenzetech.isearchingtwo.Utils;

import android.media.MediaPlayer;
import android.util.Log;
import com.lenzetech.isearchingtwo.AudioToolsUtils.MyRecorder;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList;
import com.lenzetech.isearchingtwo.application.MyApplication;
import com.lenzetech.isearchingtwo.dialogevent.DialogEvent;
import com.lenzetech.isearchingtwo.dialogevent.DialogState;
import com.lenzetech.isearchingtwo.fragment.CameraFragment;
import com.lenzetech.isearchingtwo.fragment.DeviceFragment;

/* loaded from: classes.dex */
public class MediaPlayerTools {
    private static MediaPlayerTools mediaPlayerTools;
    MediaPlayer mediaPlayer;
    long lastClickTime = 0;
    public boolean isPlaying = false;

    public static MediaPlayerTools getInstance() {
        if (mediaPlayerTools == null) {
            mediaPlayerTools = new MediaPlayerTools();
        }
        return mediaPlayerTools;
    }

    public void OnFDQClick(String str) {
        if (MyClickMode.nowMode == ClickMODE.Photo) {
            if (MyClickMode.isApplicationInBackground(MyApplication.getInstance().getApplicationContext())) {
                Log.e("后台模式，不处理", "后台拍照");
                return;
            } else {
                Log.e("前台模式", "前台拍照");
                CameraFragment.getInstance().takePhotots();
                return;
            }
        }
        if (MyClickMode.nowMode == ClickMODE.Recording) {
            Log.e("录音或者开始录音", "录音或者开始录音");
            RecordList.getInstance().onFDQCLick();
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        long j = this.lastClickTime;
        if (j == 0) {
            this.lastClickTime = currentTimeMillis;
            Log.e("点击", "第一次单击");
            return;
        }
        if (currentTimeMillis - j < 1000 && currentTimeMillis - j > 10) {
            if (MyUserSetting.getInstance().getMySetting().isDoubleClickIsRecording()) {
                Log.e("录音或者开始录音", "录音或者开始录音");
                MyRecorder.getInstance().recordOnOff();
            } else {
                Log.e("点击", "双击");
                if (this.isPlaying) {
                    Log.e("播放", "播放");
                    Pause();
                    MyApplication.getInstance().SetIsAlarmingByMac(str, false);
                    MyApplication.getInstance().sendDialogEvent(new DialogEvent(DialogState.DIALOG_DISMISS, str, true));
                } else {
                    Log.e("播放", "暂停");
                    PlaySound(str);
                    MyApplication.getInstance().SetIsAlarmingByMac(str, true);
                    MyApplication.getInstance().sendDialogEvent(new DialogEvent(DialogState.DIALOG_SHOW, str, true));
                }
            }
            this.lastClickTime = 0L;
        } else {
            this.lastClickTime = currentTimeMillis;
            Log.e("点击", "较长时间的单击");
        }
        DeviceFragment.getInstance().UpDateOnUIThread();
    }

    public boolean isPlaying(MediaPlayer mediaPlayer) {
        try {
            return mediaPlayer.isPlaying();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void PlaySound(String str) {
        Log.e("播放", getResIdByAddress(str).toString());
        MediaPlayer mediaPlayer = this.mediaPlayer;
        if (mediaPlayer != null) {
            mediaPlayer.release();
        }
        MediaPlayer create = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), getResIdByAddress(str).intValue());
        this.mediaPlayer = create;
        create.setVolume(1.0f, 1.0f);
        this.mediaPlayer.setLooping(true);
        this.mediaPlayer.start();
        this.isPlaying = true;
    }

    public void PlaySoundOnceByIndex(Integer num) {
        MediaPlayer mediaPlayer = this.mediaPlayer;
        if (mediaPlayer != null) {
            if (isPlaying(mediaPlayer)) {
                this.mediaPlayer.pause();
            }
            this.mediaPlayer.release();
            this.mediaPlayer = null;
        }
        switch (num.intValue()) {
            case 0:
                this.mediaPlayer = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), R.raw.ring1);
                break;
            case 1:
                this.mediaPlayer = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), R.raw.ring0);
                break;
            case 2:
                this.mediaPlayer = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), R.raw.ring2);
                break;
            case 3:
                this.mediaPlayer = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), R.raw.ring3);
                break;
            case 4:
                this.mediaPlayer = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), R.raw.ring4);
                break;
            case 5:
                this.mediaPlayer = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), R.raw.ring5);
                break;
            case 6:
                this.mediaPlayer = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), R.raw.ring6);
                break;
            case 7:
                this.mediaPlayer = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), R.raw.ring7);
                break;
            case 8:
                this.mediaPlayer = MediaPlayer.create(MyApplication.getInstance().getApplicationContext(), R.raw.ring8);
                break;
        }
        this.mediaPlayer.setVolume(100.0f, 100.0f);
        this.mediaPlayer.setLooping(false);
        this.mediaPlayer.start();
    }

    public void Pause() {
        MediaPlayer mediaPlayer = this.mediaPlayer;
        if (mediaPlayer != null) {
            mediaPlayer.setLooping(false);
            this.mediaPlayer.pause();
            this.mediaPlayer.release();
            this.isPlaying = false;
        }
        this.isPlaying = false;
    }

    public void OnRingPageBack() {
        MediaPlayer mediaPlayer = this.mediaPlayer;
        if (mediaPlayer != null) {
            try {
                mediaPlayer.pause();
            } catch (IllegalStateException e) {
                e.printStackTrace();
            }
        }
    }

    public Integer getResIdByAddress(String str) {
        int intValue = MyApplication.getInstance().getBleItemByMac(str).getRingIndex().intValue();
        Integer valueOf = Integer.valueOf(R.raw.ring0);
        switch (intValue) {
            case 0:
                return Integer.valueOf(R.raw.ring1);
            case 1:
                return valueOf;
            case 2:
                return Integer.valueOf(R.raw.ring2);
            case 3:
                return Integer.valueOf(R.raw.ring3);
            case 4:
                return Integer.valueOf(R.raw.ring4);
            case 5:
                return Integer.valueOf(R.raw.ring5);
            case 6:
                return Integer.valueOf(R.raw.ring6);
            case 7:
                return Integer.valueOf(R.raw.ring7);
            case 8:
                return Integer.valueOf(R.raw.ring8);
            default:
                return valueOf;
        }
    }
}
