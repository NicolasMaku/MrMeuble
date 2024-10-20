package com.source.meuble.achat.marchandise;

import jakarta.persistence.*;

@Entity
public class Marchandise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_marchandise", nullable = false)
    private Integer idMarchandise;
    @Column(name = "nom")
    private String nom;

    public Integer getIdMarchandise() {
        return idMarchandise;
    }

    public void setIdMarchandise(Integer idMarchandise) {
        this.idMarchandise = idMarchandise;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}

