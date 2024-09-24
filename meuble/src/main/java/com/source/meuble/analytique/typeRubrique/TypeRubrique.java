package com.source.meuble.analytique.typeRubrique;

import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "type_rubrique")
public class TypeRubrique {
    @Id
    @Column(name = "id_type_rubrique", nullable = false, length = 20)
    private String idRubrique;

    @Column(name = "libelle", length = 20)
    private String libelle;

    @Column(name = "nature")
    private Integer nature;

    @Column(name = "incorporabilite")
    private int incorporabilite;

    @ManyToOne
    @JoinColumn(name = "id_unite_oeuvre")
    private UniteOeuvre UniteOeuvre;

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

    public int getIncorporabilite() {
        return incorporabilite;
    }

    public void setIncorporabilite(int incorporabilite) {
        this.incorporabilite = incorporabilite;
    }

    public UniteOeuvre getUniteOeuvre() {
        return UniteOeuvre;
    }

    public void setUniteOeuvre(UniteOeuvre uniteOeuvre) {
        UniteOeuvre = uniteOeuvre;
    }

    public BigDecimal getMontant() {
        return montant;
    }

    public void setMontant(BigDecimal montant) {
        this.montant = montant;
    }
}