package com.source.meuble.achat.BonReception.BonReceptionFille;

import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.analytique.produit.Produit;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "bon_reception_fille")
public class BonReceptionFille {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_br_fille", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_br")
    private BonReception idBr;

    @Column(name = "quantite")
    private Double quantite;

    @Column(name = "prix")
    private Double prix;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_marchandise")
    private Produit idMarchandise;

}