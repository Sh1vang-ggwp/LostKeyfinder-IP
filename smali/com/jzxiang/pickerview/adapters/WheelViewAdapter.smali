.class public interface abstract Lcom/jzxiang/pickerview/adapters/WheelViewAdapter;
.super Ljava/lang/Object;
.source "WheelViewAdapter.java"


# virtual methods
.method public abstract getConfig()Lcom/jzxiang/pickerview/config/PickerConfig;
.end method

.method public abstract getEmptyItem(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end method

.method public abstract getItem(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end method

.method public abstract getItemsCount()I
.end method

.method public abstract registerDataSetObserver(Landroid/database/DataSetObserver;)V
.end method

.method public abstract setConfig(Lcom/jzxiang/pickerview/config/PickerConfig;)V
.end method

.method public abstract unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
.end method
