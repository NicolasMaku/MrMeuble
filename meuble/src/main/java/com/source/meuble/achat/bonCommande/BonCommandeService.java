package com.source.meuble.achat.bonCommande;

import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFille;
import com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFilleRepository;
import com.source.meuble.achat.proformat.Proformat;
import com.source.meuble.achat.proformat.proformatFille.ProformatFille;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;

@Service
public class BonCommandeService {
    private final BonCommandeRepository bonCommandeRepository;
    private final BonCommandeFilleRepository bonCommandeFilleRepository;

    public BonCommandeService(BonCommandeRepository bonCommandeRepository, BonCommandeFilleRepository bonCommandeFilleRepository) {
        this.bonCommandeRepository = bonCommandeRepository;
        this.bonCommandeFilleRepository = bonCommandeFilleRepository;
    }

    public Optional<BonCommande> findById(Integer id) {
        return bonCommandeRepository.findById(id);
    }
    public List<BonCommandeFille> findFilleByIdMere(Integer idBc) {

        return bonCommandeFilleRepository.findByIdBc_Id(idBc);
    }

    public List<BonCommande> getAllBonCommande() {
        return bonCommandeRepository.findAll();
    }


    @Transactional
    public BonCommande commander(LocalDate dateComm, LocalDate dateLivr, List<BonCommandeFille> bcFilles)
            throws Exception {
        if(bcFilles.isEmpty()) {
            throw new Exception("le nombre de BCF doit etre superieur a 0");
        }

        BonCommande bc = new BonCommande();
        bc.setDateCommande(dateComm != null ? dateComm : LocalDate.now());
        bc.setDateLivraison(dateLivr);
        bc = bonCommandeRepository.save(bc);

        for(BonCommandeFille bcf: bcFilles) {
            bcf.setIdBc(bc);
        }

        bonCommandeFilleRepository.saveAll(bcFilles);
        return bc;
    }

    @Transactional
    public BonCommande validerBonCommande(BonCommande bc) {
        if(bc.getEtat() < 2) {
            bc.setEtat(bc.getEtat() + 1);
            bonCommandeRepository.save(bc);
        }
        return bc;
    }

    @Transactional public BonCommande genererBonCommande(Proformat proformat) {
        BonCommande bc = new BonCommande();
        List<ProformatFille> pfs = proformat.getFilles();

        bc.setEtat(0);
        bc.setDateCommande(LocalDate.now());
        bc.setIdFournisseur(proformat.getIdFournisseur());
        bc.setIdProformat(proformat);
        bc = bonCommandeRepository.save(bc);

        List<BonCommandeFille> bcfs = new ArrayList<>();

        for(ProformatFille pf: pfs) {
            BonCommandeFille bcf = new BonCommandeFille();
            bcf.setIdBc(bc);
            bcf.setPrix(pf.getPrix().doubleValue());
            bcf.setQuantite(pf.getQte());
            bcf.setIdMarchandise(pf.getIdMarchandise());
            bcfs.add(bcf);
        }

        bonCommandeFilleRepository.saveAll(bcfs);
        return bc;
    }

    public Map<Integer, List<BonCommande>> getBonCommandeGroupByEtat() {
        List<BonCommande> bcs = bonCommandeRepository.findAll();

        Map<Integer, List<BonCommande>> map = new HashMap<>();
        map.put(0, new ArrayList<>());
        map.put(1, new ArrayList<>());
        map.put(2, new ArrayList<>());

        for(BonCommande bc: bcs) {
            map.get(bc.getEtat()).add(bc);
        }

        return map;
    }
}


