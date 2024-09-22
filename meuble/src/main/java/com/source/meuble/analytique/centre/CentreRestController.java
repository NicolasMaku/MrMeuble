package com.source.meuble.analytique.centre;

import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.source.meuble.utilisateur.Utilisateur;

import jakarta.servlet.http.HttpSession;
import com.google.gson.Gson;

@RestController
public class CentreRestController {

    @GetMapping("/call")
    public String parametreGlobal(HttpSession session) {
        HashMap<String, String> reponse = new HashMap<>();

        Utilisateur nico = new Utilisateur(1, "Nicolas");
        Gson conversion = new Gson();

        return conversion.toJson(nico);
    }
}
