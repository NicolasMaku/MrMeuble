package com.source.meuble.util;

import org.springframework.web.servlet.ModelAndView;

public class Layout {
    private final ModelAndView modelAndView;
    private static final String VIEW_NAME = "";
    private static final String DEFAULT_CONTENT = "";

    public Layout() {
        this(DEFAULT_CONTENT);
    }

    public Layout(String content) {
        this.modelAndView = new ModelAndView(VIEW_NAME);
        this.modelAndView.addObject("content", content);
    }

    public ModelAndView getModelAndView() {
        return this.modelAndView;
    }
}
