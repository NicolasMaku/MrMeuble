package com.source.meuble.achat.ProformatFille;

import com.source.meuble.pieces.Etat;
import com.source.meuble.pieces.EtatCPL;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "proformat_fille")
public class ProformatFille extends Etat {
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

    @Override
    public EtatCPL transferer() {
        return null;
    }

    @Override
    public List<Object> getFille() {
        return null;
    }
}