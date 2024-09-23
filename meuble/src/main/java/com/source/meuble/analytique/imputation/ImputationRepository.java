package com.source.meuble.analytique.imputation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.rubrique.Rubrique;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ImputationRepository
        extends JpaRepository<com.source.meuble.analytique.imputation.Imputation, Long> {

    List<Imputation> findByIdCentre(Centre centre);

}