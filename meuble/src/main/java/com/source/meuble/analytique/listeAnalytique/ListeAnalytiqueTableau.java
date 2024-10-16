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
    private Double totalFixe;
    private Double totalVariable;
    private Double grandTotal;

    public ListeAnalytiqueTableau(ListeAnalytiqueRow[] rows) {
        totalParCentre = new HashMap<>();
        totalVariableParCentre = new HashMap<>();
        totalFixeParCentre = new HashMap<>();
        grandTotal = 0.00;
        totalFixe = 0.00;
        totalVariable = 0.00;

        for(ListeAnalytiqueRow row : rows) {
            row.getRepartition().forEach((idCentre, repartition) -> {
                if(!totalParCentre.containsKey(idCentre)) {
                    totalParCentre.put(idCentre, 0.00);
                    totalVariableParCentre.put(idCentre, 0.00);
                    totalFixeParCentre.put(idCentre, 0.00);
                }

                Double total = repartition.getTotal();
                Double fixe = (repartition.getFixe() != null ? repartition.getFixe() : 0.00);
                Double variable = (repartition.getVariable() != null ? repartition.getVariable() : 0.00);

                totalParCentre.put(idCentre, totalParCentre.get(idCentre) + total);
                totalFixeParCentre.put(idCentre, totalFixeParCentre.get(idCentre) + fixe);
                totalVariableParCentre.put(idCentre, totalVariableParCentre.get(idCentre) + variable);

                grandTotal += total;
                totalFixe += fixe;
                totalVariable += variable;
            });
        }

        setTableau(rows);
    }
}
