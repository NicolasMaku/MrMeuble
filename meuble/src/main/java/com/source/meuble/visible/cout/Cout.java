package com.source.meuble.visible.cout;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Cout {

    UniteOeuvre uniteOeuvre;
    double quantite;
    List<Centre> centres;
    double cout_total;

    public double getCoutRevient() {
        return cout_total/quantite;
    }
}
