package com.jianjin.camera.widget;

import android.R;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: classes.dex */
public class CameraAreaView extends View {
    private int CORNER_LENGTH;
    private int CORNER_WIDTH;
    private int height;
    private Paint mPaint;
    private int width;

    public CameraAreaView(Context context) {
        this(context, null);
    }

    public CameraAreaView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public CameraAreaView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.CORNER_WIDTH = 12;
        this.CORNER_LENGTH = 44;
        setBackgroundResource(R.color.transparent);
        Paint paint = new Paint();
        this.mPaint = paint;
        paint.setColor(-1);
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        this.width = getMeasuredWidth();
        this.height = getMeasuredHeight();
    }

    @Override // android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawRect(0.0f, 0.0f, this.CORNER_WIDTH, this.CORNER_LENGTH, this.mPaint);
        canvas.drawRect(0.0f, 0.0f, this.CORNER_LENGTH, this.CORNER_WIDTH, this.mPaint);
        canvas.drawRect(r0 - this.CORNER_LENGTH, 0.0f, this.width, this.CORNER_WIDTH, this.mPaint);
        canvas.drawRect(r0 - this.CORNER_WIDTH, 0.0f, this.width, this.CORNER_LENGTH, this.mPaint);
        canvas.drawRect(0.0f, r0 - this.CORNER_LENGTH, this.CORNER_WIDTH, this.height, this.mPaint);
        canvas.drawRect(0.0f, r0 - this.CORNER_WIDTH, this.CORNER_LENGTH, this.height, this.mPaint);
        int i = this.width;
        canvas.drawRect(i - this.CORNER_LENGTH, r1 - this.CORNER_WIDTH, i, this.height, this.mPaint);
        int i2 = this.width;
        canvas.drawRect(i2 - this.CORNER_WIDTH, r1 - this.CORNER_LENGTH, i2, this.height, this.mPaint);
    }
}
