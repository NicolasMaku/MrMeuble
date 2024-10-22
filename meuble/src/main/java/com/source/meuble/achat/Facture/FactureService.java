package com.source.meuble.achat.Facture;

import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille;
import com.source.meuble.achat.Facture.FactureFille.FactureFille;
import com.source.meuble.achat.Facture.FactureFille.FactureFilleRepository;
import com.source.meuble.achat.Facture.FactureFille.FactureFilleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FactureService {

    private final FactureRepository factureRepository;
    private final FactureFilleRepository factureFilleRepository;

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

    public Facture genererFactureWithFille(BonReception bonReception){
        Facture facture = this.genererFacture(bonReception);
        factureFilleService.genererAllFactureFille(facture, bonReception.getIdBc());
        return facture;
    }
}

