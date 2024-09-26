package com.source.meuble.analytique.listeAnalytique;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ListAnalytiqueRepository extends JpaRepository<ListAnalytique, Long> {
}