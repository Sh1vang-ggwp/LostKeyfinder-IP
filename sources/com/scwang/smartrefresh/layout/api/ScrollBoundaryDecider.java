package com.scwang.smartrefresh.layout.api;

import android.view.View;

/* loaded from: classes.dex */
public interface ScrollBoundaryDecider {
    boolean canLoadMore(View view);

    boolean canRefresh(View view);
}
