package com.lenzetech.isearchingtwo.AudioToolsUtils;

import android.media.AudioRecord;
import android.media.AudioTrack;
import android.media.MediaRecorder;
import android.os.Environment;
import android.util.Log;
import com.lenzetech.isearchingtwo.Bean.RecItem;
import com.lenzetech.isearchingtwo.application.MyApplication;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public class MyRecorder {
    private static final String TAG = "MainActivity";
    private static MyRecorder myRecorder;
    public List<RecItem> RecItemList;
    private String filePath;
    private byte[] mAudioData;
    private AudioRecord mAudioRecord;
    private AudioTrack mAudioTrack;
    private int mRecorderBufferSize;
    public ArrayList<File> recordingList;
    private ConcurrentLinkedQueue<byte[]> audioQueue = new ConcurrentLinkedQueue<>();
    private ThreadPoolExecutor mExecutor = new ThreadPoolExecutor(2, 2, 60, TimeUnit.SECONDS, new LinkedBlockingQueue());
    private int mSampleRateInHZ = 8000;
    private int mAudioFormat = 2;
    private int mChannelConfig = 16;
    private boolean isRecording = false;
    private MediaRecorder recorder = null;

    public void initData() {
    }

    public static MyRecorder getInstance() {
        if (myRecorder == null) {
            myRecorder = new MyRecorder();
        }
        return myRecorder;
    }

    public void recordOnOff() {
        if (this.isRecording) {
            onClickEnd();
        } else {
            onClickStart();
        }
    }

    public void onClickStart() {
        if (this.isRecording) {
            return;
        }
        String str = MyApplication.getInstance().getApplicationContext().getExternalFilesDir(null) + "/AudioRecord/";
        File file = new File(str);
        if (!file.exists()) {
            file.mkdirs();
        }
        this.filePath = str + "recording_" + System.currentTimeMillis() + ".3gp";
        MediaRecorder mediaRecorder = new MediaRecorder();
        this.recorder = mediaRecorder;
        mediaRecorder.setAudioSource(1);
        this.recorder.setOutputFormat(1);
        this.recorder.setOutputFile(this.filePath);
        this.recorder.setAudioEncoder(1);
        try {
            this.recorder.prepare();
        } catch (IOException unused) {
            Log.e(TAG, "prepare() failed");
        }
        this.recorder.start();
        this.isRecording = true;
    }

    public void onClickEnd() {
        if (this.isRecording) {
            this.isRecording = false;
            this.recorder.stop();
            this.recorder.release();
            this.recorder = null;
        }
    }

    private void pcmToWave(String str, String str2) {
        long j = this.mSampleRateInHZ;
        long j2 = ((16 * j) * 1) / 8;
        byte[] bArr = new byte[this.mRecorderBufferSize];
        try {
            FileInputStream fileInputStream = new FileInputStream(str);
            FileOutputStream fileOutputStream = new FileOutputStream(str2);
            long size = fileInputStream.getChannel().size();
            writeWaveFileHeader(fileOutputStream, size, size + 36, j, 1, j2);
            while (fileInputStream.read(bArr) != -1) {
                fileOutputStream.write(bArr);
            }
            fileInputStream.close();
            fileOutputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }

    private File createFile(String str) {
        String str2 = Environment.getExternalStorageDirectory().getPath() + "/AudioRecord/";
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        }
        File file2 = new File(str2 + str);
        if (file2.exists()) {
            return null;
        }
        try {
            file2.createNewFile();
            return file2;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void getFiles() {
        String str = MyApplication.getInstance().getApplicationContext().getExternalFilesDir(null) + "/AudioRecord/";
        this.recordingList = new ArrayList<>();
        File[] listFiles = new File(str).listFiles();
        if (listFiles != null) {
            for (int i = 0; i < listFiles.length; i++) {
                File file = listFiles[i];
                if (file.isFile() && (file.getName().endsWith(".wav") || file.getName().endsWith(".3gp"))) {
                    Log.e(i + "nihao", file.getName());
                    this.recordingList.add(file);
                }
            }
            return;
        }
        Log.e("为空", "");
    }

    public List<RecItem> getRecItemList() {
        String str = MyApplication.getInstance().getApplicationContext().getExternalFilesDir(null) + "/AudioRecord/";
        List<RecItem> list = this.RecItemList;
        if (list == null) {
            this.RecItemList = new ArrayList();
        } else {
            list.clear();
        }
        File[] listFiles = new File(str).listFiles();
        if (listFiles != null) {
            for (File file : listFiles) {
                Log.e("nihao", file.getName());
            }
            Log.e("nihao", "--------------------------------- length=" + listFiles.length);
            List asList = Arrays.asList(listFiles);
            Collections.sort(asList, new Comparator<File>() { // from class: com.lenzetech.isearchingtwo.AudioToolsUtils.MyRecorder.1
                @Override // java.util.Comparator
                public int compare(File file2, File file3) {
                    return file2.lastModified() > file3.lastModified() ? 1 : -1;
                }
            });
            int size = asList.size() > 100 ? asList.size() - 100 : 0;
            for (int i = 0; i < asList.size(); i++) {
                if (i < size) {
                    ((File) asList.get(i)).delete();
                } else {
                    if (((File) asList.get(i)).getName().endsWith(".wav") || ((File) asList.get(i)).getName().endsWith(".3gp")) {
                        RecItem recItem = new RecItem();
                        recItem.setFileIte((File) asList.get(i));
                        this.RecItemList.add(recItem);
                    }
                    Log.d("nihao", "getRecItemList: file=" + ((File) asList.get(i)).lastModified());
                }
            }
        }
        Collections.reverse(this.RecItemList);
        if (this.RecItemList.size() > 30) {
            this.RecItemList = this.RecItemList.subList(0, 30);
        }
        return this.RecItemList;
    }

    private void writeWaveFileHeader(FileOutputStream fileOutputStream, long j, long j2, long j3, int i, long j4) throws IOException {
        fileOutputStream.write(new byte[]{82, 73, 70, 70, (byte) (j2 & 255), (byte) ((j2 >> 8) & 255), (byte) ((j2 >> 16) & 255), (byte) ((j2 >> 24) & 255), 87, 65, 86, 69, 102, 109, 116, 32, 16, 0, 0, 0, 1, 0, (byte) i, 0, (byte) (j3 & 255), (byte) ((j3 >> 8) & 255), (byte) ((j3 >> 16) & 255), (byte) ((j3 >> 24) & 255), (byte) (j4 & 255), (byte) ((j4 >> 8) & 255), (byte) ((j4 >> 16) & 255), (byte) ((j4 >> 24) & 255), 2, 0, 16, 0, 100, 97, 116, 97, (byte) (j & 255), (byte) ((j >> 8) & 255), (byte) ((j >> 16) & 255), (byte) ((j >> 24) & 255)}, 0, 44);
    }
}
