package com.source.meuble.util;

import jakarta.servlet.http.HttpServletRequest;

public class RequestAttribute {
    protected final HttpServletRequest request;

    public RequestAttribute(HttpServletRequest request) {
        this.request = request;
    }

    public <T> T getObject(String key, Class<T> type, T onNull) {
        Object obj = request.getAttribute(key);
        if(obj == null) return onNull;
        return type.cast(obj);
    }
}
