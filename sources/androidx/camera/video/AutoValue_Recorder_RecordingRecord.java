package androidx.camera.video;

import androidx.camera.video.Recorder;
import androidx.core.util.Consumer;
import java.util.Objects;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
final class AutoValue_Recorder_RecordingRecord extends Recorder.RecordingRecord {
    private final Executor getCallbackExecutor;
    private final Consumer<VideoRecordEvent> getEventListener;
    private final OutputOptions getOutputOptions;
    private final long getRecordingId;
    private final boolean hasAudioEnabled;

    AutoValue_Recorder_RecordingRecord(OutputOptions outputOptions, Executor executor, Consumer<VideoRecordEvent> consumer, boolean z, long j) {
        Objects.requireNonNull(outputOptions, "Null getOutputOptions");
        this.getOutputOptions = outputOptions;
        this.getCallbackExecutor = executor;
        this.getEventListener = consumer;
        this.hasAudioEnabled = z;
        this.getRecordingId = j;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    OutputOptions getOutputOptions() {
        return this.getOutputOptions;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    Executor getCallbackExecutor() {
        return this.getCallbackExecutor;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    Consumer<VideoRecordEvent> getEventListener() {
        return this.getEventListener;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    boolean hasAudioEnabled() {
        return this.hasAudioEnabled;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    long getRecordingId() {
        return this.getRecordingId;
    }

    public String toString() {
        return "RecordingRecord{getOutputOptions=" + this.getOutputOptions + ", getCallbackExecutor=" + this.getCallbackExecutor + ", getEventListener=" + this.getEventListener + ", hasAudioEnabled=" + this.hasAudioEnabled + ", getRecordingId=" + this.getRecordingId + "}";
    }

    public boolean equals(Object obj) {
        Executor executor;
        Consumer<VideoRecordEvent> consumer;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Recorder.RecordingRecord)) {
            return false;
        }
        Recorder.RecordingRecord recordingRecord = (Recorder.RecordingRecord) obj;
        return this.getOutputOptions.equals(recordingRecord.getOutputOptions()) && ((executor = this.getCallbackExecutor) != null ? executor.equals(recordingRecord.getCallbackExecutor()) : recordingRecord.getCallbackExecutor() == null) && ((consumer = this.getEventListener) != null ? consumer.equals(recordingRecord.getEventListener()) : recordingRecord.getEventListener() == null) && this.hasAudioEnabled == recordingRecord.hasAudioEnabled() && this.getRecordingId == recordingRecord.getRecordingId();
    }

    public int hashCode() {
        int hashCode = (this.getOutputOptions.hashCode() ^ 1000003) * 1000003;
        Executor executor = this.getCallbackExecutor;
        int hashCode2 = (hashCode ^ (executor == null ? 0 : executor.hashCode())) * 1000003;
        Consumer<VideoRecordEvent> consumer = this.getEventListener;
        int hashCode3 = (hashCode2 ^ (consumer != null ? consumer.hashCode() : 0)) * 1000003;
        int i = this.hasAudioEnabled ? 1231 : 1237;
        long j = this.getRecordingId;
        return ((hashCode3 ^ i) * 1000003) ^ ((int) (j ^ (j >>> 32)));
    }
}
