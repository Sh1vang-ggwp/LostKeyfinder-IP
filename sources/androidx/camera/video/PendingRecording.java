package androidx.camera.video;

import android.content.Context;
import androidx.camera.core.impl.utils.ContextUtil;
import androidx.core.content.PermissionChecker;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class PendingRecording {
    private boolean mAudioEnabled = false;
    private final Context mContext;
    private Consumer<VideoRecordEvent> mEventListener;
    private Executor mListenerExecutor;
    private final OutputOptions mOutputOptions;
    private final Recorder mRecorder;

    PendingRecording(Context context, Recorder recorder, OutputOptions outputOptions) {
        this.mContext = ContextUtil.getApplicationContext(context);
        this.mRecorder = recorder;
        this.mOutputOptions = outputOptions;
    }

    Context getApplicationContext() {
        return this.mContext;
    }

    Recorder getRecorder() {
        return this.mRecorder;
    }

    OutputOptions getOutputOptions() {
        return this.mOutputOptions;
    }

    Executor getListenerExecutor() {
        return this.mListenerExecutor;
    }

    Consumer<VideoRecordEvent> getEventListener() {
        return this.mEventListener;
    }

    boolean isAudioEnabled() {
        return this.mAudioEnabled;
    }

    public PendingRecording withAudioEnabled() {
        if (PermissionChecker.checkSelfPermission(this.mContext, "android.permission.RECORD_AUDIO") == -1) {
            throw new SecurityException("Attempted to enable audio for recording but application does not have RECORD_AUDIO permission granted.");
        }
        Preconditions.checkState(this.mRecorder.isAudioSupported(), "The Recorder this recording is associated to doesn't support audio.");
        this.mAudioEnabled = true;
        return this;
    }

    public Recording start(Executor executor, Consumer<VideoRecordEvent> consumer) {
        Preconditions.checkNotNull(executor, "Listener Executor can't be null.");
        Preconditions.checkNotNull(consumer, "Event listener can't be null");
        this.mListenerExecutor = executor;
        this.mEventListener = consumer;
        return this.mRecorder.start(this);
    }
}
