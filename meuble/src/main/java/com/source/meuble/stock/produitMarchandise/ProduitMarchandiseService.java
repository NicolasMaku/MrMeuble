package com.source.meuble.stock.produitMarchandise;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProduitMarchandiseService {

    @Autowired
    private ProduitMarchandiseRepository produitMarchandiseRepository;

    public List<ProduitMarchandise> findAll() {
        return produitMarchandiseRepository.findAll();
    }

    public Optional<ProduitMarchandise> findById(Integer id) {
        return produitMarchandiseRepository.findById(id);
    }

    public ProduitMarchandise save(ProduitMarchandise produitMarchandise) {
        return produitMarchandiseRepository.save(produitMarchandise);
    }

    public void deleteById(Integer id) {
        produitMarchandiseRepository.deleteById(id);
    }

    public List<ProduitMarchandise> findProduitMarchandisesByIdProduit(Integer idProduit){
        return produitMarchandiseRepository.findProduitMarchandisesByIdProduit(idProduit);
    }
}
