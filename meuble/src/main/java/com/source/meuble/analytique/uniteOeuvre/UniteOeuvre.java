package com.source.meuble.analytique.uniteOeuvre;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "unite_oeuvre")
public class UniteOeuvre {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_unite_oeuvre")
    String idUniteOeuvre;

    @Column(name = "nom")
    String nom;

    public String getIdUniteOeuvre() {
        return idUniteOeuvre;
    }

    public void setIdUniteOeuvre(String idUniteOeuvre) {
        this.idUniteOeuvre = idUniteOeuvre;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

}
