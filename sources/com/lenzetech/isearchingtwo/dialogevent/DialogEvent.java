package com.lenzetech.isearchingtwo.dialogevent;

/* loaded from: classes.dex */
public class DialogEvent {
    private final String mAddress;
    private final DialogState mDialogState;
    private final boolean mIsDoubleClick;

    public DialogEvent(DialogState dialogState, String str) {
        this.mDialogState = dialogState;
        this.mAddress = str;
        this.mIsDoubleClick = false;
    }

    public DialogEvent(DialogState dialogState, String str, Boolean bool) {
        this.mDialogState = dialogState;
        this.mAddress = str;
        this.mIsDoubleClick = bool.booleanValue();
    }

    public DialogState getmDialogState() {
        return this.mDialogState;
    }

    public String getAddress() {
        return this.mAddress;
    }

    public boolean isDoubleClick() {
        return this.mIsDoubleClick;
    }
}
