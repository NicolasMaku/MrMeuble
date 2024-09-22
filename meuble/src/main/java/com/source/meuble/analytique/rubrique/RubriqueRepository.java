package com.source.meuble.analytique.rubrique;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface RubriqueRepository extends JpaRepository<Rubrique, String> {
    // @Query("select r from Rubrique r where id_centre like :idCentre")
    // List<Rubrique> getByIdCentre(String idCentre);
}