package com.jzxiang.pickerview.adapters;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.jzxiang.pickerview.R;
import com.jzxiang.pickerview.config.PickerConfig;

/* loaded from: classes.dex */
public abstract class AbstractWheelTextAdapter extends AbstractWheelAdapter {
    public static final int DEFAULT_TEXT_SIZE = 24;
    public static final int LABEL_COLOR = -9437072;
    protected static final int NO_RESOURCE = 0;
    public static final int TEXT_VIEW_ITEM_RESOURCE = -1;
    protected Context context;
    protected int emptyItemResourceId;
    protected LayoutInflater inflater;
    protected int itemResourceId;
    protected int itemTextResourceId;
    private PickerConfig mPickerConfig;
    private int padding;

    protected abstract CharSequence getItemText(int i);

    protected AbstractWheelTextAdapter(Context context) {
        this(context, -1);
    }

    protected AbstractWheelTextAdapter(Context context, int i) {
        this(context, i, 0);
    }

    protected AbstractWheelTextAdapter(Context context, int i, int i2) {
        this.padding = 0;
        this.context = context;
        this.itemResourceId = i;
        this.itemTextResourceId = i2;
        this.padding = context.getResources().getDimensionPixelSize(R.dimen.textview_default_padding);
        this.inflater = (LayoutInflater) context.getSystemService("layout_inflater");
    }

    public int getItemResource() {
        return this.itemResourceId;
    }

    public void setItemResource(int i) {
        this.itemResourceId = i;
    }

    public int getItemTextResource() {
        return this.itemTextResourceId;
    }

    public void setItemTextResource(int i) {
        this.itemTextResourceId = i;
    }

    public int getEmptyItemResource() {
        return this.emptyItemResourceId;
    }

    public void setEmptyItemResource(int i) {
        this.emptyItemResourceId = i;
    }

    @Override // com.jzxiang.pickerview.adapters.WheelViewAdapter
    public View getItem(int i, View view, ViewGroup viewGroup) {
        if (i < 0 || i >= getItemsCount()) {
            return null;
        }
        if (view == null) {
            view = getView(this.itemResourceId, viewGroup);
        }
        TextView textView = getTextView(view, this.itemTextResourceId);
        if (textView != null) {
            CharSequence itemText = getItemText(i);
            if (itemText == null) {
                itemText = "";
            }
            textView.setText(itemText);
            if (this.itemResourceId == -1) {
                configureTextView(textView);
            }
        }
        return view;
    }

    @Override // com.jzxiang.pickerview.adapters.AbstractWheelAdapter, com.jzxiang.pickerview.adapters.WheelViewAdapter
    public View getEmptyItem(View view, ViewGroup viewGroup) {
        if (view == null) {
            view = getView(this.emptyItemResourceId, viewGroup);
        }
        if (this.emptyItemResourceId == -1 && (view instanceof TextView)) {
            configureTextView((TextView) view);
        }
        return view;
    }

    protected void configureTextView(TextView textView) {
        if (this.mPickerConfig == null) {
            this.mPickerConfig = new PickerConfig();
        }
        textView.setTextColor(this.mPickerConfig.mWheelTVNormalColor);
        textView.setGravity(17);
        int i = this.padding;
        textView.setPadding(0, i, 0, i);
        textView.setTextSize(this.mPickerConfig.mWheelTVSize);
        textView.setLines(1);
    }

    private TextView getTextView(View view, int i) {
        TextView textView;
        if (i == 0) {
            try {
                if (view instanceof TextView) {
                    textView = (TextView) view;
                    return textView;
                }
            } catch (ClassCastException e) {
                Log.e("AbstractWheelAdapter", "You must supply a resource ID for a TextView");
                throw new IllegalStateException("AbstractWheelAdapter requires the resource ID to be a TextView", e);
            }
        }
        textView = i != 0 ? (TextView) view.findViewById(i) : null;
        return textView;
    }

    private View getView(int i, ViewGroup viewGroup) {
        if (i == -1) {
            return new TextView(this.context);
        }
        if (i != 0) {
            return this.inflater.inflate(i, viewGroup, false);
        }
        return null;
    }

    @Override // com.jzxiang.pickerview.adapters.WheelViewAdapter
    public PickerConfig getConfig() {
        if (this.mPickerConfig == null) {
            this.mPickerConfig = new PickerConfig();
        }
        return this.mPickerConfig;
    }

    @Override // com.jzxiang.pickerview.adapters.WheelViewAdapter
    public void setConfig(PickerConfig pickerConfig) {
        this.mPickerConfig = pickerConfig;
    }
}
