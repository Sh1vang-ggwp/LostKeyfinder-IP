package com.jzxiang.pickerview.adapters;

import android.content.Context;
import android.text.TextUtils;

/* loaded from: classes.dex */
public class NumericWheelAdapter extends AbstractWheelTextAdapter {
    public static final int DEFAULT_MAX_VALUE = 9;
    private static final int DEFAULT_MIN_VALUE = 0;
    private String format;
    private int maxValue;
    private int minValue;
    private String unit;

    public NumericWheelAdapter(Context context) {
        this(context, 0, 9);
    }

    public NumericWheelAdapter(Context context, int i, int i2) {
        this(context, i, i2, null);
    }

    public NumericWheelAdapter(Context context, int i, int i2, String str) {
        this(context, i, i2, str, null);
    }

    public NumericWheelAdapter(Context context, int i, int i2, String str, String str2) {
        super(context);
        this.minValue = i;
        this.maxValue = i2;
        this.format = str;
        this.unit = str2;
    }

    @Override // com.jzxiang.pickerview.adapters.AbstractWheelTextAdapter
    public CharSequence getItemText(int i) {
        if (i < 0 || i >= getItemsCount()) {
            return null;
        }
        int i2 = this.minValue + i;
        String format = !TextUtils.isEmpty(this.format) ? String.format(this.format, Integer.valueOf(i2)) : Integer.toString(i2);
        if (TextUtils.isEmpty(this.unit)) {
            return format;
        }
        return format + this.unit;
    }

    @Override // com.jzxiang.pickerview.adapters.WheelViewAdapter
    public int getItemsCount() {
        return (this.maxValue - this.minValue) + 1;
    }
}
