package com.source.meuble.achat.proformat;

import com.source.meuble.achat.Fornisseur.Fournisseur;
import com.source.meuble.achat.proformat.proformatFille.ProformatFille;
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

    @OneToMany(mappedBy = "idProformat", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ProformatFille> filles;

    @Column(name = "etat", nullable = true)
    private Integer etat;

    @Override
    public EtatCPL transferer(Etat etat) {
        return null;
    }

    @Override
    public List<ProformatFille> getFille() {
        return null;
    }

    public boolean isValide() {
        return this.etat > 0;
    }

    public String getEtatHtml() {
        if(etat == null) etat = 0;
        String html = "";
        if(etat == 0) {
            html += "<span class=\"badge bg-label-warning me-1\">Non Validée</span>";

        } else if (etat >= 1) {
            html += "<span class=\"badge bg-label-success me-1\">Validée</span>";
        }
        if(etat >= 2) {
            html += "<span class=\"badge bg-label-primary me-1\">BC generé</span>";
        }

        return html;
    }
}