package com.source.meuble.stock.mouvementStock;

import com.source.meuble.stock.etatStock.EtatStock;
import com.source.meuble.stock.etatStock.EtatStockService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class MouvementStockService {
    private final MouvementStockRepository mouvementStockRepository;

    public MouvementStockService(MouvementStockRepository mouvementStockRepository) {
        this.mouvementStockRepository = mouvementStockRepository;
    }

    public MouvementStock saveMouvementStock(MouvementStock mouvementStock){
        return mouvementStockRepository.save(mouvementStock);
    }

    public List<MouvementStock> findAllMouvement(){
        return mouvementStockRepository.findAll();
    }

    public EtatStock saveMouvementStockWithEtat(MouvementStock mouvementStock, MouvementStockService mouvementStockService, EtatStockService etatStockService)throws Exception{
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
}
