package androidx.camera.camera2.internal;

import java.util.Objects;

/* loaded from: classes.dex */
final class AutoValue_CameraDeviceId extends CameraDeviceId {
    private final String brand;
    private final String cameraId;
    private final String device;
    private final String model;

    AutoValue_CameraDeviceId(String str, String str2, String str3, String str4) {
        Objects.requireNonNull(str, "Null brand");
        this.brand = str;
        Objects.requireNonNull(str2, "Null device");
        this.device = str2;
        Objects.requireNonNull(str3, "Null model");
        this.model = str3;
        Objects.requireNonNull(str4, "Null cameraId");
        this.cameraId = str4;
    }

    @Override // androidx.camera.camera2.internal.CameraDeviceId
    public String getBrand() {
        return this.brand;
    }

    @Override // androidx.camera.camera2.internal.CameraDeviceId
    public String getDevice() {
        return this.device;
    }

    @Override // androidx.camera.camera2.internal.CameraDeviceId
    public String getModel() {
        return this.model;
    }

    @Override // androidx.camera.camera2.internal.CameraDeviceId
    public String getCameraId() {
        return this.cameraId;
    }

    public String toString() {
        return "CameraDeviceId{brand=" + this.brand + ", device=" + this.device + ", model=" + this.model + ", cameraId=" + this.cameraId + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof CameraDeviceId)) {
            return false;
        }
        CameraDeviceId cameraDeviceId = (CameraDeviceId) obj;
        return this.brand.equals(cameraDeviceId.getBrand()) && this.device.equals(cameraDeviceId.getDevice()) && this.model.equals(cameraDeviceId.getModel()) && this.cameraId.equals(cameraDeviceId.getCameraId());
    }

    public int hashCode() {
        return ((((((this.brand.hashCode() ^ 1000003) * 1000003) ^ this.device.hashCode()) * 1000003) ^ this.model.hashCode()) * 1000003) ^ this.cameraId.hashCode();
    }
}
