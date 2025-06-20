package com.blankj.utilcode.util;

import android.view.View;
import java.util.Objects;

/* loaded from: classes.dex */
public final class AntiShakeUtils {
    private static final long DEFAULT_DURATION = 200;
    private static final int TAG_KEY = 2130706431;

    private AntiShakeUtils() {
        throw new UnsupportedOperationException("u can't instantiate me...");
    }

    public static boolean isValid(View view) {
        Objects.requireNonNull(view, "Argument 'view' of type View (#0 out of 1, zero-based) is marked by @android.support.annotation.NonNull but got null for it");
        return isValid(view, DEFAULT_DURATION);
    }

    public static boolean isValid(View view, long j) {
        Objects.requireNonNull(view, "Argument 'view' of type View (#0 out of 2, zero-based) is marked by @android.support.annotation.NonNull but got null for it");
        long currentTimeMillis = System.currentTimeMillis();
        Object tag = view.getTag(TAG_KEY);
        if (!(tag instanceof Long)) {
            view.setTag(TAG_KEY, Long.valueOf(currentTimeMillis));
            return true;
        }
        if (currentTimeMillis - ((Long) tag).longValue() <= j) {
            return false;
        }
        view.setTag(TAG_KEY, Long.valueOf(currentTimeMillis));
        return true;
    }
}
