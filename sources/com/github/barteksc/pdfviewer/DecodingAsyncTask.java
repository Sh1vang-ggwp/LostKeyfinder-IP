package com.github.barteksc.pdfviewer;

import android.os.AsyncTask;
import com.github.barteksc.pdfviewer.source.DocumentSource;
import com.shockwave.pdfium.PdfiumCore;
import com.shockwave.pdfium.util.Size;

/* loaded from: classes.dex */
class DecodingAsyncTask extends AsyncTask<Void, Void, Throwable> {
    private boolean cancelled = false;
    private DocumentSource docSource;
    private String password;
    private PdfFile pdfFile;
    private PDFView pdfView;
    private PdfiumCore pdfiumCore;
    private int[] userPages;

    DecodingAsyncTask(DocumentSource documentSource, String str, int[] iArr, PDFView pDFView, PdfiumCore pdfiumCore) {
        this.docSource = documentSource;
        this.userPages = iArr;
        this.pdfView = pDFView;
        this.password = str;
        this.pdfiumCore = pdfiumCore;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Throwable doInBackground(Void... voidArr) {
        try {
            this.pdfFile = new PdfFile(this.pdfiumCore, this.docSource.createDocument(this.pdfView.getContext(), this.pdfiumCore, this.password), this.pdfView.getPageFitPolicy(), getViewSize(), this.userPages, this.pdfView.isSwipeVertical(), this.pdfView.getSpacingPx(), this.pdfView.doAutoSpacing());
            return null;
        } catch (Throwable th) {
            return th;
        }
    }

    private Size getViewSize() {
        return new Size(this.pdfView.getWidth(), this.pdfView.getHeight());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(Throwable th) {
        if (th != null) {
            this.pdfView.loadError(th);
        } else {
            if (this.cancelled) {
                return;
            }
            this.pdfView.loadComplete(this.pdfFile);
        }
    }

    @Override // android.os.AsyncTask
    protected void onCancelled() {
        this.cancelled = true;
    }
}
