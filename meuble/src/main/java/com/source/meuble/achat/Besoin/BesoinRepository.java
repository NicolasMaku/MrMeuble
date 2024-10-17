package com.source.meuble.achat.Besoin;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BesoinRepository extends JpaRepository<Besoin,Integer> {

    @Query("select b from Besoin b where b.etat = ?1")
    Besoin findByEtat(Integer etat);

    @Query("select b from Besoin b where b.etat = ?1")
    List<Besoin> findAllByEtat(Integer etat);
}
