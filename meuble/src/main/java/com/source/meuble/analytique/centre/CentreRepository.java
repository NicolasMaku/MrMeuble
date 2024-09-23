package com.source.meuble.analytique.centre;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

@Repository
public interface CentreRepository extends JpaRepository<Centre, Long> {
    @Query(value = "select * from centre where categorie = :categ", nativeQuery = true)
    List<Centre> centreByCategorie(int categ);
}
