package com.source.meuble.stock.etatStock;

import com.source.meuble.stock.mouvementStock.MouvementStock;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Service
public class EtatStockService {
    private final EtatStockRepository etatStockRepository;

    public List<EtatStock> findAll(){
        return etatStockRepository.findAll();
    }

    public  List<EtatStock> resteEnStock(){
        return etatStockRepository.resteEnStock();
    }

    public EtatStockService(EtatStockRepository etatStockRepository) {
        this.etatStockRepository = etatStockRepository;
    }

    public EtatStock saveEtatStock(EtatStock etatStock){
        return etatStockRepository.save(etatStock);
    }

    public List<EtatStock> findAllEtat(Integer idMarchandise){
        return etatStockRepository.findAll(idMarchandise);
    }
    public EtatStock findLastEtat(Integer idMarchandise){
        return etatStockRepository.findLastEtat(idMarchandise);
    }

//    public EtatStock calculateData(MouvementStock mouvementStock, EtatStock etatStockDernier)throws Exception{
//        int qtNouveau = 0;
//        double pt = 0;
//        double pu = 0;
//
//        if(mouvementStock.getNature()==0){
//
//            qtNouveau = etatStockDernier.getQuantite()+mouvementStock.getQuantite();
//            pt = etatStockDernier.getPrixTotal().doubleValue()+mouvementStock.getPrixTotal().doubleValue();
//            pu = pt / qtNouveau;
//
//        }else {
//
//            qtNouveau = etatStockDernier.getQuantite()-mouvementStock.getQuantite();
//            pu = etatStockDernier.getPrixUnitaire().doubleValue();
//            pt = pu * qtNouveau;
//
//        }
//
//        EtatStock etatStock = new EtatStock();
//        etatStock.setDateEnregistrement(mouvementStock.getDateEnregistrement());
//        etatStock.setQuantite(qtNouveau);
//        etatStock.setPrixUnitaire(pu);
//        etatStock.setPrixTotal(pt);
//        etatStock.setMarchandise(mouvementStock.getMarchandise());
//
//        return etatStock;
//    }

    @Transactional
    public EtatStock genererEtatStock(MouvementStock mvt) throws Exception {
        EtatStock lastStock =  etatStockRepository.findLastEtatStockProduit(mvt.getMarchandise());

        if(lastStock == null) {
            lastStock = new EtatStock();
            lastStock.setMarchandise(mvt.getMarchandise());
            lastStock.setQte(0.00);
        }

        EtatStock newStock = new EtatStock();

        double entree = mvt.getEntree();
        double sortie = mvt.getSortie();

        newStock.setMarchandise(lastStock.getMarchandise());
        newStock.setQte(lastStock.getQte() + entree - sortie);
        newStock.setDateEnregistrement(mvt.getDateEnregistrement());
        newStock.setPrixUnitaire(mvt.getPrixUnitaire().doubleValue());

        return etatStockRepository.save(newStock);
    }

//    @Transactional
//    public EtatStock genererEtatStocks(List<MouvementStock> mvts) throws Exception {
//        Map
//        if(lastStock == null) {
//            lastStock = new EtatStock();
//            lastStock.setMarchandise(mvt.getMarchandise());
//            lastStock.setQte(0.00);
//        }
//
//        EtatStock newStock = new EtatStock();
//
//        double entree = mvt.getEntree();
//        double sortie = mvt.getSortie();
//
//        newStock.setMarchandise(lastStock.getMarchandise());
//        newStock.setQte(lastStock.getQte() + entree - sortie);
//        newStock.setDateEnregistrement(mvt.getDateEnregistrement());
//        newStock.setPrixUnitaire(mvt.getPrixUnitaire().doubleValue());
//
//        return etatStockRepository.save(newStock);
//    }
}
