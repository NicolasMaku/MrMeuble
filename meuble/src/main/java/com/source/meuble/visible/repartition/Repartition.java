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
@Table(name = "v_repartition")
public class Repartition {
    @Id
    @Column(name = "row_number")
    private Long rowNumber;

    @Column(name = "id_centre")
    private Integer idCentre;

    @Column(name = "nom", length = 50)
    private String nom;

    @Column(name = "montant")
    private BigDecimal montant;

    @Column(name = "categorie")
    private Integer categorie;

    @Column(name = "cle")
    private BigDecimal cle;

    @Column(name = "structure")
    private BigDecimal structure;

    @Column(name = "cout_total")
    private BigDecimal coutTotal;

}