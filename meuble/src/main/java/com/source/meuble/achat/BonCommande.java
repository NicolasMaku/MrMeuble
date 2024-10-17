package com.source.meuble.achat;

import com.source.meuble.achat.bonReception.BonReception;
import com.source.meuble.achat.bonReceptionFille.BonReceptionFille;
import com.source.meuble.pieces.Etat;
import com.source.meuble.pieces.EtatCPL;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.ArrayList;
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
    public EtatCPL transferer(Etat etat) {
        BonCommande bc = (BonCommande) etat;
        BonReception br = new BonReception();
        br.setIdBc(bc);

        List<BonCommandeFille> bcfs = bc.getFille();
        List<BonReceptionFille> br_filles = new ArrayList<>();

        for (BonCommandeFille bcf : bcfs) {
            BonReceptionFille brf = new BonReceptionFille();
            brf.setIdMarchandise(bcf.getIdMarchandise());
            br_filles.add(brf);
        }

        EtatCPL cpl = new EtatCPL();
        cpl.setMere(br);
        cpl.setFilles(br_filles);

        return cpl;
    }

    @Override
    public List<BonCommandeFille> getFille() {
        return null;
    }
}