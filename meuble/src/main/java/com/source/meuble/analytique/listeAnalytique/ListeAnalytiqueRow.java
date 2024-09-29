package com.source.meuble.analytique.listeAnalytique;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.rubrique.Rubrique;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import lombok.Data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Data
public class ListeAnalytiqueRow {
    private String rubrique;
    private Double total;
    private String uniteOeuvre;
    private String nature;
    private Map<Integer, RepartitionCentre> repartition;

    public ListeAnalytiqueRow(){}

    public ListeAnalytiqueRow(TypeRubrique tr) {
        this.setRubrique(tr.getLibelle());
        this.setUniteOeuvre(tr.getIdUniteOeuvre().getNom());
        this.setNature(tr.getNature() == 0 ? "fixe" : "variable");
        Set<ListAnalytique> las = tr.getListAnalytiques();
        this.repartition = new HashMap<>();

        Double[] sum = new Double[1];
        sum[0] = 0.00;

        las.forEach((la) -> {
            RepartitionCentre rc = new RepartitionCentre(la.getTotalParCentre().doubleValue(), la.getPourcentage().doubleValue(), tr.getNature() == 0);
            sum[0] += la.getTotalParCentre().doubleValue();
            repartition.put(la.getIdCentre().getIdCentre(), rc);
        });

        this.setTotal(sum[0]);
    }

    @Override
    public String toString() {
        return "ListeAnalytiqueRow{" +
            "rubrique='" + rubrique + '\'' +
            ", total=" + total +
            ", uniteOeuvre='" + uniteOeuvre + '\'' +
            ", nature='" + nature + '\'' +
            ", repartition=" + repartition +
            '}';
    }
}
