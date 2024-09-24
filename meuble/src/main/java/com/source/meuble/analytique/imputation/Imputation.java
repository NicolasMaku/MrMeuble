package com.source.meuble.analytique.imputation;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "imputation")
public class Imputation {
    @Id
    @Column(name = "id_imputation", nullable = false, length = 20)
    private Long idImputation;

    @ManyToOne
    @JoinColumn(name = "id_centre")
    private Centre idCentre;

    @ManyToOne
    @JoinColumn(name = "id_type_rubrique")
    private TypeRubrique idTypeRubrique;

    @Column(name = "pourcentage", precision = 5, scale = 2)
    private BigDecimal pourcentage;

    @ManyToOne
    @Column(name = "id_exercice")
    Exercice exercice;

    public Centre getIdCentre() {
        return idCentre;
    }

    public void setIdCentre(Centre idCentre) {
        this.idCentre = idCentre;
    }

    public BigDecimal getPourcentage() {
        return pourcentage;
    }

    public void setPourcentage(BigDecimal pourcentage) {
        this.pourcentage = pourcentage;
    }

    public Long getIdImputation() {
        return idImputation;
    }

    public void setIdImputation(Long idImputation) {
        this.idImputation = idImputation;
    }
}