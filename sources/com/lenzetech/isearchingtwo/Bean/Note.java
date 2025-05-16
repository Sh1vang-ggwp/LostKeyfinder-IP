package com.lenzetech.isearchingtwo.Bean;

import java.util.Date;
import java.util.UUID;

/* loaded from: classes.dex */
public class Note {
    private String content;
    private String tag;
    private String title;
    private UUID uuid = UUID.randomUUID();
    private Date date = new Date();

    public UUID getUuid() {
        return this.uuid;
    }

    public Date getDate() {
        return this.date;
    }

    public void setTitle(String str) {
        this.title = str;
    }

    public String getTitle() {
        return this.title;
    }

    public void setContent(String str) {
        this.content = str;
    }

    public String getContent() {
        return this.content;
    }

    public void setTag(String str) {
        this.tag = str;
    }

    public String getTag() {
        return this.tag;
    }
}
