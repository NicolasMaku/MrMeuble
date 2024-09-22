package com.source.meuble.analytique.centre;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.source.meuble.analytique.rubrique.Rubrique;
import com.source.meuble.analytique.rubrique.RubriqueRepository;
import com.source.meuble.utilisateur.Utilisateur;

import jakarta.servlet.http.HttpSession;
import com.google.gson.Gson;

import java.util.List;

@RestController
public class CentreRestController {

    @Autowired
    RubriqueRepository rubriqueRepository;

    @GetMapping("/call")
    public String parametreGlobal(HttpSession session) {
        HashMap<String, String> reponse = new HashMap<>();

        Utilisateur nico = new Utilisateur(1, "Nicolas");
        Gson conversion = new Gson();

        return conversion.toJson(nico);
    }

    @GetMapping("/test")
    public String teste(HttpSession session) {
        Centre centre = new Centre();

        // List<Rubrique> rubriques = rubriqueRepository.getByIdCentre("CENTRE1");
        List<Rubrique> rubriques = rubriqueRepository.findAll();
        Double somme = 0.0;

        for (Rubrique rubrique : rubriques) {
            somme += rubrique.getMontant().doubleValue();
        }

        return somme.toString();
    }
}
