package com.source.meuble.utilisateur;

import com.source.meuble.util.Layout;
import com.source.meuble.util.Redirection;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class UtilisateurController {
    private final HttpSession httpSession;
    private final UtilisateurService utilisateurService;

    public UtilisateurController(HttpSession httpSession, UtilisateurService utilisateurService) {
        this.httpSession = httpSession;
        this.utilisateurService = utilisateurService;
    }


    @GetMapping
    public ModelAndView showLoginView() {
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    @PostMapping("/login")
    public String login(
        @RequestParam("username") String username,
        @RequestParam("password") String password
    ) {
        Redirection redirection = new Redirection();
        try {
            Utilisateur utilisateur = utilisateurService.login(username, password);
            httpSession.setAttribute("utilisateur", utilisateur);
            redirection.setUrl("/exercice");

        } catch (Exception e) {
            e.printStackTrace();
            redirection.setUrl("/");
        }
        return redirection.getUrl();
    }
}
