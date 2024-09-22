package com.source.meuble.analytique.imputation;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.rubrique.Rubrique;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "imputation")
public class Imputation {
    @Id
    @Column(name = "id_imputation", nullable = false, length = 20)
    private String idImputation;

    @ManyToOne
    @JoinColumn(name = "id_centre")
    private Centre idCentre;

    @ManyToOne
    @JoinColumn(name = "id_rubrique")
    private Rubrique idRubrique;

    @Column(name = "pourcentage", precision = 5, scale = 2)
    private BigDecimal pourcentage;

    public String getIdImputation() {
        return idImputation;
    }

    public void setIdImputation(String idImputation) {
        this.idImputation = idImputation;
    }

    public Centre getIdCentre() {
        return idCentre;
    }

    public void setIdCentre(Centre idCentre) {
        this.idCentre = idCentre;
    }

    public Rubrique getIdRubrique() {
        return idRubrique;
    }

    public void setIdRubrique(Rubrique idRubrique) {
        this.idRubrique = idRubrique;
    }

    public BigDecimal getPourcentage() {
        return pourcentage;
    }

    public void setPourcentage(BigDecimal pourcentage) {
        this.pourcentage = pourcentage;
    }
}