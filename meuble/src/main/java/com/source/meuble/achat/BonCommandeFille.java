package com.source.meuble.achat;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

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

    @Column(name = "prix", precision = 18, scale = 2)
    private BigDecimal prix;

    @Column(name = "quantite", precision = 10, scale = 2)
    private BigDecimal quantite;

}