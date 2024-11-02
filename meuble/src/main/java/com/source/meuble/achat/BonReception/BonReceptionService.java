package com.source.meuble.achat.BonReception;

import com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille;
import com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFilleRepository;
import com.source.meuble.achat.bonCommande.BonCommande;
import com.source.meuble.achat.bonCommande.BonCommandeRepository;
import com.source.meuble.achat.bonCommande.BonCommandeService;
import com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFille;
import com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFilleRepository;
import com.source.meuble.stock.mouvementStock.MouvementStockService;
import jakarta.transaction.Transactional;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BonReceptionService {

    private final BonReceptionRepository bonReceptionRepository;
    private final BonCommandeService bonCommandeService;
    private final BonReceptionFilleRepository bonReceptionFilleRepository;

    private final MouvementStockService mouvementStockService;
    private final BonCommandeRepository bonCommandeRepository;

    @Autowired
    public BonReceptionService(BonReceptionRepository bonReceptionRepository, BonCommandeService bonCommandeService,
                               BonReceptionFilleRepository bonReceptionFilleRepository, MouvementStockService mouvementStockService,
                               BonCommandeRepository bonCommandeRepository) {
        this.bonReceptionRepository = bonReceptionRepository;
        this.bonCommandeService = bonCommandeService;
        this.bonReceptionFilleRepository = bonReceptionFilleRepository;
        this.mouvementStockService = mouvementStockService;
        this.bonCommandeRepository = bonCommandeRepository;
    }

    public List<BonReception> findAll() {
        return bonReceptionRepository.findAll();
    }

    public Optional<BonReception> findById(Integer id) {
        return bonReceptionRepository.findById(id);
    }

    public BonReception save(BonReception bonReception) {
        return bonReceptionRepository.save(bonReception);
    }

    public void deleteById(Integer id) {
        bonReceptionRepository.deleteById(id);
    }

    public void transferBcToBr(int idBc , LocalDate daty){
        Optional<BonCommande> optionalBonCommande=bonCommandeService.findById(idBc);
        if (optionalBonCommande.isPresent()) {
            BonCommande bon = optionalBonCommande.get();
            BonReception br=this.genererBr(bon,daty);
            List<BonCommandeFille> bcFilles= bonCommandeService.findFilleByIdMere(bon.getId());
            this.genereBonReceptionFille(bcFilles,br);
//            mouvementStockService.achatWithMouvementEtat2(br);
        } else {
            // Gérer le cas où l'objet n'existe pas
        }
    }

    @Transactional
    public BonReception genererBR(@NonNull BonCommande bc, LocalDate dateReception) {
        if(dateReception == null) dateReception = LocalDate.now();

        BonReception br = new BonReception();
        br.setDateReception(dateReception);
        br.setEtat(0);
        br.setIdBc(bc);
        br = bonReceptionRepository.save(br);

        List<BonCommandeFille> bcfs = bc.getFilles();
        List<BonReceptionFille> brfs = new ArrayList<>();

        for(BonCommandeFille bcf: bcfs) {
            BonReceptionFille brf = new BonReceptionFille();
            brf.setIdBr(br);
            brf.setIdMarchandise(bcf.getIdMarchandise());
            brf.setPrix(bcf.getPrix());
            brf.setQuantite(bcf.getQuantite());
            brfs.add(brf);
        }

        bonReceptionFilleRepository.saveAll(brfs);

        bc.setEtat(4);
        bonCommandeRepository.save(bc);

        return br;
    }

    public BonReception genererBr(BonCommande bonCommande, LocalDate daty){
        BonReception br=new BonReception();
        br.setIdBc(bonCommande);
        br.setDateReception(daty);
        return bonReceptionRepository.save(br);
    }

    public void genereBonReceptionFille(List<BonCommandeFille> bonCommandeFilles, BonReception bonMere){
        for (BonCommandeFille bcFille: bonCommandeFilles){
            BonReceptionFille brFille=new BonReceptionFille();
            brFille.setIdMarchandise(bcFille.getIdMarchandise());
            brFille.setPrix(bcFille.getPrix());
            brFille.setIdBr(bonMere);
            brFille.setQuantite(bcFille.getQuantite());
            bonReceptionFilleRepository.save(brFille);
        }
    }

    public List<BonReceptionFille> findFilleByIdMere(Integer idBr) {

        return bonReceptionFilleRepository.findByIdBr_Id(idBr);
    }

}
