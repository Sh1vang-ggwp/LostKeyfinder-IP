package androidx.camera.core;

import androidx.core.util.Preconditions;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public abstract class CameraEffect {
    public static final int IMAGE_CAPTURE = 4;
    public static final int PREVIEW = 1;
    public static final int VIDEO_CAPTURE = 2;
    private final Executor mExecutor;
    private final ImageProcessor mImageProcessor;
    private final SurfaceProcessor mSurfaceProcessor;
    private final int mTargets;

    @Retention(RetentionPolicy.SOURCE)
    public @interface Targets {
    }

    protected CameraEffect(int i, Executor executor, ImageProcessor imageProcessor) {
        Preconditions.checkArgument(i == 4, "Currently ImageProcessor can only target IMAGE_CAPTURE.");
        this.mTargets = i;
        this.mExecutor = executor;
        this.mSurfaceProcessor = null;
        this.mImageProcessor = imageProcessor;
    }

    protected CameraEffect(int i, Executor executor, SurfaceProcessor surfaceProcessor) {
        Preconditions.checkArgument(i == 1, "Currently SurfaceProcessor can only target PREVIEW.");
        this.mTargets = i;
        this.mExecutor = executor;
        this.mSurfaceProcessor = surfaceProcessor;
        this.mImageProcessor = null;
    }

    public int getTargets() {
        return this.mTargets;
    }

    public Executor getExecutor() {
        return this.mExecutor;
    }

    public SurfaceProcessor getSurfaceProcessor() {
        return this.mSurfaceProcessor;
    }

    public ImageProcessor getImageProcessor() {
        return this.mImageProcessor;
    }
}
