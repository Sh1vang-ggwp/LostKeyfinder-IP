package androidx.camera.video;

/* loaded from: classes.dex */
final class AutoValue_AudioStats extends AudioStats {
    private final int audioState;
    private final Throwable errorCause;

    AutoValue_AudioStats(int i, Throwable th) {
        this.audioState = i;
        this.errorCause = th;
    }

    @Override // androidx.camera.video.AudioStats
    public int getAudioState() {
        return this.audioState;
    }

    @Override // androidx.camera.video.AudioStats
    public Throwable getErrorCause() {
        return this.errorCause;
    }

    public String toString() {
        return "AudioStats{audioState=" + this.audioState + ", errorCause=" + this.errorCause + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof AudioStats)) {
            return false;
        }
        AudioStats audioStats = (AudioStats) obj;
        if (this.audioState == audioStats.getAudioState()) {
            Throwable th = this.errorCause;
            if (th == null) {
                if (audioStats.getErrorCause() == null) {
                    return true;
                }
            } else if (th.equals(audioStats.getErrorCause())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int i = (this.audioState ^ 1000003) * 1000003;
        Throwable th = this.errorCause;
        return i ^ (th == null ? 0 : th.hashCode());
    }
}
