package com.source.meuble.stock.produitFinit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProduitFinitService {

    @Autowired
    private ProduitFinitRepository produitFinitRepository;

    public List<ProduitFinit> findAll() {
        return produitFinitRepository.findAll();
    }

    public Optional<ProduitFinit> findById(Integer id) {
        return produitFinitRepository.findById(id);
    }

    public ProduitFinit save(ProduitFinit marchandise) {
        return produitFinitRepository.save(marchandise);
    }

    public void deleteById(Integer id) {
        produitFinitRepository.deleteById(id);
    }
}
