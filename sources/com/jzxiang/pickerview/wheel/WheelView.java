package com.jzxiang.pickerview.wheel;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.blankj.utilcode.constant.MemoryConstants;
import com.jzxiang.pickerview.R;
import com.jzxiang.pickerview.adapters.WheelViewAdapter;
import com.jzxiang.pickerview.config.DefaultConfig;
import com.jzxiang.pickerview.config.PickerConfig;
import com.jzxiang.pickerview.wheel.WheelScroller;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* loaded from: classes.dex */
public class WheelView extends View {
    private static final int DEF_VISIBLE_ITEMS = 5;
    private static final int ITEM_OFFSET_PERCENT = 10;
    private static final int PADDING = 10;
    private List<OnWheelChangedListener> changingListeners;
    private List<OnWheelClickedListener> clickingListeners;
    private int currentItem;
    private DataSetObserver dataObserver;
    int defaultColor;
    private int firstItem;
    boolean isCyclic;
    private boolean isScrollingPerformed;
    private int itemHeight;
    private LinearLayout itemsLayout;
    private int mLineRightMar;
    private Paint mPaintLineCenter;
    private Paint mPaintLineRight;
    private Paint mPaintRectCenter;
    private WheelRecycle recycle;
    private WheelScroller scroller;
    WheelScroller.ScrollingListener scrollingListener;
    private List<OnWheelScrollListener> scrollingListeners;
    private int scrollingOffset;
    int selectorColor;
    private WheelViewAdapter viewAdapter;
    private int visibleItems;

