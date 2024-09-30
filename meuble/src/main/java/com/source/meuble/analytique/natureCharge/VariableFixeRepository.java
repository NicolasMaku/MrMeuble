package com.source.meuble.analytique.natureCharge;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VariableFixeRepository extends JpaRepository<VariableFixe, Long> {
    List<VariableFixe> findByNatureAndIdExercice(int nature, int id_exercice);
}
