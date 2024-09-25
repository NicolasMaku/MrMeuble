
package com.source.meuble.visible;

import com.source.meuble.analytique.centre.SommeCentre.SommeCentre;

import java.util.List;

public class AdminRepartition {
    List<SommeCentre> listeCentre;


    public List<SommeCentre> getOperationels(String[] args) {
        AdminRepartition ar = new AdminRepartition();
        ar.listeCentre.stream().filter(sommeCentre -> sommeCentre.);
    }

    public List<SommeCentre> getListeCentre() {
        return listeCentre;
    }

    public void setListeCentre(List<SommeCentre> listeCentre) {
        this.listeCentre = listeCentre;
    }
}