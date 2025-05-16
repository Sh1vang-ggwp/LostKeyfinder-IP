package com.lenzetech.isearchingtwo.Bean;

/* loaded from: classes.dex */
public class ResponseBean {
    private String content;
    private int opt;
    private String title;
    private Boolean verify;
    private String www;

    public ResponseBean(Boolean bool, String str, String str2, String str3, int i) {
        this.verify = bool;
        this.title = str;
        this.content = str2;
        this.www = str3;
        this.opt = i;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String str) {
        this.title = str;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String str) {
        this.content = str;
    }

    public String getWww() {
        return this.www;
    }

    public void setWww(String str) {
        this.www = str;
    }

    public int getOpt() {
        return this.opt;
    }

    public void setOpt(int i) {
        this.opt = i;
    }

    public Boolean getVerify() {
        return this.verify;
    }

    public void setVerify(Boolean bool) {
        this.verify = bool;
    }
}
