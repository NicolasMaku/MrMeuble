package com.source.meuble.achat.bonReception;

import com.source.meuble.achat.BonCommande;
import org.springframework.stereotype.Service;

@Service
public class BonReceptionService {

    private final BonReceptionRepository bonReceptionRepository;

    public BonReceptionService(BonReceptionRepository bonReceptionRepository) {
        this.bonReceptionRepository = bonReceptionRepository;
    }

    public BonReception transfertToBr(BonCommande commande){
        pu
    }
}
