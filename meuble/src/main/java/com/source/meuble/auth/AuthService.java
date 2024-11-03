package com.source.meuble.auth;

import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.utilisateur.Utilisateur;
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

    public void requireRole(Integer... idCentres) throws UnallowedRoleException {
        Utilisateur user = (Utilisateur) httpSession.getAttribute("utilisateur");

        for(Integer idCentre: idCentres) {
            if(user.getCentre().getIdCentre() == idCentre) {
                return;
            }
        }

        throw new UnallowedRoleException();
    }

    public Utilisateur requireUser() throws NoAccountLoggedException {
        Object obj = httpSession.getAttribute("utilisateur");

        if(obj != null && (obj instanceof Utilisateur u)) {
            return u;
        }

        throw new NoAccountLoggedException();
    }
//    public void


}
