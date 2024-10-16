package com.source.meuble.visible.repartition;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

import java.math.BigDecimal;
import java.util.List;

/**
 * Mapping for DB view
 */
@Getter
@Setter
@Entity
@Immutable
@Table(name = "v_repartition_total")
public class TotauxRepartition {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "s_direct")
    private BigDecimal sDirect;

    @Column(name = "s_structure")
    private BigDecimal sStructure;

    @Column(name = "s_cout_total")
    private BigDecimal sCoutTotal;

    @Column(name = "id_exercice")
    private Integer idExercice;

    private double scle;

    public TotauxRepartition() {
    }

    public TotauxRepartition(List<Repartition> repartition) {
        double tsDirect = 0;
        double tsStructure = 0;
        double tsCoutTotal = 0;
        double tsCle = 0;


        for (Repartition repart : repartition) {
            tsDirect += repart.getMontant().doubleValue();
            tsStructure += repart.getStructure().doubleValue();
            tsCoutTotal += repart.getCoutTotal();
            tsCle += repart.getCle().doubleValue();
        }

        sDirect = BigDecimal.valueOf(tsDirect);
        sStructure = BigDecimal.valueOf(tsStructure);
        sCoutTotal = BigDecimal.valueOf(tsCoutTotal);
        scle = tsCle;

    }


}