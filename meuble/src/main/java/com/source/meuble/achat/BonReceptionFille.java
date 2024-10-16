package com.source.meuble.achat;

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

    @Column(name = "quantite", precision = 10, scale = 2)
    private BigDecimal quantite;

    @Column(name = "prix", precision = 18, scale = 2)
    private BigDecimal prix;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_marchandise")
    private Marchandise idMarchandise;

}