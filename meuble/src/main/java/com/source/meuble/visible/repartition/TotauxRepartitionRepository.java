package com.source.meuble.visible.repartition;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TotauxRepartitionRepository extends JpaRepository<TotauxRepartition, Long> {
    List<TotauxRepartition> findByIdExercice(int id_exercice);
}