package com.source.meuble.analytique.exercice;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExerciceRepository extends JpaRepository<Exercice, Integer> {

}
