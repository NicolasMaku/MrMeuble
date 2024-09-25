package com.source.meuble.analytique.imputation;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "imputation")
public class Imputation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_imputation", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_centre")
    private Centre idCentre;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_type_rubrique")
    private TypeRubrique idTypeRubrique;

    @Column(name = "pourcentage", precision = 5, scale = 2)
    private BigDecimal pourcentage;

    @Column(name = "id_exercice")
    private Integer idExercice;

}