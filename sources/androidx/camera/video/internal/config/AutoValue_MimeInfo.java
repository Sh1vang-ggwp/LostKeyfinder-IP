package androidx.camera.video.internal.config;

import androidx.camera.core.impl.CamcorderProfileProxy;
import androidx.camera.video.internal.config.MimeInfo;
import java.util.Objects;

/* loaded from: classes.dex */
final class AutoValue_MimeInfo extends MimeInfo {
    private final CamcorderProfileProxy compatibleCamcorderProfile;
    private final String mimeType;
    private final int profile;

    private AutoValue_MimeInfo(String str, int i, CamcorderProfileProxy camcorderProfileProxy) {
        this.mimeType = str;
        this.profile = i;
        this.compatibleCamcorderProfile = camcorderProfileProxy;
    }

    @Override // androidx.camera.video.internal.config.MimeInfo
    public String getMimeType() {
        return this.mimeType;
    }

    @Override // androidx.camera.video.internal.config.MimeInfo
    public int getProfile() {
        return this.profile;
    }

    @Override // androidx.camera.video.internal.config.MimeInfo
    public CamcorderProfileProxy getCompatibleCamcorderProfile() {
        return this.compatibleCamcorderProfile;
    }

    public String toString() {
        return "MimeInfo{mimeType=" + this.mimeType + ", profile=" + this.profile + ", compatibleCamcorderProfile=" + this.compatibleCamcorderProfile + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof MimeInfo)) {
            return false;
        }
        MimeInfo mimeInfo = (MimeInfo) obj;
        if (this.mimeType.equals(mimeInfo.getMimeType()) && this.profile == mimeInfo.getProfile()) {
            CamcorderProfileProxy camcorderProfileProxy = this.compatibleCamcorderProfile;
            if (camcorderProfileProxy == null) {
                if (mimeInfo.getCompatibleCamcorderProfile() == null) {
                    return true;
                }
            } else if (camcorderProfileProxy.equals(mimeInfo.getCompatibleCamcorderProfile())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int hashCode = (((this.mimeType.hashCode() ^ 1000003) * 1000003) ^ this.profile) * 1000003;
        CamcorderProfileProxy camcorderProfileProxy = this.compatibleCamcorderProfile;
        return hashCode ^ (camcorderProfileProxy == null ? 0 : camcorderProfileProxy.hashCode());
    }

    static final class Builder extends MimeInfo.Builder {
        private CamcorderProfileProxy compatibleCamcorderProfile;
        private String mimeType;
        private Integer profile;

        Builder() {
        }

        @Override // androidx.camera.video.internal.config.MimeInfo.Builder
        MimeInfo.Builder setMimeType(String str) {
            Objects.requireNonNull(str, "Null mimeType");
            this.mimeType = str;
            return this;
        }

        @Override // androidx.camera.video.internal.config.MimeInfo.Builder
        public MimeInfo.Builder setProfile(int i) {
            this.profile = Integer.valueOf(i);
            return this;
        }

        @Override // androidx.camera.video.internal.config.MimeInfo.Builder
        public MimeInfo.Builder setCompatibleCamcorderProfile(CamcorderProfileProxy camcorderProfileProxy) {
            this.compatibleCamcorderProfile = camcorderProfileProxy;
            return this;
        }

        @Override // androidx.camera.video.internal.config.MimeInfo.Builder
        public MimeInfo build() {
            String str = "";
            if (this.mimeType == null) {
                str = " mimeType";
            }
            if (this.profile == null) {
                str = str + " profile";
            }
            if (!str.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + str);
            }
            return new AutoValue_MimeInfo(this.mimeType, this.profile.intValue(), this.compatibleCamcorderProfile);
        }
    }
}
