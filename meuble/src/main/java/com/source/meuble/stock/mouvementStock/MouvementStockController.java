package com.source.meuble.stock.mouvementStock;

import com.source.meuble.stock.etatStock.EtatStock;
import com.source.meuble.stock.etatStock.EtatStockService;
import com.source.meuble.achat.marchandise.Marchandise;
import com.source.meuble.achat.marchandise.MarchandiseService;
import com.source.meuble.stock.produitMarchandise.ProduitMarchandise;
import com.source.meuble.stock.produitMarchandise.ProduitMarchandiseService;
import com.source.meuble.util.Redirection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/mouvementStock")
public class MouvementStockController {

    @Autowired
    MouvementStockService mouvementStockService;

    @Autowired
    EtatStockService etatStockService;

    @Autowired
    MarchandiseService marchandiseService;

    @Autowired
    ProduitMarchandiseService produitMarchandiseService;

    @GetMapping("/achatForm")
    public String achatForm(){
        return "achat";
    }

    @PostMapping("/achat")
    public String achatWithMouvementEtat(
            @RequestParam("idMarchandise") int idMarchandise,
            @RequestParam("quantite") int qt,
            @RequestParam("prixUnitaire") double pu,
            @RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateString
    ){
        int nat = 0;

        MouvementStock mouvementStock = null;

        System.out.println(qt);
        System.out.println(pu);
        try{
            LocalDate date = dateString.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            System.out.println(date.getDayOfMonth());

            mouvementStock = new MouvementStock();

            mouvementStock.setDateEnregistrement(date);
            mouvementStock.setQuantite(qt);
            mouvementStock.setPrixUnitaire(pu);
            mouvementStock.setNature(nat);
            mouvementStock.calculPrixTotal();

            Optional<Marchandise> optionalMarchandise = marchandiseService.findById(idMarchandise);
            if (optionalMarchandise.isPresent()) {
                mouvementStock.setMarchandise(optionalMarchandise.get());
            } else {
                throw new RuntimeException("Marchandise non trouvée avec l'ID: " + idMarchandise);
            }

            EtatStock etatStock = mouvementStockService.saveMouvementStockWithEtat(mouvementStock, mouvementStockService, etatStockService);

            System.out.println("Success");
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        Redirection redirection = new Redirection("/home");
        return redirection.getUrl();
    }

    @PostMapping("/vente")
    public String venteWithMouvementEtat(
            @RequestParam("idProduit") int idProduit,
            @RequestParam("quantite") int qt,
            @RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateString
    ){
        int nat = 1;

        MouvementStock mouvementStock = null;

        try{
            LocalDate date = dateString.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            List<ProduitMarchandise> produitMarchandises = produitMarchandiseService.findProduitMarchandisesByIdProduit(idProduit);

            for(int i=0; i<produitMarchandises.size(); i++){
                ProduitMarchandise produitMarchandise = produitMarchandises.get(i);

                mouvementStock = new MouvementStock();

                mouvementStock.setDateEnregistrement(date);
                mouvementStock.setQuantite(qt*produitMarchandise.getQuantite());
                mouvementStock.setNature(nat);

                Optional<Marchandise> optionalMarchandise = marchandiseService.findById(produitMarchandise.getMarchandise().getIdMarchandise());
                if (optionalMarchandise.isPresent()) {
                    mouvementStock.setMarchandise(optionalMarchandise.get());
                } else {
                    throw new RuntimeException("Marchandise non trouvée avec l'ID: " + produitMarchandise.getMarchandise().getIdMarchandise());
                }

                EtatStock etatStock = mouvementStockService.saveMouvementStockWithEtat(mouvementStock, mouvementStockService, etatStockService);

                System.out.println("Success");
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        Redirection redirection = new Redirection("/home");
        return redirection.getUrl();
    }

    @GetMapping("stock/mouvementStock")
    public ModelAndView allMouvementStock(){
        ModelAndView modelAndView = new ModelAndView("template");

        List<MouvementStock> mouvementStocks = mouvementStockService.findAllMouvement();
        modelAndView.addObject("mouvement", mouvementStocks);

        String content = "landingStock.jsp";
        String sidebar = "template/floating-sidebar-stock.jsp";
        String validation = "stock/mouvementStock.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);

        return modelAndView;
    }
}
