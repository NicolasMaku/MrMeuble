package com.source.meuble.analytique.centre;

import java.util.ArrayList;
import java.util.HashMap;

import com.source.meuble.visible.AdminRepartition;
import com.source.meuble.visible.cout.AdminCout;
import com.source.meuble.visible.cout.Cout;
import com.source.meuble.visible.repartition.Repartition;
import com.source.meuble.visible.repartition.RepartitionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.source.meuble.analytique.centre.SommeCentre.SommeCentre;
import com.source.meuble.analytique.imputation.ImputationRepository;
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

    @Autowired
    AdminRepartition adminRepartition;

    @Autowired
    AdminCout adminCout;

    @GetMapping("/call")
    public String parametreGlobal(HttpSession session) {
        HashMap<String, String> reponse = new HashMap<>();

        Utilisateur nico = new Utilisateur(1, "Nicolas");
        Gson conversion = new Gson();

        return conversion.toJson(adminRepartition.getTotal());
    }

    @GetMapping("/test")
    public String teste(HttpSession session) {
        List<SommeCentre> scs = centreService.listeSommeCentre();
        return Integer.toString(scs.size());
    }

    @GetMapping("/cout")
    public String cout() {
        List<Integer> ids = new ArrayList<>();
        ids.add(2);
        ids.add(3);

        Cout cout = adminCout.calculCout(1,"30","2");
        return Double.toString(cout.getCout_total()) + " / " + Double.toString(cout.getQuantite());
    }
}
