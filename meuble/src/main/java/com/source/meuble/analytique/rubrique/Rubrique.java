package com.source.meuble.analytique.rubrique;

import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "rubrique")
public class Rubrique {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_rubrique", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_type_rubrique")
    private TypeRubrique idTypeRubrique;

    @Column(name = "prix_unitaire", precision = 11, scale = 2)
    private BigDecimal prixUnitaire;

    @Column(name = "quantite", precision = 17, scale = 2)
    private BigDecimal quantite;

}