package androidx.camera.core;

import android.util.Size;
import androidx.camera.core.impl.SizeCoordinate;

/* loaded from: classes.dex */
public class ResolutionSelector {
    private final boolean mIsHighResolutionEnabled;
    private final Size mMaxResolution;
    private final int mPreferredAspectRatio;
    private final Size mPreferredResolution;
    private final SizeCoordinate mSizeCoordinate;

    ResolutionSelector(int i, Size size, SizeCoordinate sizeCoordinate, Size size2, boolean z) {
        this.mPreferredAspectRatio = i;
        this.mPreferredResolution = size;
        this.mSizeCoordinate = sizeCoordinate;
        this.mMaxResolution = size2;
        this.mIsHighResolutionEnabled = z;
    }

    public int getPreferredAspectRatio() {
        return this.mPreferredAspectRatio;
    }

    public Size getPreferredResolution() {
        return this.mPreferredResolution;
    }

    public SizeCoordinate getSizeCoordinate() {
        return this.mSizeCoordinate;
    }

    public Size getMaxResolution() {
        return this.mMaxResolution;
    }

    public boolean isHighResolutionEnabled() {
        return this.mIsHighResolutionEnabled;
    }

    public static final class Builder {
        private boolean mIsHighResolutionEnabled;
        private Size mMaxResolution;
        private int mPreferredAspectRatio;
        private Size mPreferredResolution;
        private SizeCoordinate mSizeCoordinate;

        public Builder() {
            this.mPreferredAspectRatio = 0;
            this.mPreferredResolution = null;
            this.mSizeCoordinate = SizeCoordinate.CAMERA_SENSOR;
            this.mMaxResolution = null;
            this.mIsHighResolutionEnabled = false;
        }

        private Builder(ResolutionSelector resolutionSelector) {
            this.mPreferredAspectRatio = 0;
            this.mPreferredResolution = null;
            this.mSizeCoordinate = SizeCoordinate.CAMERA_SENSOR;
            this.mMaxResolution = null;
            this.mIsHighResolutionEnabled = false;
            this.mPreferredAspectRatio = resolutionSelector.getPreferredAspectRatio();
            this.mPreferredResolution = resolutionSelector.getPreferredResolution();
            this.mSizeCoordinate = resolutionSelector.getSizeCoordinate();
            this.mMaxResolution = resolutionSelector.getMaxResolution();
            this.mIsHighResolutionEnabled = resolutionSelector.isHighResolutionEnabled();
        }

        public static Builder fromSelector(ResolutionSelector resolutionSelector) {
            return new Builder(resolutionSelector);
        }

        public Builder setPreferredAspectRatio(int i) {
            this.mPreferredAspectRatio = i;
            return this;
        }

        public Builder setPreferredResolution(Size size) {
            this.mPreferredResolution = size;
            this.mSizeCoordinate = SizeCoordinate.CAMERA_SENSOR;
            return this;
        }

        public Builder setPreferredResolutionByViewSize(Size size) {
            this.mPreferredResolution = size;
            this.mSizeCoordinate = SizeCoordinate.ANDROID_VIEW;
            return this;
        }

        public Builder setMaxResolution(Size size) {
            this.mMaxResolution = size;
            return this;
        }

        public Builder setHighResolutionEnabled(boolean z) {
            this.mIsHighResolutionEnabled = z;
            return this;
        }

        public ResolutionSelector build() {
            return new ResolutionSelector(this.mPreferredAspectRatio, this.mPreferredResolution, this.mSizeCoordinate, this.mMaxResolution, this.mIsHighResolutionEnabled);
        }
    }
}
