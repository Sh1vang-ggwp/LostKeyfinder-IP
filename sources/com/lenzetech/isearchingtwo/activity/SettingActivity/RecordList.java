package com.lenzetech.isearchingtwo.activity.SettingActivity;

import android.app.Activity;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.lenzetech.isearchingtwo.Adapter.RecordAdapter;
import com.lenzetech.isearchingtwo.AudioToolsUtils.MyRecorder;
import com.lenzetech.isearchingtwo.Bean.RecItem;
import com.lenzetech.isearchingtwo.R;
import com.lenzetech.isearchingtwo.Utils.ClickMODE;
import com.lenzetech.isearchingtwo.Utils.MyClickMode;
import com.lenzetech.isearchingtwo.permission.BlePermissionHelper;
import com.lenzetech.isearchingtwo.permission.PermissionActivity;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class RecordList extends PermissionActivity implements View.OnClickListener {
    private static RecordList recordList;
    Button backBtn;
    private BlePermissionHelper blePermissionHelper;
    Button endBtn;
    ListView listView;
    private MediaPlayer mMediaPlayer;
    Button startBtn;
    boolean isRecording = false;
    private List<RecItem> recItemList = new ArrayList();

    @Override // com.lenzetech.isearchingtwo.permission.PermissionActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_record_list);
        MyRecorder.getInstance().initData();
        InitView();
        BlePermissionHelper blePermissionHelper = new BlePermissionHelper((Activity) this);
        this.blePermissionHelper = blePermissionHelper;
        if (!blePermissionHelper.isPermission("android.permission.RECORD_AUDIO")) {
            this.blePermissionHelper.requestPermission("android.permission.RECORD_AUDIO", 202);
        }
        recordList = this;
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        Log.e("你好啊", "我被杀死了");
    }

    public static RecordList getInstance() {
        if (recordList == null) {
            recordList = new RecordList();
        }
        return recordList;
    }

    public RecordList() {
        recordList = this;
    }

    public void onFDQCLick() {
        Log.e("11111111111", "开始录音");
        if (this.isRecording) {
            this.isRecording = false;
            runOnUiThread(new Runnable() { // from class: com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList.1
                @Override // java.lang.Runnable
                public void run() {
                    MyRecorder.getInstance().onClickEnd();
                    RecordList.this.InitList();
                }
            });
        } else {
            this.isRecording = true;
            Log.e("kaishi", "开始录音");
            runOnUiThread(new Runnable() { // from class: com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList.2
                @Override // java.lang.Runnable
                public void run() {
                    MyRecorder.getInstance().onClickStart();
                }
            });
        }
    }

    private void InitView() {
        Button button = (Button) findViewById(R.id.setting_back_btn);
        this.backBtn = button;
        button.setOnClickListener(this);
        this.startBtn = (Button) findViewById(R.id.startBtn);
        this.endBtn = (Button) findViewById(R.id.endBtn);
        this.startBtn.setOnClickListener(this);
        this.endBtn.setOnClickListener(this);
        MyRecorder.getInstance().getFiles();
        InitList();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void InitList() {
        this.listView = (ListView) findViewById(R.id.recListView);
        this.recItemList.clear();
        this.recItemList = MyRecorder.getInstance().getRecItemList();
        Log.d("reverse", "InitList: -------------------------");
        RecordAdapter recordAdapter = new RecordAdapter(getApplicationContext(), R.layout.record_item, this.recItemList);
        this.listView.setAdapter((ListAdapter) recordAdapter);
        recordAdapter.setListener(new RecordAdapter.OnItemClickListener() { // from class: com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList.3
            @Override // com.lenzetech.isearchingtwo.Adapter.RecordAdapter.OnItemClickListener
            public void onItemClick(RecItem recItem, int i) {
                try {
                    RecordList recordList2 = RecordList.this;
                    recordList2.startplayMusic(((RecItem) recordList2.recItemList.get(i)).getFileIte().getCanonicalPath());
                    ((RecordAdapter) RecordList.this.listView.getAdapter()).setPlay(i);
                    ((RecordAdapter) RecordList.this.listView.getAdapter()).notifyDataSetChanged();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        Log.e("hello", "点击时间" + view.getId());
        int id = view.getId();
        if (id == R.id.endBtn) {
            MyRecorder.getInstance().onClickEnd();
            InitList();
        } else if (id != R.id.setting_back_btn) {
            if (id != R.id.startBtn) {
                return;
            }
            MyRecorder.getInstance().onClickStart();
        } else {
            MyClickMode.nowMode = ClickMODE.Normal;
            MyRecorder.getInstance().onClickEnd();
            stopPlayMusic();
            finish();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startplayMusic(String str) {
        if (this.mMediaPlayer != null) {
            stopPlayMusic();
        }
        MediaPlayer mediaPlayer = new MediaPlayer();
        this.mMediaPlayer = mediaPlayer;
        mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() { // from class: com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList.4
            @Override // android.media.MediaPlayer.OnCompletionListener
            public void onCompletion(MediaPlayer mediaPlayer2) {
                ((RecordAdapter) RecordList.this.listView.getAdapter()).setAllUnplay();
                ((RecordAdapter) RecordList.this.listView.getAdapter()).notifyDataSetChanged();
            }
        });
        this.mMediaPlayer.setOnErrorListener(new MediaPlayer.OnErrorListener() { // from class: com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList.5
            @Override // android.media.MediaPlayer.OnErrorListener
            public boolean onError(MediaPlayer mediaPlayer2, int i, int i2) {
                ((RecordAdapter) RecordList.this.listView.getAdapter()).setAllUnplay();
                ((RecordAdapter) RecordList.this.listView.getAdapter()).notifyDataSetChanged();
                return false;
            }
        });
        try {
            this.mMediaPlayer.setDataSource(new FileInputStream(str).getFD());
            this.mMediaPlayer.prepareAsync();
            this.mMediaPlayer.setOnPreparedListener(new MediaPlayer.OnPreparedListener() { // from class: com.lenzetech.isearchingtwo.activity.SettingActivity.RecordList.6
                @Override // android.media.MediaPlayer.OnPreparedListener
                public void onPrepared(MediaPlayer mediaPlayer2) {
                    RecordList.this.mMediaPlayer.start();
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
            ((RecordAdapter) this.listView.getAdapter()).setAllUnplay();
            ((RecordAdapter) this.listView.getAdapter()).notifyDataSetChanged();
        }
    }

    private void stopPlayMusic() {
        MediaPlayer mediaPlayer = this.mMediaPlayer;
        if (mediaPlayer == null) {
            return;
        }
        try {
            mediaPlayer.stop();
            this.mMediaPlayer.release();
            this.mMediaPlayer = null;
            ((RecordAdapter) this.listView.getAdapter()).setAllUnplay();
            ((RecordAdapter) this.listView.getAdapter()).notifyDataSetChanged();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
    }
}
