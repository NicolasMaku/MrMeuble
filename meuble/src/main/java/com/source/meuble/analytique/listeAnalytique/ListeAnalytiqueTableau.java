package com.source.meuble.analytique.listeAnalytique;

import lombok.Data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
public class ListeAnalytiqueTableau {
    private ListeAnalytiqueRow[] tableau;
    private Map<Integer, Double> totalParCentre;
    private Map<Integer, Double> totalVariableParCentre;
    private Map<Integer, Double> totalFixeParCentre;
    private Double grandTotal;

    public ListeAnalytiqueTableau(ListeAnalytiqueRow[] rows) {
        totalParCentre = new HashMap<>();
        totalVariableParCentre = new HashMap<>();
        totalFixeParCentre = new HashMap<>();
        grandTotal = 0.00;

        for(ListeAnalytiqueRow row : rows) {
            row.getRepartition().forEach((idCentre, repartition) -> {
                if(!totalParCentre.containsKey(idCentre)) {
                    totalParCentre.put(idCentre, 0.00);
                    totalVariableParCentre.put(idCentre, 0.00);
                    totalFixeParCentre.put(idCentre, 0.00);
                }

                totalParCentre.put(idCentre, totalParCentre.get(idCentre) + repartition.getTotal());
                totalFixeParCentre.put(idCentre, totalFixeParCentre.get(idCentre) + (repartition.getFixe() != null ? repartition.getFixe() : 0.00));
                totalVariableParCentre.put(idCentre, totalVariableParCentre.get(idCentre) + (repartition.getVariable() != null ? repartition.getVariable() : 0.00));
                grandTotal += repartition.getTotal();
            });
        }

        setTableau(rows);
    }
}
