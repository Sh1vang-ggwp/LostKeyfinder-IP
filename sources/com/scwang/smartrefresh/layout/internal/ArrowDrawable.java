package com.scwang.smartrefresh.layout.internal;

import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Rect;

/* loaded from: classes.dex */
public class ArrowDrawable extends PaintDrawable {
    private int mWidth = 0;
    private int mHeight = 0;
    private Path mPath = new Path();

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        int width = bounds.width();
        int height = bounds.height();
        if (this.mWidth != width || this.mHeight != height) {
            int i = (width * 30) / 225;
            this.mPath.reset();
            double d = i;
            float sin = (float) (Math.sin(0.7853981633974483d) * d);
            float sin2 = (float) (d / Math.sin(0.7853981633974483d));
            int i2 = width / 2;
            float f = height;
            this.mPath.moveTo(i2, f);
            float f2 = height / 2;
            this.mPath.lineTo(0.0f, f2);
            float f3 = f2 - sin;
            this.mPath.lineTo(sin, f3);
            int i3 = i / 2;
            float f4 = i2 - i3;
            float f5 = (f - sin2) - i3;
            this.mPath.lineTo(f4, f5);
            this.mPath.lineTo(f4, 0.0f);
            float f6 = i2 + i3;
            this.mPath.lineTo(f6, 0.0f);
            this.mPath.lineTo(f6, f5);
            float f7 = width;
            this.mPath.lineTo(f7 - sin, f3);
            this.mPath.lineTo(f7, f2);
            this.mPath.close();
            this.mWidth = width;
            this.mHeight = height;
        }
        canvas.drawPath(this.mPath, this.mPaint);
    }
}
