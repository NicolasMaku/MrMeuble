package com.source.meuble.achat.Besoin;

import com.source.meuble.achat.Marchandise;
import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.pieces.Etat;
import com.source.meuble.pieces.EtatCPL;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "besoin")
public class Besoin extends Etat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_besoin", nullable = false)
    private Integer id;

    @Column(name = "quantite", precision = 10, scale = 2)
    private BigDecimal quantite;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_demandeur")
    private Centre idDemandeur;

    @Column(name = "etat")
    private Integer etat;

    @Column(name = "daty")
    private LocalDate daty;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_marchandise")
    private Marchandise idMarchandise;


    @Override
    public EtatCPL transferer(Etat etat) {
        return null;
    }

    public EtatCPL demandeProformat(List<Marchandise> marchandises) {
        EtatCPL cpl = new EtatCPL();

        return cpl;
    }

    @Override
    public List<Object> getFille() {
        return null;
    }
}