package com.source.meuble.exception;

import com.source.meuble.util.Redirection;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(LogginErrorException.class)
    public String handleLoginError(LogginErrorException e) {
        return new Redirection("/?msg="+e.getMessage()).getUrl();
    }

    @ExceptionHandler(UnallowedRoleException.class)
    public String handleUnallowedRole(UnallowedRoleException e, HttpServletRequest req, RedirectAttributes atts) {
        String referer = req.getHeader("Referer");
        atts.addFlashAttribute("msg", e.getMessage());

        return new Redirection(referer != null ? referer : "/").getUrl();
    }

    @ExceptionHandler(NoExerciceFoundException.class)
    public String handleNoExerciceFound(NoExerciceFoundException e) {
        return new Redirection("/exercice?msg=" + e.getMessage() ).getUrl();
    }

    @ExceptionHandler(NoUserLoggedException.class)
    public String handleNoUserLogged(NoUserLoggedException e) {
        return new Redirection("/?msg=" + e.getMessage()).getUrl();
    }
}
