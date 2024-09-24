package com.source.meuble.analytique.centre;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.source.meuble.analytique.centre.SommeCentre.SommeCentre;
import com.source.meuble.analytique.imputation.Imputation;
import com.source.meuble.analytique.imputation.ImputationRepository;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import com.source.meuble.analytique.typeRubrique.TypeRubriqueRepository;
import com.source.meuble.utilisateur.Utilisateur;

import jakarta.servlet.http.HttpSession;
import com.google.gson.Gson;

import java.util.List;

@RestController
public class CentreRestController {

    @Autowired
    ImputationRepository imputationRepository;

    @Autowired
    CentreService centreService;

    @GetMapping("/call")
    public String parametreGlobal(HttpSession session) {
        HashMap<String, String> reponse = new HashMap<>();

        Utilisateur nico = new Utilisateur(1, "Nicolas");
        Gson conversion = new Gson();

        return conversion.toJson(nico);
    }

    @GetMapping("/test")
    public String teste(HttpSession session) {
        List<SommeCentre> scs = centreService.listeSommeCentre();
        return Integer.toString(scs.size());
    }
}
