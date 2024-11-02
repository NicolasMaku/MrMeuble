package com.source.meuble.achat.Facture;

import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille;
import com.source.meuble.achat.Facture.FactureFille.FactureFille;
import com.source.meuble.achat.Facture.FactureFille.FactureFilleRepository;
import com.source.meuble.achat.Facture.FactureFille.FactureFilleService;
import com.source.meuble.exception.Alert;
import com.source.meuble.stock.mouvementStock.MouvementStockService;
import jakarta.transaction.Transactional;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class FactureService {

    private final FactureRepository factureRepository;
    private final FactureFilleRepository factureFilleRepository;
    @Autowired
    private MouvementStockService mouvementStockService;

    @Autowired
    public FactureService(FactureRepository factureRepository, FactureFilleRepository factureFilleRepository) {
        this.factureRepository = factureRepository;
        this.factureFilleRepository = factureFilleRepository;
    }

    @Autowired
    private FactureFilleService factureFilleService;

    public List<Facture> findAll() {
        return factureRepository.findAll();
    }

    public Optional<Facture> findById(Integer id) {
        return factureRepository.findById(id);
    }

    public Facture save(Facture facture) {
        return factureRepository.save(facture);
    }

    public void deleteById(Integer id) {
        factureRepository.deleteById(id);
    }

    public List<FactureFille> findFilleByIdMere(Integer idFact) {

        return factureFilleRepository.findByIdFacture_Id(idFact);
    }

    public Facture genererFacture(BonReception br){
        Facture facture = new Facture();

        facture.setIdBr(br);
        facture.setIdBc(br.getIdBc());
        facture.setDateFacture(br.getDateReception());
        facture.setIdFournisseur(br.getIdBc().getIdFournisseur());
        facture.setIdClient(br.getIdBc().getIdClient());

        return factureRepository.save(facture);
    }

    @Transactional
    public Facture genererFactureAvecStock(@NonNull BonReception br) throws Exception {
        if(br.getEtat() == 2) {
            throw new Alert("Facture déjà generé");
        }

        List<BonReceptionFille> brfs = br.getFille();
        if(brfs.isEmpty()) throw new Exception("BR fille est vide");

        Facture facture = new Facture();
        facture.setIdBr(br);
        facture.setIdBc(br.getIdBc());
        facture.setDateFacture(br.getDateReception());
        facture.setIdFournisseur(br.getIdBc().getIdFournisseur());
        facture.setIdClient(br.getIdBc().getIdClient());

        facture = factureRepository.save(facture);

        List<FactureFille> ffs = new ArrayList<>();
        for(BonReceptionFille brf: brfs) {
            FactureFille ff = new FactureFille();
            ff.setIdFacture(facture);
            ff.setIdMarchandise(brf.getIdMarchandise());
            ff.setPrix(BigDecimal.valueOf(brf.getPrix()));
            ff.setQuantite(BigDecimal.valueOf(brf.getQuantite()));
            ffs.add(ff);
        }

        factureFilleRepository.saveAll(ffs);
        br.setEtat(2);
        facture.setFilles(ffs);
        mouvementStockService.genererFromFactureAchatAvecStock(facture);

        return facture;
    }

    public Facture genererFactureWithFille(BonReception bonReception){
        Facture facture = this.genererFacture(bonReception);
        factureFilleService.genererAllFactureFille(facture, bonReception.getIdBc());
        return facture;
    }
}

