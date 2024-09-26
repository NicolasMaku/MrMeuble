package com.source.meuble.analytique.listeGeneral;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ListeGeneralRepository extends JpaRepository<ListeGeneral, Long> {
}