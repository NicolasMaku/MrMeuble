package com.source.meuble.achat;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "facture")
public class Facture extends Etat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_facture", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_bc")
    private BonCommande idBc;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_br")
    private BonReception idBr;

    @Column(name = "date_facture")
    private Integer dateFacture;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_fournisseur")
    private Fournisseur idFournisseur;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_client")
    private Client idClient;

    @Override
    public Object transferer() {
        return null;
    }

    @Override
    public List<Object> getFille() {
        return null;
    }
}