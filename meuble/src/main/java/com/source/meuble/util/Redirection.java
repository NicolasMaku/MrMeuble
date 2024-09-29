package com.source.meuble.util;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

public class Redirection {
    @Setter
    private String url;

    @Setter
    private  RedirectAttributes attributes = null;

    public Redirection() {
        this.setUrl("/");
    }

    public Redirection(String url) {
        this.setUrl(url);
    }

    public Redirection(RedirectAttributes redirectAttributes, String url) {
        this(url);
        this.setAttributes(redirectAttributes);
    }

    public Redirection(RedirectAttributes attributes) {
        this(attributes, "/");
    }

    public void addAttribute(String key, Object value) {
        if (attributes == null) {
            System.err.println("Attribures is null in Redirection");
            return;
        }

        this.attributes.addFlashAttribute(key, value);
    }



    public String getUrl() {
        return "redirect:" + url;
    }
}
