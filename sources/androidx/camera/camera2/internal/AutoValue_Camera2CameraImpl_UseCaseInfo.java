package androidx.camera.camera2.internal;

import android.util.Size;
import androidx.camera.camera2.internal.Camera2CameraImpl;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseConfig;
import java.util.Objects;

/* loaded from: classes.dex */
final class AutoValue_Camera2CameraImpl_UseCaseInfo extends Camera2CameraImpl.UseCaseInfo {
    private final SessionConfig sessionConfig;
    private final Size surfaceResolution;
    private final UseCaseConfig<?> useCaseConfig;
    private final String useCaseId;
    private final Class<?> useCaseType;

    AutoValue_Camera2CameraImpl_UseCaseInfo(String str, Class<?> cls, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, Size size) {
        Objects.requireNonNull(str, "Null useCaseId");
        this.useCaseId = str;
        Objects.requireNonNull(cls, "Null useCaseType");
        this.useCaseType = cls;
        Objects.requireNonNull(sessionConfig, "Null sessionConfig");
        this.sessionConfig = sessionConfig;
        Objects.requireNonNull(useCaseConfig, "Null useCaseConfig");
        this.useCaseConfig = useCaseConfig;
        this.surfaceResolution = size;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    String getUseCaseId() {
        return this.useCaseId;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    Class<?> getUseCaseType() {
        return this.useCaseType;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    SessionConfig getSessionConfig() {
        return this.sessionConfig;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    UseCaseConfig<?> getUseCaseConfig() {
        return this.useCaseConfig;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    Size getSurfaceResolution() {
        return this.surfaceResolution;
    }

    public String toString() {
        return "UseCaseInfo{useCaseId=" + this.useCaseId + ", useCaseType=" + this.useCaseType + ", sessionConfig=" + this.sessionConfig + ", useCaseConfig=" + this.useCaseConfig + ", surfaceResolution=" + this.surfaceResolution + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Camera2CameraImpl.UseCaseInfo)) {
            return false;
        }
        Camera2CameraImpl.UseCaseInfo useCaseInfo = (Camera2CameraImpl.UseCaseInfo) obj;
        if (this.useCaseId.equals(useCaseInfo.getUseCaseId()) && this.useCaseType.equals(useCaseInfo.getUseCaseType()) && this.sessionConfig.equals(useCaseInfo.getSessionConfig()) && this.useCaseConfig.equals(useCaseInfo.getUseCaseConfig())) {
            Size size = this.surfaceResolution;
            if (size == null) {
                if (useCaseInfo.getSurfaceResolution() == null) {
                    return true;
                }
            } else if (size.equals(useCaseInfo.getSurfaceResolution())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int hashCode = (((((((this.useCaseId.hashCode() ^ 1000003) * 1000003) ^ this.useCaseType.hashCode()) * 1000003) ^ this.sessionConfig.hashCode()) * 1000003) ^ this.useCaseConfig.hashCode()) * 1000003;
        Size size = this.surfaceResolution;
        return hashCode ^ (size == null ? 0 : size.hashCode());
    }
}
