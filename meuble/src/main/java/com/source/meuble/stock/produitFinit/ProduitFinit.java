package com.source.meuble.stock.produitFinit;

import jakarta.persistence.*;

@Entity
public class ProduitFinit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_produit_finit", nullable = false)
    private Integer idProduitFinit;
    @Column(name = "nom")
    private String nom;

    public Integer getIdProduitFinit() {
        return idProduitFinit;
    }

    public void setIdProduitFinit(Integer idProduitFinit) {
        this.idProduitFinit = idProduitFinit;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
