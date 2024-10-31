package com.source.meuble.auth;

import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.exception.NoExerciceFoundException;
import com.source.meuble.exception.NoUserLoggedException;
import com.source.meuble.util.Layout;
import com.source.meuble.utilisateur.Utilisateur;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class LayoutService {

    private final AuthService authService;

    public LayoutService(AuthService authService) {
        this.authService = authService;
    }

    public ModelAndView getPage(String page) throws NoUserLoggedException {
        authService.requireUser();
        ModelAndView mav = new ModelAndView("layout");
        mav.addObject("page", page);
        return mav;
    }

    public Layout getLayout(String page) throws NoUserLoggedException, NoExerciceFoundException {
        Utilisateur u = authService.requireUser();
        Exercice exo = authService.requireExercice();
        ModelAndView mav = new ModelAndView("layout");
        mav.addObject("page", page);
        mav.addObject("u", u);
        mav.addObject("exo", exo);
        Layout layout = new Layout();
        layout.setModelAndView(mav);
        layout.setExercice(exo);
        layout.setUtilisateur(u);
        return layout;
    }
}
