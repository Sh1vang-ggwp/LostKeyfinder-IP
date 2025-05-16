package com.jianjin.camera.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Point;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import androidx.appcompat.widget.AppCompatImageView;
import com.jianjin.camera.R;

/* loaded from: classes.dex */
public class FocusImageView extends AppCompatImageView {
    private static final int NO_ID = -1;
    public static final String TAG = "FocusImageView";
    private Animation mAnimation;
    private int mFocusFailedImg;
    private int mFocusImg;
    private int mFocusSucceedImg;
    private Handler mHandler;

    public FocusImageView(Context context) {
        this(context, null);
    }

    public FocusImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public FocusImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mFocusImg = -1;
        this.mFocusSucceedImg = -1;
        this.mFocusFailedImg = -1;
        this.mAnimation = AnimationUtils.loadAnimation(getContext(), R.anim.focusview_show);
        setVisibility(8);
        this.mHandler = new Handler();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.FocusImageView);
        this.mFocusImg = obtainStyledAttributes.getResourceId(R.styleable.FocusImageView_focus_focusing_id, -1);
        this.mFocusSucceedImg = obtainStyledAttributes.getResourceId(R.styleable.FocusImageView_focus_success_id, -1);
        this.mFocusFailedImg = obtainStyledAttributes.getResourceId(R.styleable.FocusImageView_focus_fail_id, -1);
        obtainStyledAttributes.recycle();
        if (this.mFocusImg == -1 || this.mFocusSucceedImg == -1 || this.mFocusFailedImg == -1) {
            throw new RuntimeException("mFocusImg,mFocusSucceedImg,mFocusFailedImg is null");
        }
    }

    public void startFocus(Point point) {
        if (this.mFocusImg == -1 || this.mFocusSucceedImg == -1 || this.mFocusFailedImg == -1) {
            throw new RuntimeException("focus image is null");
        }
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) getLayoutParams();
        layoutParams.topMargin = point.y - (getMeasuredHeight() / 2);
        layoutParams.leftMargin = point.x - (getMeasuredWidth() / 2);
        setLayoutParams(layoutParams);
        setVisibility(0);
        setImageResource(this.mFocusImg);
        startAnimation(this.mAnimation);
        this.mHandler.postDelayed(new Runnable() { // from class: com.jianjin.camera.widget.FocusImageView.1
            @Override // java.lang.Runnable
            public void run() {
                FocusImageView.this.setVisibility(8);
            }
        }, 3500L);
    }

    public void onFocusSuccess() {
        setImageResource(this.mFocusSucceedImg);
        this.mHandler.removeCallbacks(null, null);
        this.mHandler.postDelayed(new Runnable() { // from class: com.jianjin.camera.widget.FocusImageView.2
            @Override // java.lang.Runnable
            public void run() {
                FocusImageView.this.setVisibility(8);
            }
        }, 1000L);
    }

    public void onFocusFailed() {
        setImageResource(this.mFocusFailedImg);
        this.mHandler.removeCallbacks(null, null);
        this.mHandler.postDelayed(new Runnable() { // from class: com.jianjin.camera.widget.FocusImageView.3
            @Override // java.lang.Runnable
            public void run() {
                FocusImageView.this.setVisibility(8);
            }
        }, 1000L);
    }

    public void setFocusImg(int i) {
        this.mFocusImg = i;
    }

    public void setFocusSucceedImg(int i) {
        this.mFocusSucceedImg = i;
    }
}
