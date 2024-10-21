package com.source.meuble.analytique.produit;


import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProduitService {

    private final ProduitRepository produitRepository;

    public ProduitService(ProduitRepository produitRepository) {
        this.produitRepository = produitRepository;
    }

    public List<Produit> findAllByIdExercice(Integer idExcercice) {
        return produitRepository.findAllByIdExercice(idExcercice);
    }
}
