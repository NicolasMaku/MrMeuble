package com.source.meuble.auth;

import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.exception.NoExerciceFoundException;
import com.source.meuble.exception.NoUserLoggedException;
import com.source.meuble.exception.UnallowedRoleException;
import com.source.meuble.utilisateur.UserRole;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import com.source.meuble.utilisateur.Utilisateur;

@Service
public class AuthService {

    private final HttpSession httpSession;

    public AuthService(HttpSession httpSession) {
        this.httpSession = httpSession;
    }


    public Exercice requireExercice() throws NoExerciceFoundException {
        Object obj = httpSession.getAttribute("exo");
        if(obj instanceof Exercice exo) {
            return exo;
        }
        throw new NoExerciceFoundException();
    }

    public Utilisateur requireUser() throws NoUserLoggedException {
        Object obj = httpSession.getAttribute("u");
        if(obj instanceof Utilisateur u) {
            return u;
        }
        throw new NoUserLoggedException();
    }

    public void allowRoles(UserRole... roles) throws UnallowedRoleException, NoUserLoggedException {
        if(roles.length == 0) return;

        Object obj = httpSession.getAttribute("u");
        if(obj == null) {
            throw new NoUserLoggedException();
        }

        if(obj instanceof Utilisateur u) {
            UserRole ur = u.getRole();
            for(UserRole role: roles) {
                if(ur == role) {
                    return;
                }
            }
        }
        throw new UnallowedRoleException();
    }
}
