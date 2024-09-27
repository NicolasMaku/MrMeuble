package com.source.meuble.analytique.centre;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jdk.jfr.Category;
import lombok.Setter;

@Entity
@Table(name = "centre")
public class Centre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_centre")
    Long idCentre;

    @Setter
    @Column(name = "nom")
    String nom;

    @Column(name = "categorie")
    int categorie;

    public Centre() {

    }

    public Centre(String nom, int categorie) throws Exception {
        this.setNom(nom);
        this.setCategorie(categorie);
    }

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

    public Long getIdCentre() {
        return idCentre;
    }

    public void setIdCentre(Long idCentre) {
        this.idCentre = idCentre;
    }

}
