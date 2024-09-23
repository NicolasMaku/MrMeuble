package com.source.meuble.utilisateur;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UtilisateurController {

    @GetMapping("/")
    public String login() {
        return "login/login";
    }
}
