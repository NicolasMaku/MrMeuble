package com.source.meuble.analytique.produit;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.exercice.Exercice;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "produit")
public class Produit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_produit", nullable = false)
    private Integer id;

    @Column(name = "libelle", length = 30)
    private String libelle;

    @Column(name = "quantite", precision = 11, scale = 2)
    private BigDecimal quantite;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_centre")
    private Centre idCentre;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_exercice")
    private Exercice idExercice;

    @Column(name = "date_sortie")
    private LocalDate dateSortie;

    //TODO [JPA Buddy] generate columns from DB
}