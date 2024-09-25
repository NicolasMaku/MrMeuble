package com.source.meuble.analytique.centre;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Setter;

@Entity
@Table(name = "centre")
public class Centre {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_centre")
    int idCentre;

    @Setter
    @Column(name = "nom")
    String nom;

    @Column(name = "categorie")
    int categorie;

    public String getNom() {
        return nom;
    }

    public int getCategorie() {
        return categorie;
    }

    public void setCategorie(int categorie) throws Exception {
        if (categorie != 0 && categorie != 1) {
            throw new Exception("Categorie inconnue");
        }

        this.categorie = categorie;
    }

    public int getIdCentre() {
        return idCentre;
    }

    public void setIdCentre(int idCentre) {
        this.idCentre = idCentre;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
