package com.source.meuble.achat;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "bon_commande")
public class BonCommande extends Etat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_bc", nullable = false)
    private Integer id;

    @Column(name = "date_commande")
    private LocalDate dateCommande;

    @Column(name = "date_livraison")
    private LocalDate dateLivraison;

    @Override
    public Object transferer() {
        return null;
    }

    @Override
    public List<Object> getFille() {
        return null;
    }
}