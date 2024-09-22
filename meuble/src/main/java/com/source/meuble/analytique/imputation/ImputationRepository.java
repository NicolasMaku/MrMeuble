package com.source.meuble.analytique.imputation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.rubrique.Rubrique;
import java.util.List;

@Repository
public interface ImputationRepository
        extends JpaRepository<com.source.meuble.analytique.imputation.Imputation, String> {

    List<Imputation> findByIdCentre(Centre centre);

}