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

    @Query(value = "select row_number() over ()\n" +
            "        ,by_centre.*, round((montant*100)/operationnel,2) as cle,\n" +
            "       structure*round((montant*100)/operationnel,2)/100 as structure,\n" +
            "       (by_centre.montant + structure*round((montant*100)/operationnel,2)/100) as cout_total\n" +
            "from\n" +
            "    (select id_centre,id_exercice,nom,sum(reel) as montant,categorie\n" +
            "     from analyse_ensemble GROUP BY id_centre,id_exercice,categorie, nom having categorie=1 and id_exercice= :id_exercice) as by_centre\n" +
            "        join (select sum(reel) as operationnel from analyse_ensemble where categorie=1 and id_exercice= :id_exercice) as operationnel on True\n" +
            "        join (select sum(reel) as structure from analyse_ensemble where categorie=0 and id_exercice= :id_exercice) as structure on True\n" +
            ";", nativeQuery = true)
    List<Repartition> myFindByIdExercice(int id_exercice);
}