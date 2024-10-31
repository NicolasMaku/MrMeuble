package com.source.meuble.stock.produitMarchandise;

import com.source.meuble.analytique.produit.Produit;
import com.source.meuble.stock.produitFinit.ProduitFinit;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "produit_marchandise")
public class ProduitMarchandise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_produit_marchandise", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_produit_finit", nullable = false)
    private ProduitFinit produitFinit;

    @ManyToOne
    @JoinColumn(name = "id_marchandise", nullable = false)
    private Produit marchandise;

    @Column(name = "quantite")
    private Integer quantite;
}
