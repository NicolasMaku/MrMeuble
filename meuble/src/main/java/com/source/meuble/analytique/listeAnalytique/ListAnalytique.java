package com.source.meuble.analytique.listeAnalytique;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import jakarta.persistence.*;
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_type_rubrique")
    private TypeRubrique typeRubrique;

    @Column(name = "pourcentage", precision = 5, scale = 2)
    private BigDecimal pourcentage;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_centre")
    private Centre idCentre;

    @Column(name = "total_par_centre")
    private BigDecimal totalParCentre;

    @Column(name = "incorporabilite")
    private Integer incorporabilite;

}