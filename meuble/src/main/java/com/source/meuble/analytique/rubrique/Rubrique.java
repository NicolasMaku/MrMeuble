package com.source.meuble.analytique.rubrique;

import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "rubrique")
public class Rubrique {
    @Id
    @Column(name = "id_rubrique", nullable = false, length = 20)
    private String idRubrique;

    @Column(name = "libelle", length = 20)
    private String libelle;

    @Column(name = "nature")
    private Integer nature;

    @ManyToOne
    @JoinColumn(name = "id_unite_oeuvre")
    private UniteOeuvre idUniteOeuvre;

    @Column(name = "montant", precision = 11, scale = 2)
    private BigDecimal montant;

    public String getIdRubrique() {
        return idRubrique;
    }

    public void setIdRubrique(String idRubrique) {
        this.idRubrique = idRubrique;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Integer getNature() {
        return nature;
    }

    public void setNature(Integer nature) {
        this.nature = nature;
    }

    public UniteOeuvre getIdUniteOeuvre() {
        return idUniteOeuvre;
    }

    public void setIdUniteOeuvre(UniteOeuvre idUniteOeuvre) {
        this.idUniteOeuvre = idUniteOeuvre;
    }

    public BigDecimal getMontant() {
        return montant;
    }

    public void setMontant(BigDecimal montant) {
        this.montant = montant;
    }
}