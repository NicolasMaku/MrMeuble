package com.source.meuble.analytique.rubrique;

import java.util.List;

import com.source.meuble.analytique.exercice.Exercice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface RubriqueRepository extends JpaRepository<Rubrique, Integer> {
    @Query("select r from Rubrique r where r.idExercice.id = ?1")
    Rubrique findByIdExercice_Id(Integer id);

    @Query("select r from Rubrique r where r.idExercice.id = ?1")
    List<Rubrique> findAllByIdExercice(Integer id);
}