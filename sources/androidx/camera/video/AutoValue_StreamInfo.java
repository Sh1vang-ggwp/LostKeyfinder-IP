package androidx.camera.video;

import androidx.camera.video.StreamInfo;
import java.util.Objects;

/* loaded from: classes.dex */
final class AutoValue_StreamInfo extends StreamInfo {
    private final int id;
    private final StreamInfo.StreamState streamState;

    AutoValue_StreamInfo(int i, StreamInfo.StreamState streamState) {
        this.id = i;
        Objects.requireNonNull(streamState, "Null streamState");
        this.streamState = streamState;
    }

    @Override // androidx.camera.video.StreamInfo
    public int getId() {
        return this.id;
    }

    @Override // androidx.camera.video.StreamInfo
    public StreamInfo.StreamState getStreamState() {
        return this.streamState;
    }

    public String toString() {
        return "StreamInfo{id=" + this.id + ", streamState=" + this.streamState + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof StreamInfo)) {
            return false;
        }
        StreamInfo streamInfo = (StreamInfo) obj;
        return this.id == streamInfo.getId() && this.streamState.equals(streamInfo.getStreamState());
    }

    public int hashCode() {
        return ((this.id ^ 1000003) * 1000003) ^ this.streamState.hashCode();
    }
}
