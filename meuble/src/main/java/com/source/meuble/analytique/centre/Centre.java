package com.source.meuble.analytique.centre;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import com.source.meuble.analytique.typeRubrique.TypeRubriqueRepository;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "centre")
public class Centre {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_centre")
    Long idCentre;

    @Column(name = "nom")
    String nom;

    @Column(name = "categorie")
    int categorie;

    // @Autowired
    // RubriqueRepository rubriqueRepository;

    public Double get_charge() {
        // List<Rubrique> rubriques = rubriqueRepository.getByIdCentre("CENTRE1");
        // List<Rubrique> rubriques = rubriqueRepository.findAll();
        Double somme = 0.0;

        // for (Rubrique rubrique : rubriques) {
        // somme += rubrique.getMontant().doubleValue();
        // }

        return 0.0;
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

    public Long getIdCentre() {
        return idCentre;
    }

    public void setIdCentre(Long idCentre) {
        this.idCentre = idCentre;
    }

}
