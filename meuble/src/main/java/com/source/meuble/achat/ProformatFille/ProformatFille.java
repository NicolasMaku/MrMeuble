package com.source.meuble.achat.proformatFille;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "proformat_fille")
public class ProformatFille {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_proformat_fille", nullable = false)
    private Integer id;

    @Column(name = "id_proformat")
    private Integer idProformat;

    @Column(name = "id_produit")
    private Integer idProduit;

    @Column(name = "prix", precision = 18, scale = 2)
    private BigDecimal prix;

}