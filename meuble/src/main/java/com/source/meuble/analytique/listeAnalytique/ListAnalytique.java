package com.source.meuble.analytique.listeAnalytique;

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
@Table(name = "list_analytique")
public class ListAnalytique {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "libelle", length = 20)
    private String libelle;

    @Column(name = "pourcentage", precision = 5, scale = 2)
    private BigDecimal pourcentage;

    @Column(name = "id_centre")
    private Integer idCentre;

    @Column(name = "total_par_centre")
    private BigDecimal totalParCentre;

    @Column(name = "incorporabilite")
    private Integer incorporabilite;

}