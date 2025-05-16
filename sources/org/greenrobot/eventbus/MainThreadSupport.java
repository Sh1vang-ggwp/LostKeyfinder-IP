package org.greenrobot.eventbus;

/* loaded from: classes.dex */
public interface MainThreadSupport {
    Poster createPoster(EventBus eventBus);

    boolean isMainThread();
}
