package com.source.meuble.stock.etatStock;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EtatStockRepository extends JpaRepository<EtatStock, Integer>{
    @Query("select e from EtatStock e where e.marchandise.id = :idMarchandise order by e.id desc limit 1")
    EtatStock findLastEtat(@Param("idMarchandise") Integer idMarchandise);

    @Query("select e from EtatStock e where e.marchandise.id = :idMarchandise")
    List<EtatStock> findAll(@Param("idMarchandise") Integer idMarchandise);

    @Query("SELECT e FROM EtatStock e WHERE e.id IN " +
            "(SELECT MAX(e2.id) FROM EtatStock e2 GROUP BY e2.marchandise)")
    List<EtatStock> resteEnStock();
}
