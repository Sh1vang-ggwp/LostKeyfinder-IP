package com.github.barteksc.pdfviewer;

import android.graphics.RectF;
import com.github.barteksc.pdfviewer.util.Constants;
import com.github.barteksc.pdfviewer.util.MathUtils;
import com.github.barteksc.pdfviewer.util.Util;
import com.shockwave.pdfium.util.SizeF;

/* loaded from: classes.dex */
class PagesLoader {
    private int cacheOrder;
    private final GridSize firstGrid;
    private final Holder firstHolder;
    private final GridSize lastGrid;
    private final Holder lastHolder;
    private final GridSize middleGrid;
    private float pageRelativePartHeight;
    private float pageRelativePartWidth;
    private float partRenderHeight;
    private float partRenderWidth;
    private PDFView pdfView;
    private final int preloadOffset;
    private final RectF thumbnailRect = new RectF(0.0f, 0.0f, 1.0f, 1.0f);
    private float xOffset;
    private float yOffset;

    private class Holder {
        int col;
        int page;
        int row;

        private Holder() {
        }
    }

    private class GridSize {
        int cols;
        int rows;

        private GridSize() {
        }
    }

    PagesLoader(PDFView pDFView) {
        this.firstHolder = new Holder();
        this.lastHolder = new Holder();
        this.firstGrid = new GridSize();
        this.lastGrid = new GridSize();
        this.middleGrid = new GridSize();
        this.pdfView = pDFView;
        this.preloadOffset = Util.getDP(pDFView.getContext(), Constants.PRELOAD_OFFSET);
    }

    private void getPageColsRows(GridSize gridSize, int i) {
        SizeF pageSize = this.pdfView.pdfFile.getPageSize(i);
        float width = 1.0f / pageSize.getWidth();
        float height = (Constants.PART_SIZE * (1.0f / pageSize.getHeight())) / this.pdfView.getZoom();
        float zoom = (Constants.PART_SIZE * width) / this.pdfView.getZoom();
        gridSize.rows = MathUtils.ceil(1.0f / height);
        gridSize.cols = MathUtils.ceil(1.0f / zoom);
    }

    private Holder getPageAndCoordsByOffset(Holder holder, GridSize gridSize, float f, float f2, boolean z) {
        float min;
        float f3;
        float f4 = -MathUtils.max(f, 0.0f);
        float f5 = -MathUtils.max(f2, 0.0f);
        holder.page = this.pdfView.pdfFile.getPageAtOffset(this.pdfView.isSwipeVertical() ? f5 : f4, this.pdfView.getZoom());
        getPageColsRows(gridSize, holder.page);
        SizeF scaledPageSize = this.pdfView.pdfFile.getScaledPageSize(holder.page, this.pdfView.getZoom());
        float height = scaledPageSize.getHeight() / gridSize.rows;
        float width = scaledPageSize.getWidth() / gridSize.cols;
        float secondaryPageOffset = this.pdfView.pdfFile.getSecondaryPageOffset(holder.page, this.pdfView.getZoom());
        if (this.pdfView.isSwipeVertical()) {
            min = Math.abs(f5 - this.pdfView.pdfFile.getPageOffset(holder.page, this.pdfView.getZoom())) / height;
            f3 = MathUtils.min(f4 - secondaryPageOffset, 0.0f) / width;
        } else {
            float abs = Math.abs(f4 - this.pdfView.pdfFile.getPageOffset(holder.page, this.pdfView.getZoom())) / width;
            min = MathUtils.min(f5 - secondaryPageOffset, 0.0f) / height;
            f3 = abs;
        }
        if (z) {
            holder.row = MathUtils.ceil(min);
            holder.col = MathUtils.ceil(f3);
        } else {
            holder.row = MathUtils.floor(min);
            holder.col = MathUtils.floor(f3);
        }
        return holder;
    }

    private void calculatePartSize(GridSize gridSize) {
        this.pageRelativePartWidth = 1.0f / gridSize.cols;
        this.pageRelativePartHeight = 1.0f / gridSize.rows;
        this.partRenderWidth = Constants.PART_SIZE / this.pageRelativePartWidth;
        this.partRenderHeight = Constants.PART_SIZE / this.pageRelativePartHeight;
    }

