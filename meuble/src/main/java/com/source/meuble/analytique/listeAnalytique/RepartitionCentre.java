package com.source.meuble.analytique.listeAnalytique;

import lombok.Data;

@Data
public class RepartitionCentre {
    private Double pourcentage;
    private Double fixe = null;
    private Double variable = null;

    public RepartitionCentre(){}

    public RepartitionCentre(Double montant, Double pourcentage, Boolean isFixed) {
        this.setPourcentage(pourcentage);
        if(isFixed) {
            this.setFixe(montant);

        } else {
            this.setVariable(montant);
        }
    }

    @Override
    public String toString() {
        return "RepartitionCentre{" +
            "pourcentage=" + pourcentage +
            ", fixe=" + fixe +
            ", variable=" + variable +
            '}';
    }

    public Double getTotal() {
        if(fixe != null) return fixe;
        return variable;
    }

    public String getFixeStr() {
        return fixe != null ? String.format("%.2f", fixe) : "-";
    }

    public String getVariableStr() {
        return variable != null ? String.format("%.2f", variable) : "-";
    }
}
