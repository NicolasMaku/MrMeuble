package com.source.meuble.analytique.produit;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_unite_oeuvre")
    private UniteOeuvre uniteOeuvre;

//    @Column(name = "quantite", precision = 11, scale = 2)
//    private BigDecimal quantite;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "id_centre")
//    private Centre idCentre;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "id_exercice")
//    private Exercice idExercice;


    //TODO [JPA Buddy] generate columns from DB
}