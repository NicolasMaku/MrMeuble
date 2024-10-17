package com.source.meuble.achat.Proformat;

import com.source.meuble.achat.Fournisseur;
import com.source.meuble.achat.proformatFille.ProformatFille;
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
@Table(name = "proformat")
public class Proformat extends Etat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_proformat", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_fournisseur")
    private Fournisseur idFournisseur;

    @Column(name = "id_client")
    private Integer idClient;

    @Column(name = "daty")
    private LocalDate daty;

    @Override
    public EtatCPL transferer(Etat etat) {
        return null;
    }

    @Override
    public List<ProformatFille> getFille() {
        return null;
    }
}