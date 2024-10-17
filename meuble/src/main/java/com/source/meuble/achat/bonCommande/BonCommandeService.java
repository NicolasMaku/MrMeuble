package com.source.meuble.achat.bonCommande;

import com.source.meuble.achat.bonCommandeFille.BonCommandeFille;
import com.source.meuble.achat.bonCommandeFille.BonCommandeFilleRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class BonCommandeService {
    private final BonCommandeRepository bonCommandeRepository;
    private final BonCommandeFilleRepository bonCommandeFilleRepository;

    public BonCommandeService(BonCommandeRepository bonCommandeRepository, BonCommandeFilleRepository bonCommandeFilleRepository) {
        this.bonCommandeRepository = bonCommandeRepository;
        this.bonCommandeFilleRepository = bonCommandeFilleRepository;
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
}
