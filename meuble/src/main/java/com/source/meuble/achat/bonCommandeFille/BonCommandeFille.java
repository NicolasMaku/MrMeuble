package com.source.meuble.achat.bonCommandeFille;

import com.source.meuble.achat.Marchandise;
import com.source.meuble.achat.bonCommande.BonCommande;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "bon_commande_fille")
public class BonCommandeFille {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_bc_fille", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_bc")
    private BonCommande idBc;

    @Column(name = "prix")
    private Double prix;

    @Column(name = "quantite")
    private Double quantite;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_marchandise")
    private Marchandise idMarchandise;

}