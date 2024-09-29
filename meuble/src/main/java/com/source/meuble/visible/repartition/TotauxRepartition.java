package com.source.meuble.visible.repartition;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

import java.math.BigDecimal;

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

}