    public WheelView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.isCyclic = false;
        this.currentItem = 0;
        this.visibleItems = 5;
        this.itemHeight = 0;
        this.recycle = new WheelRecycle(this);
        this.changingListeners = new LinkedList();
        this.scrollingListeners = new LinkedList();
        this.scrollingListener = new WheelScroller.ScrollingListener() { // from class: com.jzxiang.pickerview.wheel.WheelView.1
            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onStarted() {
                WheelView.this.isScrollingPerformed = true;
                WheelView.this.notifyScrollingListenersAboutStart();
            }

            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onScroll(int i2) {
                WheelView.this.doScroll(i2);
                int height = WheelView.this.getHeight();
                if (WheelView.this.scrollingOffset > height) {
                    WheelView.this.scrollingOffset = height;
                    WheelView.this.scroller.stopScrolling();
                    return;
                }
                int i3 = -height;
                if (WheelView.this.scrollingOffset < i3) {
                    WheelView.this.scrollingOffset = i3;
                    WheelView.this.scroller.stopScrolling();
                }
            }

            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onFinished() {
                if (WheelView.this.isScrollingPerformed) {
                    WheelView.this.notifyScrollingListenersAboutEnd();
                    WheelView.this.isScrollingPerformed = false;
                }
                WheelView.this.scrollingOffset = 0;
                WheelView.this.invalidate();
            }

            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onJustify() {
                if (Math.abs(WheelView.this.scrollingOffset) > 1) {
                    WheelView.this.scroller.scroll(WheelView.this.scrollingOffset, 0);
                }
            }
        };
        this.clickingListeners = new LinkedList();
        this.dataObserver = new DataSetObserver() { // from class: com.jzxiang.pickerview.wheel.WheelView.2
            @Override // android.database.DataSetObserver
            public void onChanged() {
                WheelView.this.invalidateWheel(false);
            }

            @Override // android.database.DataSetObserver
            public void onInvalidated() {
                WheelView.this.invalidateWheel(true);
            }
        };
        initData(context);
    }

    public WheelView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.isCyclic = false;
        this.currentItem = 0;
        this.visibleItems = 5;
        this.itemHeight = 0;
        this.recycle = new WheelRecycle(this);
        this.changingListeners = new LinkedList();
        this.scrollingListeners = new LinkedList();
        this.scrollingListener = new WheelScroller.ScrollingListener() { // from class: com.jzxiang.pickerview.wheel.WheelView.1
            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onStarted() {
                WheelView.this.isScrollingPerformed = true;
                WheelView.this.notifyScrollingListenersAboutStart();
            }

            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onScroll(int i2) {
                WheelView.this.doScroll(i2);
                int height = WheelView.this.getHeight();
                if (WheelView.this.scrollingOffset > height) {
                    WheelView.this.scrollingOffset = height;
                    WheelView.this.scroller.stopScrolling();
                    return;
                }
                int i3 = -height;
                if (WheelView.this.scrollingOffset < i3) {
                    WheelView.this.scrollingOffset = i3;
                    WheelView.this.scroller.stopScrolling();
                }
            }

            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onFinished() {
                if (WheelView.this.isScrollingPerformed) {
                    WheelView.this.notifyScrollingListenersAboutEnd();
                    WheelView.this.isScrollingPerformed = false;
                }
                WheelView.this.scrollingOffset = 0;
                WheelView.this.invalidate();
            }

            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onJustify() {
                if (Math.abs(WheelView.this.scrollingOffset) > 1) {
                    WheelView.this.scroller.scroll(WheelView.this.scrollingOffset, 0);
                }
            }
        };
        this.clickingListeners = new LinkedList();
        this.dataObserver = new DataSetObserver() { // from class: com.jzxiang.pickerview.wheel.WheelView.2
            @Override // android.database.DataSetObserver
            public void onChanged() {
                WheelView.this.invalidateWheel(false);
            }

            @Override // android.database.DataSetObserver
            public void onInvalidated() {
                WheelView.this.invalidateWheel(true);
            }
        };
        initData(context);
    }

    public WheelView(Context context) {
        super(context);
        this.isCyclic = false;
        this.currentItem = 0;
        this.visibleItems = 5;
        this.itemHeight = 0;
        this.recycle = new WheelRecycle(this);
        this.changingListeners = new LinkedList();
        this.scrollingListeners = new LinkedList();
        this.scrollingListener = new WheelScroller.ScrollingListener() { // from class: com.jzxiang.pickerview.wheel.WheelView.1
            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onStarted() {
                WheelView.this.isScrollingPerformed = true;
                WheelView.this.notifyScrollingListenersAboutStart();
            }

            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onScroll(int i2) {
                WheelView.this.doScroll(i2);
                int height = WheelView.this.getHeight();
                if (WheelView.this.scrollingOffset > height) {
                    WheelView.this.scrollingOffset = height;
                    WheelView.this.scroller.stopScrolling();
                    return;
                }
                int i3 = -height;
                if (WheelView.this.scrollingOffset < i3) {
                    WheelView.this.scrollingOffset = i3;
                    WheelView.this.scroller.stopScrolling();
                }
            }

            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onFinished() {
                if (WheelView.this.isScrollingPerformed) {
                    WheelView.this.notifyScrollingListenersAboutEnd();
                    WheelView.this.isScrollingPerformed = false;
                }
                WheelView.this.scrollingOffset = 0;
                WheelView.this.invalidate();
            }

            @Override // com.jzxiang.pickerview.wheel.WheelScroller.ScrollingListener
            public void onJustify() {
                if (Math.abs(WheelView.this.scrollingOffset) > 1) {
                    WheelView.this.scroller.scroll(WheelView.this.scrollingOffset, 0);
                }
            }
        };
        this.clickingListeners = new LinkedList();
        this.dataObserver = new DataSetObserver() { // from class: com.jzxiang.pickerview.wheel.WheelView.2
            @Override // android.database.DataSetObserver
            public void onChanged() {
                WheelView.this.invalidateWheel(false);
            }

            @Override // android.database.DataSetObserver
            public void onInvalidated() {
                WheelView.this.invalidateWheel(true);
            }
        };
        initData(context);
    }

    private void initData(Context context) {
        this.scroller = new WheelScroller(getContext(), this.scrollingListener);
        Paint paint = new Paint();
        this.mPaintLineCenter = paint;
        paint.setColor(DefaultConfig.COLOR);
        this.mPaintLineCenter.setAntiAlias(true);
        this.mPaintLineCenter.setStrokeWidth(1.0f);
        this.mPaintLineCenter.setStyle(Paint.Style.FILL);
        Paint paint2 = new Paint();
        this.mPaintLineRight = paint2;
        paint2.setColor(-1513240);
        this.mPaintLineRight.setAntiAlias(true);
        this.mPaintLineRight.setStrokeWidth(1.0f);
        this.mPaintLineRight.setStyle(Paint.Style.FILL);
        Paint paint3 = new Paint();
        this.mPaintRectCenter = paint3;
        paint3.setColor(DefaultConfig.COLOR);
        this.mPaintRectCenter.setAlpha(25);
        this.mPaintRectCenter.setAntiAlias(true);
        this.mPaintRectCenter.setStyle(Paint.Style.FILL);
        this.mLineRightMar = context.getResources().getDimensionPixelSize(R.dimen.picker_line_mar);
        this.defaultColor = DefaultConfig.TV_NORMAL_COLOR;
        this.selectorColor = DefaultConfig.TV_SELECTOR_COLOR;
    }

    public void setConfig(PickerConfig pickerConfig) {
        this.mPaintLineCenter.setColor(pickerConfig.mThemeColor);
        this.mPaintRectCenter.setColor(pickerConfig.mThemeColor);
        this.mPaintRectCenter.setAlpha(25);
        this.defaultColor = pickerConfig.mWheelTVNormalColor;
        this.selectorColor = pickerConfig.mWheelTVSelectorColor;
    }

    public void setInterpolator(Interpolator interpolator) {
        this.scroller.setInterpolator(interpolator);
    }

    public int getVisibleItems() {
        return this.visibleItems;
    }

    public void setVisibleItems(int i) {
        this.visibleItems = i;
    }

    public WheelViewAdapter getViewAdapter() {
        return this.viewAdapter;
    }

    public void setViewAdapter(WheelViewAdapter wheelViewAdapter) {
        WheelViewAdapter wheelViewAdapter2 = this.viewAdapter;
        if (wheelViewAdapter2 != null) {
            wheelViewAdapter2.unregisterDataSetObserver(this.dataObserver);
        }
        this.viewAdapter = wheelViewAdapter;
        if (wheelViewAdapter != null) {
            wheelViewAdapter.registerDataSetObserver(this.dataObserver);
        }
        setConfig(wheelViewAdapter.getConfig());
        invalidateWheel(true);
    }

    public void addChangingListener(OnWheelChangedListener onWheelChangedListener) {
        this.changingListeners.add(onWheelChangedListener);
    }

    public void removeChangingListener(OnWheelChangedListener onWheelChangedListener) {
        this.changingListeners.remove(onWheelChangedListener);
    }

    protected void notifyChangingListeners(int i, int i2) {
        LinearLayout linearLayout;
        Iterator<OnWheelChangedListener> it = this.changingListeners.iterator();
        while (it.hasNext()) {
            it.next().onChanged(this, i, i2);
        }
        if (i < 0 || i2 < 0 || (linearLayout = this.itemsLayout) == null) {
            return;
        }
        View childAt = linearLayout.getChildAt(i - this.firstItem);
        View childAt2 = this.itemsLayout.getChildAt(i2 - this.firstItem);
        refreshTextStatus(childAt, i);
        refreshTextStatus(childAt2, i2);
    }

    public void addScrollingListener(OnWheelScrollListener onWheelScrollListener) {
        this.scrollingListeners.add(onWheelScrollListener);
    }

    public void removeScrollingListener(OnWheelScrollListener onWheelScrollListener) {
        this.scrollingListeners.remove(onWheelScrollListener);
    }

    protected void notifyScrollingListenersAboutStart() {
        Iterator<OnWheelScrollListener> it = this.scrollingListeners.iterator();
        while (it.hasNext()) {
            it.next().onScrollingStarted(this);
        }
    }

    protected void notifyScrollingListenersAboutEnd() {
        Iterator<OnWheelScrollListener> it = this.scrollingListeners.iterator();
        while (it.hasNext()) {
            it.next().onScrollingFinished(this);
        }
    }

    public void addClickingListener(OnWheelClickedListener onWheelClickedListener) {
        this.clickingListeners.add(onWheelClickedListener);
    }

    public void removeClickingListener(OnWheelClickedListener onWheelClickedListener) {
        this.clickingListeners.remove(onWheelClickedListener);
    }

    protected void notifyClickListenersAboutClick(int i) {
        Iterator<OnWheelClickedListener> it = this.clickingListeners.iterator();
        while (it.hasNext()) {
            it.next().onItemClicked(this, i);
        }
    }

    public int getCurrentItem() {
        return this.currentItem;
    }

    public void setCurrentItem(int i) {
        setCurrentItem(i, false);
    }

    public void setCurrentItem(int i, boolean z) {
        int min;
        WheelViewAdapter wheelViewAdapter = this.viewAdapter;
        if (wheelViewAdapter == null || wheelViewAdapter.getItemsCount() == 0) {
            return;
        }
        int itemsCount = this.viewAdapter.getItemsCount();
        if (i < 0 || i >= itemsCount) {
            if (!this.isCyclic) {
                return;
            }
            while (i < 0) {
                i += itemsCount;
            }
            i %= itemsCount;
        }
        int i2 = this.currentItem;
        if (i != i2) {
            if (z) {
                int i3 = i - i2;
                if (this.isCyclic && (min = (itemsCount + Math.min(i, i2)) - Math.max(i, this.currentItem)) < Math.abs(i3)) {
                    i3 = i3 < 0 ? min : -min;
                }
                scroll(i3, 0);
                return;
            }
            this.scrollingOffset = 0;
            this.currentItem = i;
            notifyChangingListeners(i2, i);
            invalidate();
        }
    }

    public boolean isCyclic() {
        return this.isCyclic;
    }

    public void setCyclic(boolean z) {
        this.isCyclic = z;
        invalidateWheel(false);
    }

    public void invalidateWheel(boolean z) {
        if (z) {
            this.recycle.clearAll();
            LinearLayout linearLayout = this.itemsLayout;
            if (linearLayout != null) {
                linearLayout.removeAllViews();
            }
            this.scrollingOffset = 0;
        } else {
            LinearLayout linearLayout2 = this.itemsLayout;
            if (linearLayout2 != null) {
                this.recycle.recycleItems(linearLayout2, this.firstItem, new ItemsRange(), this.currentItem);
            }
        }
        invalidate();
    }

    private void initResourcesIfNecessary() {
        setBackgroundResource(android.R.color.white);
    }

    private int getDesiredHeight(LinearLayout linearLayout) {
        if (linearLayout != null && linearLayout.getChildAt(0) != null) {
            this.itemHeight = linearLayout.getChildAt(0).getMeasuredHeight();
        }
        int i = this.itemHeight;
        return Math.max((this.visibleItems * i) - ((i * 10) / 50), getSuggestedMinimumHeight());
    }

    private int getItemHeight() {
        int i = this.itemHeight;
        if (i != 0) {
            return i;
        }
        LinearLayout linearLayout = this.itemsLayout;
        if (linearLayout != null && linearLayout.getChildAt(0) != null) {
            int height = this.itemsLayout.getChildAt(0).getHeight();
            this.itemHeight = height;
            return height;
        }
        return getHeight() / this.visibleItems;
    }

    private int calculateLayoutWidth(int i, int i2) {
        initResourcesIfNecessary();
        this.itemsLayout.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
        this.itemsLayout.measure(View.MeasureSpec.makeMeasureSpec(i, 0), View.MeasureSpec.makeMeasureSpec(0, 0));
        int measuredWidth = this.itemsLayout.getMeasuredWidth();
        if (i2 != 1073741824) {
            int max = Math.max(measuredWidth + 20, getSuggestedMinimumWidth());
            if (i2 != Integer.MIN_VALUE || i >= max) {
                i = max;
            }
        }
        this.itemsLayout.measure(View.MeasureSpec.makeMeasureSpec(i - 20, MemoryConstants.GB), View.MeasureSpec.makeMeasureSpec(0, 0));
        return i;
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        int mode = View.MeasureSpec.getMode(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size = View.MeasureSpec.getSize(i);
        int size2 = View.MeasureSpec.getSize(i2);
        buildViewForMeasuring();
        int calculateLayoutWidth = calculateLayoutWidth(size, mode);
        if (mode2 != 1073741824) {
            int desiredHeight = getDesiredHeight(this.itemsLayout);
            size2 = mode2 == Integer.MIN_VALUE ? Math.min(desiredHeight, size2) : desiredHeight;
        }
        setMeasuredDimension(calculateLayoutWidth, size2);
    }

    @Override // android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        layout(i3 - i, i4 - i2);
    }

    private void layout(int i, int i2) {
        this.itemsLayout.layout(0, 0, i - 20, i2);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        WheelViewAdapter wheelViewAdapter = this.viewAdapter;
        if (wheelViewAdapter == null || wheelViewAdapter.getItemsCount() <= 0) {
            return;
        }
        updateView();
        drawItems(canvas);
        drawCenterRect(canvas);
    }

    private void drawItems(Canvas canvas) {
        canvas.save();
        canvas.translate(10.0f, (-(((this.currentItem - this.firstItem) * getItemHeight()) + ((getItemHeight() - getHeight()) / 2))) + this.scrollingOffset);
        this.itemsLayout.draw(canvas);
        canvas.restore();
    }

    private void drawCenterRect(Canvas canvas) {
        int height = getHeight() / 2;
        int itemHeight = (int) ((getItemHeight() / 2) * 1.2d);
        float f = height - itemHeight;
        float f2 = height + itemHeight;
        canvas.drawRect(0.0f, f, getWidth(), f2, this.mPaintRectCenter);
        canvas.drawLine(0.0f, f, getWidth(), f, this.mPaintLineCenter);
        canvas.drawLine(0.0f, f2, getWidth(), f2, this.mPaintLineCenter);
        float width = getWidth() - 1;
        canvas.drawLine(width, this.mLineRightMar, width, getHeight() - this.mLineRightMar, this.mPaintLineRight);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        int itemHeight;
        if (!isEnabled() || getViewAdapter() == null) {
            return true;
        }
        int action = motionEvent.getAction();
        if (action != 1) {
            if (action == 2 && getParent() != null) {
                getParent().requestDisallowInterceptTouchEvent(true);
            }
        } else if (!this.isScrollingPerformed) {
            int y = ((int) motionEvent.getY()) - (getHeight() / 2);
            if (y > 0) {
                itemHeight = y + (getItemHeight() / 2);
            } else {
                itemHeight = y - (getItemHeight() / 2);
            }
            int itemHeight2 = itemHeight / getItemHeight();
            if (itemHeight2 != 0 && isValidItemIndex(this.currentItem + itemHeight2)) {
                notifyClickListenersAboutClick(this.currentItem + itemHeight2);
            }
        }
        return this.scroller.onTouchEvent(motionEvent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doScroll(int i) {
        this.scrollingOffset += i;
        int itemHeight = getItemHeight();
        int i2 = this.scrollingOffset / itemHeight;
        int i3 = this.currentItem - i2;
        int itemsCount = this.viewAdapter.getItemsCount();
        int i4 = this.scrollingOffset % itemHeight;
        if (Math.abs(i4) <= itemHeight / 2) {
            i4 = 0;
        }
        if (this.isCyclic && itemsCount > 0) {
            if (i4 > 0) {
                i3--;
                i2++;
            } else if (i4 < 0) {
                i3++;
                i2--;
            }
            while (i3 < 0) {
                i3 += itemsCount;
            }
            i3 %= itemsCount;
        } else if (i3 < 0) {
            i2 = this.currentItem;
            i3 = 0;
        } else if (i3 >= itemsCount) {
            i2 = (this.currentItem - itemsCount) + 1;
            i3 = itemsCount - 1;
        } else if (i3 > 0 && i4 > 0) {
            i3--;
            i2++;
        } else if (i3 < itemsCount - 1 && i4 < 0) {
            i3++;
            i2--;
        }
        int i5 = this.scrollingOffset;
        if (i3 != this.currentItem) {
            setCurrentItem(i3, false);
        } else {
            invalidate();
        }
        int i6 = i5 - (i2 * itemHeight);
        this.scrollingOffset = i6;
        if (i6 > getHeight()) {
            this.scrollingOffset = (this.scrollingOffset % getHeight()) + getHeight();
        }
    }

    public void scroll(int i, int i2) {
        this.scroller.scroll((i * getItemHeight()) - this.scrollingOffset, i2);
    }

    private ItemsRange getItemsRange() {
        if (getItemHeight() == 0) {
            return null;
        }
        int i = this.currentItem;
        int i2 = 1;
        while (getItemHeight() * i2 < getHeight()) {
            i--;
            i2 += 2;
        }
        int i3 = this.scrollingOffset;
        if (i3 != 0) {
            if (i3 > 0) {
                i--;
            }
            int itemHeight = i3 / getItemHeight();
            i -= itemHeight;
            i2 = (int) (i2 + 1 + Math.asin(itemHeight));
        }
        return new ItemsRange(i, i2);
    }

    private boolean rebuildItems() {
        boolean z;
        ItemsRange itemsRange = getItemsRange();
        LinearLayout linearLayout = this.itemsLayout;
        if (linearLayout != null) {
            int recycleItems = this.recycle.recycleItems(linearLayout, this.firstItem, itemsRange, this.currentItem);
            z = this.firstItem != recycleItems;
            this.firstItem = recycleItems;
        } else {
            createItemsLayout();
            z = true;
        }
        if (!z) {
            z = (this.firstItem == itemsRange.getFirst() && this.itemsLayout.getChildCount() == itemsRange.getCount()) ? false : true;
        }
        if (this.firstItem > itemsRange.getFirst() && this.firstItem <= itemsRange.getLast()) {
            for (int i = this.firstItem - 1; i >= itemsRange.getFirst() && addViewItem(i, true); i--) {
                this.firstItem = i;
            }
        } else {
            this.firstItem = itemsRange.getFirst();
        }
        int i2 = this.firstItem;
        for (int childCount = this.itemsLayout.getChildCount(); childCount < itemsRange.getCount(); childCount++) {
            if (!addViewItem(this.firstItem + childCount, false) && this.itemsLayout.getChildCount() == 0) {
                i2++;
            }
        }
        this.firstItem = i2;
        return z;
    }

    private void updateView() {
        if (rebuildItems()) {
            calculateLayoutWidth(getWidth(), MemoryConstants.GB);
            layout(getWidth(), getHeight());
        }
    }

    private void createItemsLayout() {
        if (this.itemsLayout == null) {
            LinearLayout linearLayout = new LinearLayout(getContext());
            this.itemsLayout = linearLayout;
            linearLayout.setOrientation(1);
        }
    }

    private void buildViewForMeasuring() {
        LinearLayout linearLayout = this.itemsLayout;
        if (linearLayout != null) {
            this.recycle.recycleItems(linearLayout, this.firstItem, new ItemsRange(), this.currentItem);
        } else {
            createItemsLayout();
        }
        int i = this.visibleItems / 2;
        for (int i2 = this.currentItem + i; i2 >= this.currentItem - i; i2--) {
            if (addViewItem(i2, true)) {
                this.firstItem = i2;
            }
        }
    }

    private boolean addViewItem(int i, boolean z) {
        View itemView = getItemView(i);
        refreshTextStatus(itemView, i);
        if (itemView == null) {
            return false;
        }
        if (z) {
            this.itemsLayout.addView(itemView, 0);
        } else {
            this.itemsLayout.addView(itemView);
        }
        return true;
    }

    void refreshTextStatus(View view, int i) {
        if (view instanceof TextView) {
            TextView textView = (TextView) view;
            if (i == this.currentItem) {
                textView.setTextColor(this.selectorColor);
            } else {
                textView.setTextColor(this.defaultColor);
            }
        }
    }

    private boolean isValidItemIndex(int i) {
        WheelViewAdapter wheelViewAdapter = this.viewAdapter;
        return wheelViewAdapter != null && wheelViewAdapter.getItemsCount() > 0 && (this.isCyclic || (i >= 0 && i < this.viewAdapter.getItemsCount()));
    }

    private View getItemView(int i) {
        WheelViewAdapter wheelViewAdapter = this.viewAdapter;
        if (wheelViewAdapter == null || wheelViewAdapter.getItemsCount() == 0) {
            return null;
        }
        int itemsCount = this.viewAdapter.getItemsCount();
        if (!isValidItemIndex(i)) {
            return this.viewAdapter.getEmptyItem(this.recycle.getEmptyItem(), this.itemsLayout);
        }
        while (i < 0) {
            i += itemsCount;
        }
        return this.viewAdapter.getItem(i % itemsCount, this.recycle.getItem(), this.itemsLayout);
    }

    public void stopScrolling() {
        this.scroller.stopScrolling();
    }
}
