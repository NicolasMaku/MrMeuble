package com.source.meuble.achat.Facture.FactureFille;

import com.source.meuble.achat.Facture.Facture;
import com.source.meuble.analytique.produit.Produit;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "facture_fille")
public class FactureFille {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_facture_fille", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_facture")
    private Facture idFacture;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_produit")
    private Produit idMarchandise;

    @Column(name = "quantite", precision = 10, scale = 2)
    private BigDecimal quantite;

    @Column(name = "prix", precision = 18, scale = 2)
    private BigDecimal prix;

}