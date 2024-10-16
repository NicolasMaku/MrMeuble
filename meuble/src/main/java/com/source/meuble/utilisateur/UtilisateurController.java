package com.source.meuble.utilisateur;

import com.source.meuble.util.Redirection;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public ModelAndView showLoginViewl(Model model) {
        ModelAndView modelAndView = new ModelAndView("login.html");
        modelAndView.addObject("error", model.getAttribute("error"));
        return modelAndView;
    }

    @PostMapping("/login")
    public String login(
        @RequestParam("username") String username,
        @RequestParam("password") String password,
        RedirectAttributes attributes
    ) {
        Redirection redirection = new Redirection(attributes);
        try {
            Utilisateur utilisateur = utilisateurService.login(username, password);
            httpSession.setAttribute("utilisateur", utilisateur);
            redirection.setUrl("/exercice");

        } catch (Exception e) {
            final String ERROR = "Identifiant ou mot de passe incorrect";
            System.err.println(ERROR + ": %s / %s".formatted(username, password));
            redirection.addAttribute("error", ERROR);
            redirection.setUrl("/");
        }
        return redirection.getUrl();
    }
}
