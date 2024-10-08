package com.source.meuble.analytique.rubrique;

import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.analytique.listeAnalytique.ListAnalytique;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Set;

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

    @Column(name = "date_achat")
    private LocalDate dateAchat;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_exercice")
    private Exercice idExercice;


    public void setPrixUnitaire(BigDecimal prixUnitaire) throws Exception {
        if(prixUnitaire.compareTo(BigDecimal.ZERO)<=0){
            throw new Exception("Prix unitaire invalide");
        }
        this.prixUnitaire = prixUnitaire;
    }

    public void setQuantite(BigDecimal quantite) throws Exception {
        if(quantite.compareTo(BigDecimal.ZERO)<=0){
            throw new Exception("Quantiter invalide");
        }
        this.quantite = quantite;
    }
}