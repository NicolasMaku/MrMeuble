package com.source.meuble.analytique.centre;

import com.source.meuble.visible.repartition.Repartition;
import jakarta.persistence.*;
import jdk.jfr.Category;
import lombok.Setter;

import java.util.Set;

@Entity
@Table(name = "centre")
public class Centre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_centre")
    int idCentre;
    @Setter
    @Column(name = "nom")
    String nom;

    @Column(name = "categorie")
    int categorie;

    @OneToMany(mappedBy = "idCentre", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    Set<Repartition> repartitions;

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
