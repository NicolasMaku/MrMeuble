package com.source.meuble.achat.BonReception.BonReceptionFille;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BonReceptionFilleService {

    private final BonReceptionFilleRepository bonReceptionFilleRepository;

    @Autowired
    public BonReceptionFilleService(BonReceptionFilleRepository bonReceptionFilleRepository) {
        this.bonReceptionFilleRepository = bonReceptionFilleRepository;
    }

    public List<BonReceptionFille> findAll() {
        return bonReceptionFilleRepository.findAll();
    }

    public Optional<BonReceptionFille> findById(Integer id) {
        return bonReceptionFilleRepository.findById(id);
    }

    public BonReceptionFille save(BonReceptionFille bonReceptionFille) {
        return bonReceptionFilleRepository.save(bonReceptionFille);
    }

    public void deleteById(Integer id) {
        bonReceptionFilleRepository.deleteById(id);
    }

}
