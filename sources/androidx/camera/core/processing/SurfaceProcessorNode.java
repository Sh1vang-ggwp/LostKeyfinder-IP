package androidx.camera.core.processing;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.core.ProcessingException;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes.dex */
public class SurfaceProcessorNode implements Node<In, Out> {
    private static final String TAG = "SurfaceProcessorNode";
    final CameraInternal mCameraInternal;
    private In mInput;
    private Out mOutput;
    final SurfaceProcessorInternal mSurfaceProcessor;

    public static class Out extends HashMap<OutConfig, SurfaceEdge> {
    }

    public SurfaceProcessorNode(CameraInternal cameraInternal, SurfaceProcessorInternal surfaceProcessorInternal) {
        this.mCameraInternal = cameraInternal;
        this.mSurfaceProcessor = surfaceProcessorInternal;
    }

    @Override // androidx.camera.core.processing.Node
    public Out transform(In in) {
        Threads.checkMainThread();
        this.mInput = in;
        this.mOutput = new Out();
        SurfaceEdge surfaceEdge = in.getSurfaceEdge();
        for (OutConfig outConfig : in.getOutConfigs()) {
            this.mOutput.put(outConfig, transformSingleOutput(surfaceEdge, outConfig));
        }
        sendSurfacesToProcessorWhenReady(surfaceEdge, this.mOutput);
        return this.mOutput;
    }

    private SurfaceEdge transformSingleOutput(SurfaceEdge surfaceEdge, OutConfig outConfig) {
        Objects.requireNonNull(surfaceEdge);
        SurfaceEdge$$ExternalSyntheticLambda2 surfaceEdge$$ExternalSyntheticLambda2 = new SurfaceEdge$$ExternalSyntheticLambda2(surfaceEdge);
        Size size = surfaceEdge.getSize();
        outConfig.getCropRect();
        int rotationDegrees = surfaceEdge.getRotationDegrees();
        boolean mirroring = surfaceEdge.getMirroring();
        Matrix matrix = new Matrix(surfaceEdge.getSensorToBufferTransform());
        matrix.postConcat(TransformUtils.getRectToRect(TransformUtils.sizeToRectF(size), TransformUtils.sizeToRectF(outConfig.getSize()), rotationDegrees, mirroring));
        Preconditions.checkArgument(TransformUtils.isAspectRatioMatchingWithRoundingError(TransformUtils.getRotatedSize(outConfig.getCropRect(), rotationDegrees), outConfig.getSize()));
        return new SurfaceEdge(outConfig.getTargets(), outConfig.getSize(), surfaceEdge.getFormat(), matrix, false, TransformUtils.sizeToRect(outConfig.getSize()), 0, false, surfaceEdge$$ExternalSyntheticLambda2);
    }

    private void sendSurfacesToProcessorWhenReady(SurfaceEdge surfaceEdge, Map<OutConfig, SurfaceEdge> map) {
        final SurfaceRequest createSurfaceRequest = surfaceEdge.createSurfaceRequest(this.mCameraInternal);
        ArrayList arrayList = new ArrayList();
        for (Map.Entry<OutConfig, SurfaceEdge> entry : map.entrySet()) {
            arrayList.add(entry.getValue().createSurfaceOutputFuture(surfaceEdge.getSize(), entry.getKey().getCropRect(), surfaceEdge.getRotationDegrees(), surfaceEdge.getMirroring()));
        }
        setupRotationUpdates(createSurfaceRequest, map.values(), surfaceEdge.getMirroring(), surfaceEdge.getRotationDegrees());
        Futures.addCallback(Futures.allAsList(arrayList), new FutureCallback<List<SurfaceOutput>>() { // from class: androidx.camera.core.processing.SurfaceProcessorNode.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(List<SurfaceOutput> list) {
                Preconditions.checkNotNull(list);
                try {
                    Iterator<SurfaceOutput> it = list.iterator();
                    while (it.hasNext()) {
                        SurfaceProcessorNode.this.mSurfaceProcessor.onOutputSurface(it.next());
                    }
                    SurfaceProcessorNode.this.mSurfaceProcessor.onInputSurface(createSurfaceRequest);
                } catch (ProcessingException e) {
                    Logger.e(SurfaceProcessorNode.TAG, "Failed to setup SurfaceProcessor input.", e);
                }
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable th) {
                createSurfaceRequest.willNotProvideSurface();
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    void setupRotationUpdates(SurfaceRequest surfaceRequest, final Collection<SurfaceEdge> collection, final boolean z, final int i) {
        surfaceRequest.setTransformationInfoListener(CameraXExecutors.mainThreadExecutor(), new SurfaceRequest.TransformationInfoListener() { // from class: androidx.camera.core.processing.SurfaceProcessorNode$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.SurfaceRequest.TransformationInfoListener
            public final void onTransformationInfoUpdate(SurfaceRequest.TransformationInfo transformationInfo) {
                SurfaceProcessorNode.lambda$setupRotationUpdates$0(i, z, collection, transformationInfo);
            }
        });
    }

    static /* synthetic */ void lambda$setupRotationUpdates$0(int i, boolean z, Collection collection, SurfaceRequest.TransformationInfo transformationInfo) {
        int rotationDegrees = transformationInfo.getRotationDegrees() - i;
        if (z) {
            rotationDegrees = -rotationDegrees;
        }
        int within360 = TransformUtils.within360(rotationDegrees);
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            ((SurfaceEdge) it.next()).setRotationDegrees(within360);
        }
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
        this.mSurfaceProcessor.release();
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.processing.SurfaceProcessorNode$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceProcessorNode.this.m161x89e7b484();
            }
        });
    }

    /* renamed from: lambda$release$1$androidx-camera-core-processing-SurfaceProcessorNode, reason: not valid java name */
    /* synthetic */ void m161x89e7b484() {
        Out out = this.mOutput;
        if (out != null) {
            Iterator<SurfaceEdge> it = out.values().iterator();
            while (it.hasNext()) {
                it.next().close();
            }
        }
    }

    public static abstract class In {
        public abstract List<OutConfig> getOutConfigs();

        public abstract SurfaceEdge getSurfaceEdge();

        public static In of(SurfaceEdge surfaceEdge, List<OutConfig> list) {
            return new AutoValue_SurfaceProcessorNode_In(surfaceEdge, list);
        }
    }

    public static abstract class OutConfig {
        abstract Rect getCropRect();

        abstract Size getSize();

        abstract int getTargets();

        public static OutConfig of(SurfaceEdge surfaceEdge) {
            return of(surfaceEdge.getTargets(), surfaceEdge.getCropRect(), TransformUtils.getRotatedSize(surfaceEdge.getCropRect(), surfaceEdge.getRotationDegrees()));
        }

        public static OutConfig of(int i, Rect rect, Size size) {
            return new AutoValue_SurfaceProcessorNode_OutConfig(i, rect, size);
        }
    }
}
