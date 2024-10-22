package com.source.meuble.achat.bonCommande.bonCommandeFille;

import com.source.meuble.achat.BonReception.BonReceptionFille.BonReceptionFille;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BonCommandeFilleService {

    private final BonCommandeFilleRepository bonCommandeFilleRepository;

    @Autowired
    public BonCommandeFilleService(BonCommandeFilleRepository bonCommandeFilleRepository) {
        this.bonCommandeFilleRepository = bonCommandeFilleRepository;
    }

    public List<BonCommandeFille> findAll() {
        return bonCommandeFilleRepository.findAll();
    }

    public Optional<BonCommandeFille> findById(Integer id) {
        return bonCommandeFilleRepository.findById(id);
    }


    public BonCommandeFille save(BonCommandeFille bonCommandeFille) {
        return bonCommandeFilleRepository.save(bonCommandeFille);
    }

    public void deleteById(Integer id) {
        bonCommandeFilleRepository.deleteById(id);
    }

    public List<BonCommandeFille> findFilleBonCommande(Integer id){
        return bonCommandeFilleRepository.findFilleBonCommande(id);
    }
}

