package com.source.meuble.achat.bonCommande;

import com.source.meuble.achat.Client.Client;
import com.source.meuble.achat.Fornisseur.Fournisseur;
import com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFille;
import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille;
import com.source.meuble.achat.proformat.Proformat;
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

    @Column(name = "etat")
    private Integer etat;

    @ManyToOne
    @JoinColumn(name = "id_proformat", nullable = false)
    private Proformat idProformat;

    @ManyToOne
    @JoinColumn(name = "id_fournisseur")
    private Fournisseur idFournisseur;

    @ManyToOne
    @JoinColumn(name = "id_client")
    private Client idClient;

    @OneToMany(mappedBy = "idBc", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<BonCommandeFille> filles;

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

    public String getEtatHtml() {
        String html = "";

        boolean isVFinance = false;
        boolean isVDirection = false;

        if(etat >= 1) {
            isVFinance = true;
        }
        if(etat >= 2) {
            isVDirection = true;
        }

        if(isVFinance) {
            html += "<span class=\"badge bg-label-success me-1 p-1\"><i class=\"bx bx-check\"></i> Finance</span>";

        } else {
            html += "<span class=\"badge bg-label-warning me-1 p-1\"><i class=\"bx bx-x\"></i> Finance</span>";
        }

        if(isVDirection) {
            html += "<span class=\"badge bg-label-success me-1 p-1\"><i class=\"bx bx-check\"></i> Direction</span>";

        } else {
            html += "<span class=\"badge bg-label-warning me-1 p-1\"><i class=\"bx bx-x\"></i> Direction</span>";
        }

        if(etat == 3) {
            html += "<span class=\"badge bg-label-primary me-1 p-1\"><i class=\"bx bx-check\"></i>Commandé</span>";
        }

        if(etat == 4) {
            html += "<span class=\"badge bg-label-primary me-1 p-1\"><i class=\"bx bx-check\"></i>Reçu</span>";
        }

        return html;
    }

    public boolean isValide() {
        return this.etat == 2;
    }
}