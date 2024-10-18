package com.source.meuble.achat.Facture.FactureFille;

import com.source.meuble.achat.Facture.Facture;
import com.source.meuble.achat.bonCommande.BonCommande;
import com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFille;
import com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFilleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class FactureFilleService {

    private final FactureFilleRepository factureFilleRepository;

    @Autowired
    public FactureFilleService(FactureFilleRepository factureFilleRepository) {
        this.factureFilleRepository = factureFilleRepository;
    }

    @Autowired
    private BonCommandeFilleService bonCommandeFilleService;

    public List<FactureFille> findAll() {
        return factureFilleRepository.findAll();
    }

    public Optional<FactureFille> findById(Integer id) {
        return factureFilleRepository.findById(id);
    }

    public FactureFille save(FactureFille factureFille) {
        return factureFilleRepository.save(factureFille);
    }

    public void deleteById(Integer id) {
        factureFilleRepository.deleteById(id);
    }

    public Facture genererAllFactureFille(Facture facture, BonCommande bonCommande){
        List<BonCommandeFille> bonCommandeFilles = bonCommandeFilleService.findFilleBonCommande(bonCommande.getId());
        for(int i=0 ; i<bonCommandeFilles.size(); i++){
            BonCommandeFille bonCommandeFille = bonCommandeFilles.get(i);

            FactureFille factureFille = new FactureFille();
            factureFille.setIdFacture(facture);
            factureFille.setIdMarchandise(bonCommandeFille.getIdMarchandise());
            factureFille.setQuantite(BigDecimal.valueOf(bonCommandeFille.getQuantite()));
            factureFille.setPrix(BigDecimal.valueOf(bonCommandeFille.getPrix()));

            factureFilleRepository.save(factureFille);
        }
        return facture;
    }
}

