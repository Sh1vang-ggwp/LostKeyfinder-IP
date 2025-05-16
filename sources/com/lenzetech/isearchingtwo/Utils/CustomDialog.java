package com.lenzetech.isearchingtwo.Utils;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import com.lenzetech.isearchingtwo.application.MyApplication;

/* loaded from: classes.dex */
public class CustomDialog extends Dialog {
    private boolean cancelTouchout;
    private Context context;
    private int height;
    private View view;
    private int width;

    public CustomDialog(Builder builder) {
        super(builder.context);
        this.context = builder.context;
        this.height = builder.height;
        this.width = builder.width;
        this.cancelTouchout = builder.cancelTouchout;
        this.view = builder.view;
    }

    private CustomDialog(Builder builder, int i) {
        super(builder.context, i);
        this.context = builder.context;
        this.height = builder.height;
        this.width = builder.width;
        this.cancelTouchout = builder.cancelTouchout;
        this.view = builder.view;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(this.view);
        setCanceledOnTouchOutside(this.cancelTouchout);
        Window window = getWindow();
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.gravity = 17;
        attributes.height = this.height;
        attributes.width = this.width;
        window.setAttributes(attributes);
    }

    public void addViewOnclick(int i, MyApplication.DialogClick dialogClick) {
        this.view.findViewById(i).setOnClickListener(dialogClick);
    }

    public static final class Builder {
        private boolean cancelTouchout;
        private Context context;
        private int height;
        private int resStyle = -1;
        private View view;
        private int width;

        public Builder(Context context) {
            this.context = context;
        }

        public Builder view(int i) {
            this.view = LayoutInflater.from(this.context).inflate(i, (ViewGroup) null);
            return this;
        }

        public Builder heightpx(int i) {
            this.height = i;
            return this;
        }

        public Builder widthpx(int i) {
            this.width = i;
            return this;
        }

        public Builder heightdp(int i) {
            this.height = Utils.dp2px(this.context, i);
            return this;
        }

        public Builder widthdp(int i) {
            this.width = Utils.dp2px(this.context, i);
            return this;
        }

        public Builder heightDimenRes(int i) {
            this.height = this.context.getResources().getDimensionPixelOffset(i);
            return this;
        }

        public Builder widthDimenRes(int i) {
            this.width = this.context.getResources().getDimensionPixelOffset(i);
            return this;
        }

        public Builder style(int i) {
            this.resStyle = i;
            return this;
        }

        public Builder cancelTouchout(boolean z) {
            this.cancelTouchout = z;
            return this;
        }

        public Builder addViewOnclick(int i, View.OnClickListener onClickListener) {
            this.view.findViewById(i).setOnClickListener(onClickListener);
            return this;
        }

        public CustomDialog build() {
            if (this.resStyle != -1) {
                return new CustomDialog(this, this.resStyle);
            }
            return new CustomDialog(this);
        }
    }
}
