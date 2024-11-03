package com.source.meuble.util;

import com.source.meuble.auth.NoAccountLoggedException;
import com.source.meuble.auth.NoExerciceFoundException;
import com.source.meuble.auth.UnallowedRoleException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(NoExerciceFoundException.class)
    public String handleNoExerciceFound() {
        return new Redirection("/exercice").getUrl();
    }

    @ExceptionHandler(UnallowedRoleException.class)
    public String handleUnallowedRole(UnallowedRoleException e) {
        return new Redirection("/?msg="+e.getMessage()).getUrl();
    }

    @ExceptionHandler(NoAccountLoggedException.class)
    public String handleNoAccountLogged(NoAccountLoggedException e) {
        return new Redirection("/?msg="+e.getMessage()).getUrl();
    }
}
