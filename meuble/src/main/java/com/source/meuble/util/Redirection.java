package com.source.meuble.util;

public class Redirection {
    private String url;

    public Redirection() {
        this.setUrl("/");
    }

    public Redirection(String url) {
        this.setUrl(url);
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return "redirect:" + url;
    }
}
