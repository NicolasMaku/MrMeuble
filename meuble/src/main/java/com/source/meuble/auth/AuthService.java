package com.source.meuble.auth;

import com.source.meuble.analytique.exercice.Exercice;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private final HttpSession httpSession;

    public AuthService(HttpSession httpSession) {
        this.httpSession = httpSession;
    }

    public Exercice requireExercice() throws NoExerciceFoundException {
        if(httpSession.getAttribute("exercice") != null) {
            return ((Exercice) httpSession.getAttribute("exercice"));
        }
        throw new NoExerciceFoundException();
    }
}
