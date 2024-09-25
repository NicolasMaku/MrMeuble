package com.source.meuble.analytique.centre.SommeCentre;

import lombok.Getter;
import lombok.Setter;

import java.util.Map;

@Getter
@Setter
public class SommeCentre {
    int idCentre;
    String nom;
    Double montant;

    public SommeCentre(Map<String, Object> objet) {
        setIdCentre((int) objet.get("id_centre"));
        setNom(String.valueOf(objet.get("nom")));
        setMontant((Double.valueOf(String.valueOf(objet.get("sum")))));
    }

}
