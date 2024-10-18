package com.source.meuble.achat.BonReception;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BonReceptionService {

    private final BonReceptionRepository bonReceptionRepository;

    @Autowired
    public BonReceptionService(BonReceptionRepository bonReceptionRepository) {
        this.bonReceptionRepository = bonReceptionRepository;
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

}
