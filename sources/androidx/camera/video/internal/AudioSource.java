package androidx.camera.video.internal;

import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioRecordingConfiguration;
import android.media.AudioTimestamp;
import android.os.Build;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.video.internal.AudioSource;
import androidx.camera.video.internal.AutoValue_AudioSource_Settings;
import androidx.camera.video.internal.BufferProvider;
import androidx.camera.video.internal.compat.Api23Impl;
import androidx.camera.video.internal.compat.Api24Impl;
import androidx.camera.video.internal.compat.Api29Impl;
import androidx.camera.video.internal.compat.Api31Impl;
import androidx.camera.video.internal.compat.quirk.AudioTimestampFramePositionIncorrectQuirk;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.encoder.InputBuffer;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class AudioSource {
    public static final List<Integer> COMMON_SAMPLE_RATES = Collections.unmodifiableList(Arrays.asList(48000, 44100, 22050, 11025, 8000, 4800));
    private static final String TAG = "AudioSource";
    private FutureCallback<InputBuffer> mAcquireBufferCallback;
    final AudioRecord mAudioRecord;
    private AudioManager.AudioRecordingCallback mAudioRecordingCallback;
    AudioSourceCallback mAudioSourceCallback;
    BufferProvider<InputBuffer> mBufferProvider;
    final int mBufferSize;
    final int mBytesPerFrame;
    Executor mCallbackExecutor;
    final Executor mExecutor;
    boolean mIsSendingAudio;
    final int mSampleRate;
    private Observable.Observer<BufferProvider.State> mStateObserver;
    AtomicBoolean mSourceSilence = new AtomicBoolean(false);
    long mTotalFramesRead = 0;
    InternalState mState = InternalState.CONFIGURED;
    BufferProvider.State mBufferProviderState = BufferProvider.State.INACTIVE;

    public interface AudioSourceCallback {
        void onError(Throwable th);

        void onSilenced(boolean z);
    }

    enum InternalState {
        CONFIGURED,
        STARTED,
        RELEASED
    }

    private static int channelCountToChannelConfig(int i) {
        return i == 1 ? 16 : 12;
    }

    private static int channelCountToChannelMask(int i) {
        return i == 1 ? 16 : 12;
    }

    public AudioSource(Settings settings, Executor executor, Context context) throws AudioSourceAccessException {
        if (!isSettingsSupported(settings.getSampleRate(), settings.getChannelCount(), settings.getAudioFormat())) {
            throw new UnsupportedOperationException(String.format("The combination of sample rate %d, channel count %d and audio format %d is not supported.", Integer.valueOf(settings.getSampleRate()), Integer.valueOf(settings.getChannelCount()), Integer.valueOf(settings.getAudioFormat())));
        }
        int minBufferSize = getMinBufferSize(settings.getSampleRate(), settings.getChannelCount(), settings.getAudioFormat());
        Preconditions.checkState(minBufferSize > 0);
        Executor newSequentialExecutor = CameraXExecutors.newSequentialExecutor(executor);
        this.mExecutor = newSequentialExecutor;
        int i = minBufferSize * 2;
        this.mBufferSize = i;
        this.mSampleRate = settings.getSampleRate();
        try {
            this.mBytesPerFrame = getBytesPerFrame(settings.getAudioFormat(), settings.getChannelCount());
            if (Build.VERSION.SDK_INT >= 23) {
                AudioFormat build = new AudioFormat.Builder().setSampleRate(settings.getSampleRate()).setChannelMask(channelCountToChannelMask(settings.getChannelCount())).setEncoding(settings.getAudioFormat()).build();
                AudioRecord.Builder createAudioRecordBuilder = Api23Impl.createAudioRecordBuilder();
                if (Build.VERSION.SDK_INT >= 31 && context != null) {
                    Api31Impl.setContext(createAudioRecordBuilder, context);
                }
                Api23Impl.setAudioSource(createAudioRecordBuilder, settings.getAudioSource());
                Api23Impl.setAudioFormat(createAudioRecordBuilder, build);
                Api23Impl.setBufferSizeInBytes(createAudioRecordBuilder, i);
                this.mAudioRecord = Api23Impl.build(createAudioRecordBuilder);
            } else {
                this.mAudioRecord = new AudioRecord(settings.getAudioSource(), settings.getSampleRate(), channelCountToChannelConfig(settings.getChannelCount()), settings.getAudioFormat(), i);
            }
            if (this.mAudioRecord.getState() != 1) {
                this.mAudioRecord.release();
                throw new AudioSourceAccessException("Unable to initialize AudioRecord");
            }
            if (Build.VERSION.SDK_INT >= 29) {
                AudioRecordingApi29Callback audioRecordingApi29Callback = new AudioRecordingApi29Callback();
                this.mAudioRecordingCallback = audioRecordingApi29Callback;
                Api29Impl.registerAudioRecordingCallback(this.mAudioRecord, newSequentialExecutor, audioRecordingApi29Callback);
            }
        } catch (IllegalArgumentException e) {
            throw new AudioSourceAccessException("Unable to create AudioRecord", e);
        }
    }

    class AudioRecordingApi29Callback extends AudioManager.AudioRecordingCallback {
        AudioRecordingApi29Callback() {
        }

        @Override // android.media.AudioManager.AudioRecordingCallback
        public void onRecordingConfigChanged(List<AudioRecordingConfiguration> list) {
            super.onRecordingConfigChanged(list);
            if (AudioSource.this.mCallbackExecutor == null || AudioSource.this.mAudioSourceCallback == null) {
                return;
            }
            for (AudioRecordingConfiguration audioRecordingConfiguration : list) {
                if (Api24Impl.getClientAudioSessionId(audioRecordingConfiguration) == AudioSource.this.mAudioRecord.getAudioSessionId()) {
                    final boolean isClientSilenced = Api29Impl.isClientSilenced(audioRecordingConfiguration);
                    if (AudioSource.this.mSourceSilence.getAndSet(isClientSilenced) != isClientSilenced) {
                        AudioSource.this.mCallbackExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.AudioSource$AudioRecordingApi29Callback$$ExternalSyntheticLambda0
                            @Override // java.lang.Runnable
                            public final void run() {
                                AudioSource.AudioRecordingApi29Callback.this.m192x1186fe59(isClientSilenced);
                            }
                        });
                        return;
                    }
                    return;
                }
            }
        }

        /* renamed from: lambda$onRecordingConfigChanged$0$androidx-camera-video-internal-AudioSource$AudioRecordingApi29Callback, reason: not valid java name */
        /* synthetic */ void m192x1186fe59(boolean z) {
            AudioSource.this.mAudioSourceCallback.onSilenced(z);
        }
    }

    public void setBufferProvider(final BufferProvider<InputBuffer> bufferProvider) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.AudioSource$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m189x1f3f6859(bufferProvider);
            }
        });
    }

    /* renamed from: lambda$setBufferProvider$0$androidx-camera-video-internal-AudioSource, reason: not valid java name */
    /* synthetic */ void m189x1f3f6859(BufferProvider bufferProvider) {
        int i = AnonymousClass3.$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState[this.mState.ordinal()];
        if (i != 1 && i != 2) {
            if (i == 3) {
                throw new AssertionError("AudioRecorder is released");
            }
        } else if (this.mBufferProvider != bufferProvider) {
            resetBufferProvider(bufferProvider);
        }
    }

    public void start() {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.AudioSource$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m190lambda$start$1$androidxcameravideointernalAudioSource();
            }
        });
    }

    /* renamed from: lambda$start$1$androidx-camera-video-internal-AudioSource, reason: not valid java name */
    /* synthetic */ void m190lambda$start$1$androidxcameravideointernalAudioSource() {
        int i = AnonymousClass3.$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState[this.mState.ordinal()];
        if (i != 1) {
            if (i == 3) {
                throw new AssertionError("AudioRecorder is released");
            }
        } else {
            setState(InternalState.STARTED);
            updateSendingAudio();
        }
    }

    public void stop() {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.AudioSource$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m191lambda$stop$2$androidxcameravideointernalAudioSource();
            }
        });
    }

    /* renamed from: lambda$stop$2$androidx-camera-video-internal-AudioSource, reason: not valid java name */
    /* synthetic */ void m191lambda$stop$2$androidxcameravideointernalAudioSource() {
        int i = AnonymousClass3.$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState[this.mState.ordinal()];
        if (i == 2) {
            setState(InternalState.CONFIGURED);
            updateSendingAudio();
        } else {
            if (i != 3) {
                return;
            }
            Logger.w(TAG, "AudioRecorder is released. Calling stop() is a no-op.");
        }
    }

    public ListenableFuture<Void> release() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.internal.AudioSource$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return AudioSource.this.m187lambda$release$4$androidxcameravideointernalAudioSource(completer);
            }
        });
    }

    /* renamed from: lambda$release$4$androidx-camera-video-internal-AudioSource, reason: not valid java name */
    /* synthetic */ Object m187lambda$release$4$androidxcameravideointernalAudioSource(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.AudioSource$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m186lambda$release$3$androidxcameravideointernalAudioSource(completer);
            }
        });
        return "AudioSource-release";
    }

    /* renamed from: lambda$release$3$androidx-camera-video-internal-AudioSource, reason: not valid java name */
    /* synthetic */ void m186lambda$release$3$androidxcameravideointernalAudioSource(CallbackToFutureAdapter.Completer completer) {
        try {
            int i = AnonymousClass3.$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState[this.mState.ordinal()];
            if (i == 1 || i == 2) {
                resetBufferProvider(null);
                if (Build.VERSION.SDK_INT >= 29) {
                    Api29Impl.unregisterAudioRecordingCallback(this.mAudioRecord, this.mAudioRecordingCallback);
                }
                this.mAudioRecord.release();
                stopSendingAudio();
                setState(InternalState.RELEASED);
            }
            completer.set(null);
        } catch (Throwable th) {
            completer.setException(th);
        }
    }

    /* renamed from: androidx.camera.video.internal.AudioSource$3, reason: invalid class name */
    static /* synthetic */ class AnonymousClass3 {
        static final /* synthetic */ int[] $SwitchMap$androidx$camera$video$internal$AudioSource$InternalState;

        static {
            int[] iArr = new int[InternalState.values().length];
            $SwitchMap$androidx$camera$video$internal$AudioSource$InternalState = iArr;
            try {
                iArr[InternalState.CONFIGURED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$androidx$camera$video$internal$AudioSource$InternalState[InternalState.STARTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$androidx$camera$video$internal$AudioSource$InternalState[InternalState.RELEASED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    public void setAudioSourceCallback(final Executor executor, final AudioSourceCallback audioSourceCallback) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.AudioSource$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m188x76a78219(executor, audioSourceCallback);
            }
        });
    }

    /* renamed from: lambda$setAudioSourceCallback$5$androidx-camera-video-internal-AudioSource, reason: not valid java name */
    /* synthetic */ void m188x76a78219(Executor executor, AudioSourceCallback audioSourceCallback) {
        int i = AnonymousClass3.$SwitchMap$androidx$camera$video$internal$AudioSource$InternalState[this.mState.ordinal()];
        if (i == 1) {
            this.mCallbackExecutor = executor;
            this.mAudioSourceCallback = audioSourceCallback;
        } else if (i == 2 || i == 3) {
            throw new AssertionError("The audio recording callback must be registered before the audio source is started.");
        }
    }

    private void resetBufferProvider(final BufferProvider<InputBuffer> bufferProvider) {
        BufferProvider<InputBuffer> bufferProvider2 = this.mBufferProvider;
        if (bufferProvider2 != null) {
            bufferProvider2.removeObserver(this.mStateObserver);
            this.mBufferProvider = null;
            this.mStateObserver = null;
            this.mAcquireBufferCallback = null;
        }
        this.mBufferProviderState = BufferProvider.State.INACTIVE;
        updateSendingAudio();
        if (bufferProvider != null) {
            this.mBufferProvider = bufferProvider;
            this.mStateObserver = new Observable.Observer<BufferProvider.State>() { // from class: androidx.camera.video.internal.AudioSource.1
                @Override // androidx.camera.core.impl.Observable.Observer
                public void onNewData(BufferProvider.State state) {
                    if (AudioSource.this.mBufferProvider == bufferProvider) {
                        Logger.d(AudioSource.TAG, "Receive BufferProvider state change: " + AudioSource.this.mBufferProviderState + " to " + state);
                        AudioSource.this.mBufferProviderState = state;
                        AudioSource.this.updateSendingAudio();
                    }
                }

                @Override // androidx.camera.core.impl.Observable.Observer
                public void onError(Throwable th) {
                    if (AudioSource.this.mBufferProvider == bufferProvider) {
                        AudioSource.this.notifyError(th);
                    }
                }
            };
            this.mAcquireBufferCallback = new FutureCallback<InputBuffer>() { // from class: androidx.camera.video.internal.AudioSource.2
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(InputBuffer inputBuffer) {
                    if (!AudioSource.this.mIsSendingAudio || AudioSource.this.mBufferProvider != bufferProvider) {
                        inputBuffer.cancel();
                        return;
                    }
                    ByteBuffer byteBuffer = inputBuffer.getByteBuffer();
                    int read = AudioSource.this.mAudioRecord.read(byteBuffer, AudioSource.this.mBufferSize);
                    if (read > 0) {
                        byteBuffer.limit(read);
                        inputBuffer.setPresentationTimeUs(AudioSource.this.generatePresentationTimeUs());
                        inputBuffer.submit();
                        AudioSource.this.mTotalFramesRead += read / AudioSource.this.mBytesPerFrame;
                    } else {
                        Logger.w(AudioSource.TAG, "Unable to read data from AudioRecord.");
                        inputBuffer.cancel();
                    }
                    AudioSource.this.sendNextAudio();
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable th) {
                    if (AudioSource.this.mBufferProvider != bufferProvider) {
                        Logger.d(AudioSource.TAG, "Unable to get input buffer, the BufferProvider could be transitioning to INACTIVE state.");
                        AudioSource.this.notifyError(th);
                    }
                }
            };
            this.mBufferProvider.addObserver(this.mExecutor, this.mStateObserver);
        }
    }

    void notifyError(final Throwable th) {
        Executor executor = this.mCallbackExecutor;
        if (executor == null || this.mAudioSourceCallback == null) {
            return;
        }
        executor.execute(new Runnable() { // from class: androidx.camera.video.internal.AudioSource$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m185lambda$notifyError$6$androidxcameravideointernalAudioSource(th);
            }
        });
    }

    /* renamed from: lambda$notifyError$6$androidx-camera-video-internal-AudioSource, reason: not valid java name */
    /* synthetic */ void m185lambda$notifyError$6$androidxcameravideointernalAudioSource(Throwable th) {
        this.mAudioSourceCallback.onError(th);
    }

    void updateSendingAudio() {
        if (this.mState == InternalState.STARTED && this.mBufferProviderState == BufferProvider.State.ACTIVE) {
            startSendingAudio();
        } else {
            stopSendingAudio();
        }
    }

    private void startSendingAudio() {
        if (this.mIsSendingAudio) {
            return;
        }
        try {
            Logger.d(TAG, "startSendingAudio");
            this.mAudioRecord.startRecording();
            if (this.mAudioRecord.getRecordingState() != 3) {
                throw new IllegalStateException("Unable to start AudioRecord with state: " + this.mAudioRecord.getRecordingState());
            }
            this.mTotalFramesRead = 0L;
            this.mIsSendingAudio = true;
            sendNextAudio();
        } catch (IllegalStateException e) {
            Logger.w(TAG, "Failed to start AudioRecord", e);
            setState(InternalState.CONFIGURED);
            notifyError(new AudioSourceAccessException("Unable to start the audio record.", e));
        }
    }

    private void stopSendingAudio() {
        if (this.mIsSendingAudio) {
            this.mIsSendingAudio = false;
            try {
                Logger.d(TAG, "stopSendingAudio");
                this.mAudioRecord.stop();
                if (this.mAudioRecord.getRecordingState() == 1) {
                    return;
                }
                throw new IllegalStateException("Unable to stop AudioRecord with state: " + this.mAudioRecord.getRecordingState());
            } catch (IllegalStateException e) {
                Logger.w(TAG, "Failed to stop AudioRecord", e);
                notifyError(e);
            }
        }
    }

    void sendNextAudio() {
        Futures.addCallback(this.mBufferProvider.acquireBuffer(), this.mAcquireBufferCallback, this.mExecutor);
    }

    void setState(InternalState internalState) {
        Logger.d(TAG, "Transitioning internal state: " + this.mState + " --> " + internalState);
        this.mState = internalState;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0031  */
    /* JADX WARN: Removed duplicated region for block: B:13:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    long generatePresentationTimeUs() {
        /*
            r6 = this;
            int r0 = android.os.Build.VERSION.SDK_INT
            r1 = -1
            r3 = 24
            if (r0 < r3) goto L2c
            boolean r0 = hasAudioTimestampQuirk()
            if (r0 != 0) goto L2c
            android.media.AudioTimestamp r0 = new android.media.AudioTimestamp
            r0.<init>()
            android.media.AudioRecord r3 = r6.mAudioRecord
            r4 = 0
            int r3 = androidx.camera.video.internal.compat.Api24Impl.getTimestamp(r3, r0, r4)
            if (r3 != 0) goto L25
            int r3 = r6.mSampleRate
            long r4 = r6.mTotalFramesRead
            long r3 = computeInterpolatedTimeUs(r3, r4, r0)
            goto L2d
        L25:
            java.lang.String r0 = "AudioSource"
            java.lang.String r3 = "Unable to get audio timestamp"
            androidx.camera.core.Logger.w(r0, r3)
        L2c:
            r3 = r1
        L2d:
            int r0 = (r3 > r1 ? 1 : (r3 == r1 ? 0 : -1))
            if (r0 != 0) goto L3b
            java.util.concurrent.TimeUnit r0 = java.util.concurrent.TimeUnit.NANOSECONDS
            long r1 = java.lang.System.nanoTime()
            long r3 = r0.toMicros(r1)
        L3b:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.internal.AudioSource.generatePresentationTimeUs():long");
    }

    private static boolean hasAudioTimestampQuirk() {
        return DeviceQuirks.get(AudioTimestampFramePositionIncorrectQuirk.class) != null;
    }

    private static long computeInterpolatedTimeUs(int i, long j, AudioTimestamp audioTimestamp) {
        long nanos = audioTimestamp.nanoTime + ((TimeUnit.SECONDS.toNanos(1L) * (j - audioTimestamp.framePosition)) / i);
        if (nanos < 0) {
            return 0L;
        }
        return TimeUnit.NANOSECONDS.toMicros(nanos);
    }

    public static boolean isSettingsSupported(int i, int i2, int i3) {
        return i > 0 && i2 > 0 && getMinBufferSize(i, i2, i3) > 0;
    }

    private static int getMinBufferSize(int i, int i2, int i3) {
        return AudioRecord.getMinBufferSize(i, channelCountToChannelConfig(i2), i3);
    }

    private static int getBytesPerFrame(int i, int i2) {
        Preconditions.checkState(i2 > 0);
        if (i == 2) {
            return i2 * 2;
        }
        if (i == 3) {
            return i2;
        }
        if (i != 4) {
            if (i == 21) {
                return i2 * 3;
            }
            if (i != 22) {
                throw new IllegalArgumentException("Invalid audio format: " + i);
            }
        }
        return i2 * 4;
    }

    public static abstract class Settings {
        public abstract int getAudioFormat();

        public abstract int getAudioSource();

        public abstract int getChannelCount();

        public abstract int getSampleRate();

        public abstract Builder toBuilder();

        public static Builder builder() {
            return new AutoValue_AudioSource_Settings.Builder().setAudioSource(-1).setSampleRate(-1).setChannelCount(-1).setAudioFormat(-1);
        }

        Settings() {
        }

        public static abstract class Builder {
            abstract Settings autoBuild();

            public abstract Builder setAudioFormat(int i);

            public abstract Builder setAudioSource(int i);

            public abstract Builder setChannelCount(int i);

            public abstract Builder setSampleRate(int i);

            public final Settings build() {
                Settings autoBuild = autoBuild();
                String str = "";
                if (autoBuild.getAudioSource() == -1) {
                    str = " audioSource";
                }
                if (autoBuild.getSampleRate() <= 0) {
                    str = str + " sampleRate";
                }
                if (autoBuild.getChannelCount() <= 0) {
                    str = str + " channelCount";
                }
                if (autoBuild.getAudioFormat() == -1) {
                    str = str + " audioFormat";
                }
                if (str.isEmpty()) {
                    return autoBuild;
                }
                throw new IllegalArgumentException("Required settings missing or non-positive:" + str);
            }

            Builder() {
            }
        }
    }
}
