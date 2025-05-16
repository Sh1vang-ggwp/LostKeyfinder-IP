package androidx.camera.core.processing;

import android.graphics.Rect;
import android.util.Size;
import androidx.camera.core.processing.SurfaceProcessorNode;
import java.util.Objects;

/* loaded from: classes.dex */
final class AutoValue_SurfaceProcessorNode_OutConfig extends SurfaceProcessorNode.OutConfig {
    private final Rect cropRect;
    private final Size size;
    private final int targets;

    AutoValue_SurfaceProcessorNode_OutConfig(int i, Rect rect, Size size) {
        this.targets = i;
        Objects.requireNonNull(rect, "Null cropRect");
        this.cropRect = rect;
        Objects.requireNonNull(size, "Null size");
        this.size = size;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    int getTargets() {
        return this.targets;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    Rect getCropRect() {
        return this.cropRect;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    Size getSize() {
        return this.size;
    }

    public String toString() {
        return "OutConfig{targets=" + this.targets + ", cropRect=" + this.cropRect + ", size=" + this.size + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof SurfaceProcessorNode.OutConfig)) {
            return false;
        }
        SurfaceProcessorNode.OutConfig outConfig = (SurfaceProcessorNode.OutConfig) obj;
        return this.targets == outConfig.getTargets() && this.cropRect.equals(outConfig.getCropRect()) && this.size.equals(outConfig.getSize());
    }

    public int hashCode() {
        return ((((this.targets ^ 1000003) * 1000003) ^ this.cropRect.hashCode()) * 1000003) ^ this.size.hashCode();
    }
}
