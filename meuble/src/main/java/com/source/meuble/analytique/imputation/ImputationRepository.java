package com.source.meuble.analytique.imputation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImputationRepository extends JpaRepository<com.source.meuble.analytique.imputation.Imputation, String> {
}