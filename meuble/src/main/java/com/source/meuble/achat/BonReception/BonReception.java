package com.source.meuble.achat.BonReception;

import com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille;
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
@Table(name = "bon_reception")
public class BonReception extends Etat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_br", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_bc")
    private BonCommande idBc;

    @Column(name = "date_reception")
    private LocalDate dateReception;

    @Override
    public EtatCPL transferer(Etat etat) {
        return null;
    }

    @OneToMany(mappedBy = "idBr", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<BonReceptionFille> fille;

//    @Override
//    public List<Object> getFille() {
//        return null;
//    }
}