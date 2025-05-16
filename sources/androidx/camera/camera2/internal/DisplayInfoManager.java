package androidx.camera.camera2.internal;

import android.content.Context;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.util.Size;
import android.view.Display;
import androidx.camera.camera2.internal.compat.workaround.MaxPreviewSize;

/* loaded from: classes.dex */
public class DisplayInfoManager {
    private static final String TAG = "DisplayInfoManager";
    private static volatile DisplayInfoManager sInstance;
    private final DisplayManager mDisplayManager;
    private static final Size MAX_PREVIEW_SIZE = new Size(1920, 1080);
    private static final Object INSTANCE_LOCK = new Object();
    private volatile Size mPreviewSize = null;
    private final MaxPreviewSize mMaxPreviewSize = new MaxPreviewSize();

    private DisplayInfoManager(Context context) {
        this.mDisplayManager = (DisplayManager) context.getSystemService("display");
    }

    public static DisplayInfoManager getInstance(Context context) {
        if (sInstance == null) {
            synchronized (INSTANCE_LOCK) {
                if (sInstance == null) {
                    sInstance = new DisplayInfoManager(context);
                }
            }
        }
        return sInstance;
    }

    static void releaseInstance() {
        sInstance = null;
    }

    void refresh() {
        this.mPreviewSize = calculatePreviewSize();
    }

    public Display getMaxSizeDisplay() {
        Display[] displays = this.mDisplayManager.getDisplays();
        if (displays.length == 1) {
            return displays[0];
        }
        int i = -1;
        Display display = null;
        Display display2 = null;
        int i2 = -1;
        for (Display display3 : displays) {
            if (display3.getState() != 1) {
                Point point = new Point();
                display3.getRealSize(point);
                if (point.x * point.y > i2) {
                    i2 = point.y * point.x;
                    display2 = display3;
                }
            }
        }
        if (display2 != null) {
            return display2;
        }
        for (Display display4 : displays) {
            Point point2 = new Point();
            display4.getRealSize(point2);
            if (point2.x * point2.y > i) {
                i = point2.x * point2.y;
                display = display4;
            }
        }
        if (display != null) {
            return display;
        }
        throw new IllegalArgumentException("No display can be found from the input display manager!");
    }

    Size getPreviewSize() {
        if (this.mPreviewSize != null) {
            return this.mPreviewSize;
        }
        this.mPreviewSize = calculatePreviewSize();
        return this.mPreviewSize;
    }

    private Size calculatePreviewSize() {
        Size size;
        Point point = new Point();
        getMaxSizeDisplay().getRealSize(point);
        if (point.x > point.y) {
            size = new Size(point.x, point.y);
        } else {
            size = new Size(point.y, point.x);
        }
        int width = size.getWidth() * size.getHeight();
        Size size2 = MAX_PREVIEW_SIZE;
        if (width > size2.getWidth() * size2.getHeight()) {
            size = size2;
        }
        return this.mMaxPreviewSize.getMaxPreviewResolution(size);
    }
}
