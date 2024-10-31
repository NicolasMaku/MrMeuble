package com.source.meuble.analytique.produit;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProduitRepository extends JpaRepository<Produit, Integer> {
//    @Query("SELECT p FROM Produit p WHERE p.idExercice.id = :idExercice")
//    List<Produit> findAllByIdExercice(Integer idExercice);

    @Query("SELECT p FROM Produit p")
    List<Produit> findAllByIdExercice(Integer idExercice);

}
