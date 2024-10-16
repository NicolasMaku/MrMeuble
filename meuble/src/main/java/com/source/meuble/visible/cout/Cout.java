package com.source.meuble.visible.cout;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Map;

@Getter
@Setter
public class Cout {

    String libelle;
    UniteOeuvre uniteOeuvre;
    double quantite;
//    List<Centre> centres;
    Map<Centre, Double> coutParCentre;
    double cout_total;

    public double getCoutRevient() {
        return cout_total/quantite;
    }
}
