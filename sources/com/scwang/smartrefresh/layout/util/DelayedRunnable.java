package com.scwang.smartrefresh.layout.util;

/* loaded from: classes.dex */
public class DelayedRunnable implements Runnable {
    public long delayMillis;
    private Runnable runnable;

    public DelayedRunnable(Runnable runnable, long j) {
        this.runnable = runnable;
        this.delayMillis = j;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            Runnable runnable = this.runnable;
            if (runnable != null) {
                runnable.run();
                this.runnable = null;
            }
        } catch (Throwable th) {
            if (th instanceof NoClassDefFoundError) {
                return;
            }
            th.printStackTrace();
        }
    }
}
