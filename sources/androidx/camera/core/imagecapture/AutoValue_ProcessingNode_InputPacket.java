package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageProxy;
import androidx.camera.core.imagecapture.ProcessingNode;
import java.util.Objects;

/* loaded from: classes.dex */
final class AutoValue_ProcessingNode_InputPacket extends ProcessingNode.InputPacket {
    private final ImageProxy imageProxy;
    private final ProcessingRequest processingRequest;

    AutoValue_ProcessingNode_InputPacket(ProcessingRequest processingRequest, ImageProxy imageProxy) {
        Objects.requireNonNull(processingRequest, "Null processingRequest");
        this.processingRequest = processingRequest;
        Objects.requireNonNull(imageProxy, "Null imageProxy");
        this.imageProxy = imageProxy;
    }

    @Override // androidx.camera.core.imagecapture.ProcessingNode.InputPacket
    ProcessingRequest getProcessingRequest() {
        return this.processingRequest;
    }

    @Override // androidx.camera.core.imagecapture.ProcessingNode.InputPacket
    ImageProxy getImageProxy() {
        return this.imageProxy;
    }

    public String toString() {
        return "InputPacket{processingRequest=" + this.processingRequest + ", imageProxy=" + this.imageProxy + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ProcessingNode.InputPacket)) {
            return false;
        }
        ProcessingNode.InputPacket inputPacket = (ProcessingNode.InputPacket) obj;
        return this.processingRequest.equals(inputPacket.getProcessingRequest()) && this.imageProxy.equals(inputPacket.getImageProxy());
    }

    public int hashCode() {
        return ((this.processingRequest.hashCode() ^ 1000003) * 1000003) ^ this.imageProxy.hashCode();
    }
}
