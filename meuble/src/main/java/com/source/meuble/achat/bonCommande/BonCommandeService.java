package com.source.meuble.achat.bonCommande;

import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFille;
import com.source.meuble.achat.bonCommande.bonCommandeFille.BonCommandeFilleRepository;
import com.source.meuble.achat.proformat.Proformat;
import com.source.meuble.achat.proformat.ProformatRepository;
import com.source.meuble.achat.proformat.proformatFille.ProformatFille;
import com.source.meuble.exception.Alert;
import com.source.meuble.utilisateur.Utilisateur;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;

@Service
public class BonCommandeService {
    private final BonCommandeRepository bonCommandeRepository;
    private final BonCommandeFilleRepository bonCommandeFilleRepository;
    private final ProformatRepository proformatRepository;

    public BonCommandeService(BonCommandeRepository bonCommandeRepository, BonCommandeFilleRepository bonCommandeFilleRepository,
                              ProformatRepository proformatRepository) {
        this.bonCommandeRepository = bonCommandeRepository;
        this.bonCommandeFilleRepository = bonCommandeFilleRepository;
        this.proformatRepository = proformatRepository;
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

    public List<BonCommande> getAllBcByUtilisateur(Utilisateur u) {
        return bonCommandeRepository.findAllByRole(u.getRole().name());
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
    public BonCommande commander(BonCommande bc, LocalDate dateComm, LocalDate dateLivr)
        throws Exception {
//        if(bc.getEtat() == 3) {
//            throw new Alert("Proformat");
//        }
        List<BonCommandeFille> bcFilles = bc.getFilles();

        if(bcFilles.isEmpty()) {
            throw new Exception("le nombre de BCF doit etre superieur a 0");
        }

        bc.setDateCommande(dateComm != null ? dateComm : LocalDate.now());
        bc.setDateLivraison(dateLivr);
        bc.setEtat(3);
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
        bc.setDateCommande(null);
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
        proformat.setEtat(2);
        proformatRepository.save(proformat);
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

    public List<BonCommande> findAll() {
        return bonCommandeRepository.findAll();
    }
}


