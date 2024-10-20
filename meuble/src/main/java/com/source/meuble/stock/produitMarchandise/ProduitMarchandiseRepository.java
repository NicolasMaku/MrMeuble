package com.source.meuble.stock.produitMarchandise;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProduitMarchandiseRepository extends JpaRepository<ProduitMarchandise, Integer> {
    @Query("select p from ProduitMarchandise p where p.produitFinit.idProduitFinit = :idProduitFinit")
    List<ProduitMarchandise> findProduitMarchandisesByIdProduit(@Param("idProduitFinit") Integer idProduitFinit);
}

