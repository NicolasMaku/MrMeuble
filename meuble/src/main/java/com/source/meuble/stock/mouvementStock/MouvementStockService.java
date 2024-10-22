package com.source.meuble.stock.mouvementStock;

import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille;
import com.source.meuble.achat.marchandise.Marchandise;
import com.source.meuble.achat.marchandise.MarchandiseService;
import com.source.meuble.stock.produitMarchandise.ProduitMarchandiseService;
import com.source.meuble.stock.etatStock.EtatStock;
import com.source.meuble.stock.etatStock.EtatStockService;
import com.source.meuble.util.Redirection;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class MouvementStockService {
    private final MouvementStockRepository mouvementStockRepository;
    private final EtatStockService etatStockService;
    private final MouvementStockService mouvementStockService;
    private final MarchandiseService marchandiseService;

    public MouvementStockService(MouvementStockRepository mouvementStockRepository, EtatStockService etatStockService, MouvementStockService mouvementStockService, MarchandiseService marchandiseService) {
        this.mouvementStockRepository = mouvementStockRepository;
        this.etatStockService = etatStockService;
        this.mouvementStockService = mouvementStockService;
        this.marchandiseService = marchandiseService;
    }

    public MouvementStock saveMouvementStock(MouvementStock mouvementStock){
        return mouvementStockRepository.save(mouvementStock);
    }

    public List<MouvementStock> findAllMouvement(){
        return mouvementStockRepository.findAll();
    }

    public EtatStock saveMouvementStockWithEtat(MouvementStock mouvementStock, EtatStockService etatStockService)throws Exception{
        EtatStock etatStock = null;
        if(etatStockService.findAllEtat(mouvementStock.getMarchandise().getIdMarchandise()).size()==0){

            EtatStock etatStockDernier = new EtatStock(mouvementStock.getDateEnregistrement(), 0, 0);

            EtatStock etatStockNouveau = etatStockService.calculateData(mouvementStock, etatStockDernier);

            mouvementStockService.saveMouvementStock(mouvementStock);

            etatStock = etatStockService.saveEtatStock(etatStockNouveau);
        }
        else {

            EtatStock etatStockDernier = etatStockService.findLastEtat(mouvementStock.getMarchandise().getIdMarchandise());
            etatStockDernier.calculPrixTotal();

            if(mouvementStock.getNature()==1){

                mouvementStock.setPrixUnitaire(etatStockDernier.getPrixUnitaire().doubleValue());
                mouvementStock.calculPrixTotal();
            }

            EtatStock etatStockNouveau = etatStockService.calculateData(mouvementStock, etatStockDernier);
            mouvementStockService.saveMouvementStock(mouvementStock);

            etatStock = etatStockService.saveEtatStock(etatStockNouveau);
        }
        return etatStock;
    }
    public String achatWithMouvementEtat2(BonReception idBonReception){
        int nat = 0;

        MouvementStock mouvementStock = null;

        try{
            LocalDate date = idBonReception.getDateReception();

            for (int i=0; i<idBonReception.getFille().size(); i++){
                BonReceptionFille bonReceptionFille = idBonReception.getFille().get(i);
                mouvementStock = new MouvementStock();

                mouvementStock.setDateEnregistrement(date);
                mouvementStock.setQuantite(Integer.parseInt((bonReceptionFille.getQuantite()).toString()));
                mouvementStock.setPrixUnitaire(bonReceptionFille.getPrix());
                mouvementStock.setNature(nat);
                mouvementStock.calculPrixTotal();

                Optional<Marchandise> optionalMarchandise = marchandiseService.findById(bonReceptionFille.getIdMarchandise().getIdMarchandise());
                if (optionalMarchandise.isPresent()) {
                    mouvementStock.setMarchandise(optionalMarchandise.get());
                } else {
                    throw new RuntimeException("Marchandise non trouvée avec l'ID: " + bonReceptionFille.getIdMarchandise().getIdMarchandise());
                }

                EtatStock etatStock = mouvementStockService.saveMouvementStockWithEtat(mouvementStock, etatStockService);

                System.out.println("Success");
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        Redirection redirection = new Redirection("/home");
        return redirection.getUrl();
    }
}
