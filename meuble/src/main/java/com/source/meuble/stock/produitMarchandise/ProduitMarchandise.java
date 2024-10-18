package com.source.meuble.stock.produitMarchandise;

import com.source.meuble.achat.marchandise.Marchandise;
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
    private Marchandise marchandise;

    @Column(name = "quantite")
    private Integer quantite;
}
