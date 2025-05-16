package androidx.camera.video;

import androidx.camera.core.SurfaceRequest;
import androidx.core.util.Consumer;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class Recorder$$ExternalSyntheticLambda15 implements Consumer {
    public final /* synthetic */ Recorder f$0;

    public /* synthetic */ Recorder$$ExternalSyntheticLambda15(Recorder recorder) {
        this.f$0 = recorder;
    }

    @Override // androidx.core.util.Consumer
    public final void accept(Object obj) {
        this.f$0.onSurfaceRequestComplete((SurfaceRequest.Result) obj);
    }
}
