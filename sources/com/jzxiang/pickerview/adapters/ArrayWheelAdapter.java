package com.jzxiang.pickerview.adapters;

import android.content.Context;

/* loaded from: classes.dex */
public class ArrayWheelAdapter<T> extends AbstractWheelTextAdapter {
    private T[] items;

    public ArrayWheelAdapter(Context context, T[] tArr) {
        super(context);
        this.items = tArr;
    }

    @Override // com.jzxiang.pickerview.adapters.AbstractWheelTextAdapter
    public CharSequence getItemText(int i) {
        if (i < 0) {
            return null;
        }
        T[] tArr = this.items;
        if (i >= tArr.length) {
            return null;
        }
        T t = tArr[i];
        if (t instanceof CharSequence) {
            return (CharSequence) t;
        }
        return t.toString();
    }

    @Override // com.jzxiang.pickerview.adapters.WheelViewAdapter
    public int getItemsCount() {
        return this.items.length;
    }
}
