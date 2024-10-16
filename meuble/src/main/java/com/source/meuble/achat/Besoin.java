package com.source.meuble.achat;

import com.source.meuble.analytique.centre.Centre;
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

    @Override
    public Object transferer() {
        return null;
    }

    @Override
    public List<Object> getFille() {
        return null;
    }
}