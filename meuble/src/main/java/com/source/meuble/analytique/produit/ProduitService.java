package com.source.meuble.analytique.produit;


import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProduitService {

    private final ProduitRepository produitRepository;

    public ProduitService(ProduitRepository produitRepository) {
        this.produitRepository = produitRepository;
    }

    public List<Produit> findAllByIdExercice(Integer idExcercice) {
        return produitRepository.findAllByIdExercice(idExcercice);
    }

    public Optional<Produit> findById(Integer idMarchandise) {
        return produitRepository.findById(idMarchandise);
    }

    public List<Produit> findAll() {
        return produitRepository.findAll();
    }
}
