package com.source.meuble.util;

import com.source.meuble.auth.NoExerciceFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(NoExerciceFoundException.class)
    public String handleNoExerciceFound() {
        return new Redirection("/exercice").getUrl();
    }
}
