package com.source.meuble.achat.Facture;

import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.achat.Client.Client;
import com.source.meuble.achat.Facture.FactureFille.FactureFille;
import com.source.meuble.achat.Fornisseur.Fournisseur;
import com.source.meuble.achat.bonCommande.BonCommande;
import com.source.meuble.pieces.Etat;
import com.source.meuble.pieces.EtatCPL;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
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
    private LocalDate dateFacture;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_fournisseur")
    private Fournisseur idFournisseur;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_client")
    private Client idClient;

    @OneToMany(mappedBy = "idFacture", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<FactureFille> filles;

    @Override
    public EtatCPL transferer(Etat etat) {
        return null;
    }

    @Override
    public List<FactureFille> getFille() {
        return null;
    }
}