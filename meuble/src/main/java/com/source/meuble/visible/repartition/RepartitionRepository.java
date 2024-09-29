package com.source.meuble.visible.repartition;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.exercice.Exercice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RepartitionRepository  extends JpaRepository<Repartition, Long> {
    @Query(value = "select * from v_repartition where id_exercice = :id_exercice", nativeQuery = true)
    List<Repartition> findByExercice(int id_exercice);

    List<Repartition> findByIdExercice(int id_exercice);
}