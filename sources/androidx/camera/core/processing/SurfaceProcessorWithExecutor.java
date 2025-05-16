package androidx.camera.core.processing;

import androidx.camera.core.Logger;
import androidx.camera.core.ProcessingException;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.SurfaceProcessor;
import androidx.camera.core.SurfaceRequest;
import androidx.core.util.Preconditions;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public class SurfaceProcessorWithExecutor implements SurfaceProcessorInternal {
    private static final String TAG = "SurfaceProcessor";
    private final Executor mExecutor;
    private final SurfaceProcessor mSurfaceProcessor;

    @Override // androidx.camera.core.processing.SurfaceProcessorInternal
    public void release() {
    }

    public SurfaceProcessorWithExecutor(SurfaceProcessor surfaceProcessor, Executor executor) {
        Preconditions.checkState(!(surfaceProcessor instanceof SurfaceProcessorInternal), "SurfaceProcessorInternal should always be thread safe. Do not wrap.");
        this.mSurfaceProcessor = surfaceProcessor;
        this.mExecutor = executor;
    }

    public SurfaceProcessor getProcessor() {
        return this.mSurfaceProcessor;
    }

    public Executor getExecutor() {
        return this.mExecutor;
    }

    @Override // androidx.camera.core.SurfaceProcessor
    public void onInputSurface(final SurfaceRequest surfaceRequest) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.core.processing.SurfaceProcessorWithExecutor$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceProcessorWithExecutor.this.m162x3d0be2a7(surfaceRequest);
            }
        });
    }

    /* renamed from: lambda$onInputSurface$0$androidx-camera-core-processing-SurfaceProcessorWithExecutor, reason: not valid java name */
    /* synthetic */ void m162x3d0be2a7(SurfaceRequest surfaceRequest) {
        try {
            this.mSurfaceProcessor.onInputSurface(surfaceRequest);
        } catch (ProcessingException e) {
            Logger.e(TAG, "Failed to setup SurfaceProcessor input.", e);
        }
    }

    @Override // androidx.camera.core.SurfaceProcessor
    public void onOutputSurface(final SurfaceOutput surfaceOutput) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.core.processing.SurfaceProcessorWithExecutor$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceProcessorWithExecutor.this.m163x6df3c9b5(surfaceOutput);
            }
        });
    }

    /* renamed from: lambda$onOutputSurface$1$androidx-camera-core-processing-SurfaceProcessorWithExecutor, reason: not valid java name */
    /* synthetic */ void m163x6df3c9b5(SurfaceOutput surfaceOutput) {
        try {
            this.mSurfaceProcessor.onOutputSurface(surfaceOutput);
        } catch (ProcessingException e) {
            Logger.e(TAG, "Failed to setup SurfaceProcessor output.", e);
        }
    }
}
