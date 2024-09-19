package com.source.meuble.analytique.centre;

import jakarta.persistence.Entity;

@Entity
public class Centre {
    int idCentre;
    String nom;
    int categorie;

    public int getIdCentre() {
        return idCentre;
    }

    public void setIdCentre(int idCentre) {
        this.idCentre = idCentre;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
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

}