    private void loadVisible() {
        int loadWholePage;
        float zoom = this.preloadOffset * this.pdfView.getZoom();
        float f = this.xOffset;
        float f2 = (-f) + zoom;
        float width = ((-f) - this.pdfView.getWidth()) - zoom;
        float f3 = this.yOffset;
        getPageAndCoordsByOffset(this.firstHolder, this.firstGrid, f2, (-f3) + zoom, false);
        getPageAndCoordsByOffset(this.lastHolder, this.lastGrid, width, ((-f3) - this.pdfView.getHeight()) - zoom, true);
        for (int i = this.firstHolder.page; i <= this.lastHolder.page; i++) {
            loadThumbnail(i);
        }
        int i2 = (this.lastHolder.page - this.firstHolder.page) + 1;
        int i3 = 0;
        for (int i4 = this.firstHolder.page; i4 <= this.lastHolder.page && i3 < Constants.Cache.CACHE_SIZE; i4++) {
            if (i4 == this.firstHolder.page && i2 > 1) {
                loadWholePage = loadPageEnd(this.firstHolder, this.firstGrid, Constants.Cache.CACHE_SIZE - i3);
            } else if (i4 == this.lastHolder.page && i2 > 1) {
                loadWholePage = loadPageStart(this.lastHolder, this.lastGrid, Constants.Cache.CACHE_SIZE - i3);
            } else if (i2 == 1) {
                loadWholePage = loadPageCenter(this.firstHolder, this.lastHolder, this.firstGrid, Constants.Cache.CACHE_SIZE - i3);
            } else {
                getPageColsRows(this.middleGrid, i4);
                loadWholePage = loadWholePage(i4, this.middleGrid, Constants.Cache.CACHE_SIZE - i3);
            }
            i3 += loadWholePage;
        }
    }

    private int loadWholePage(int i, GridSize gridSize, int i2) {
        calculatePartSize(gridSize);
        return loadPage(i, 0, gridSize.rows - 1, 0, gridSize.cols - 1, i2);
    }

    private int loadPageCenter(Holder holder, Holder holder2, GridSize gridSize, int i) {
        calculatePartSize(gridSize);
        return loadPage(holder.page, holder.row, holder2.row, holder.col, holder2.col, i);
    }

    private int loadPageEnd(Holder holder, GridSize gridSize, int i) {
        calculatePartSize(gridSize);
        if (this.pdfView.isSwipeVertical()) {
            return loadPage(holder.page, holder.row, gridSize.rows - 1, 0, gridSize.cols - 1, i);
        }
        return loadPage(holder.page, 0, gridSize.rows - 1, holder.col, gridSize.cols - 1, i);
    }

    private int loadPageStart(Holder holder, GridSize gridSize, int i) {
        calculatePartSize(gridSize);
        if (this.pdfView.isSwipeVertical()) {
            return loadPage(holder.page, 0, holder.row, 0, gridSize.cols - 1, i);
        }
        return loadPage(holder.page, 0, gridSize.rows - 1, 0, holder.col, i);
    }

    private int loadPage(int i, int i2, int i3, int i4, int i5, int i6) {
        int i7 = 0;
        while (i2 <= i3) {
            for (int i8 = i4; i8 <= i5; i8++) {
                if (loadCell(i, i2, i8, this.pageRelativePartWidth, this.pageRelativePartHeight)) {
                    i7++;
                }
                if (i7 >= i6) {
                    return i7;
                }
            }
            i2++;
        }
        return i7;
    }

    private boolean loadCell(int i, int i2, int i3, float f, float f2) {
        float f3 = i3 * f;
        float f4 = i2 * f2;
        float f5 = this.partRenderWidth;
        float f6 = this.partRenderHeight;
        float f7 = f3 + f > 1.0f ? 1.0f - f3 : f;
        float f8 = f4 + f2 > 1.0f ? 1.0f - f4 : f2;
        float f9 = f5 * f7;
        float f10 = f6 * f8;
        RectF rectF = new RectF(f3, f4, f7 + f3, f8 + f4);
        if (f9 <= 0.0f || f10 <= 0.0f) {
            return false;
        }
        if (!this.pdfView.cacheManager.upPartIfContained(i, rectF, this.cacheOrder)) {
            this.pdfView.renderingHandler.addRenderingTask(i, f9, f10, rectF, false, this.cacheOrder, this.pdfView.isBestQuality(), this.pdfView.isAnnotationRendering());
        }
        this.cacheOrder++;
        return true;
    }

    private void loadThumbnail(int i) {
        SizeF pageSize = this.pdfView.pdfFile.getPageSize(i);
        float width = pageSize.getWidth() * Constants.THUMBNAIL_RATIO;
        float height = pageSize.getHeight() * Constants.THUMBNAIL_RATIO;
        if (this.pdfView.cacheManager.containsThumbnail(i, this.thumbnailRect)) {
            return;
        }
        this.pdfView.renderingHandler.addRenderingTask(i, width, height, this.thumbnailRect, true, 0, this.pdfView.isBestQuality(), this.pdfView.isAnnotationRendering());
    }

    void loadPages() {
        this.cacheOrder = 1;
        this.xOffset = -MathUtils.max(this.pdfView.getCurrentXOffset(), 0.0f);
        this.yOffset = -MathUtils.max(this.pdfView.getCurrentYOffset(), 0.0f);
        loadVisible();
    }
}
