package com.lenzetech.isearchingtwo.Bean;

import android.content.Context;
import java.util.ArrayList;

/* loaded from: classes.dex */
public class NoteLab {
    private static NoteLab sNoteLab;
    private ArrayList<Note> notes = new ArrayList<>();

    private NoteLab(Context context) {
        for (int i = 0; i < 100; i++) {
            Note note = new Note();
            note.setTitle("this is title " + i);
            note.setContent("this is content" + i + "balabalabalabalalabalabalabalabalala\nbalabalabalabalalabalabalabala    balala\nbalabalabalabalalabalabalabalabalala\nbalabalabalabalalabalabalab    alabalala\nbalabalabalabalalabalabalabalabalala\n");
            this.notes.add(note);
        }
    }

    public static NoteLab getNoteLab(Context context) {
        if (sNoteLab == null) {
            sNoteLab = new NoteLab(context);
        }
        return sNoteLab;
    }

    public ArrayList<Note> getNotes() {
        return this.notes;
    }
}
