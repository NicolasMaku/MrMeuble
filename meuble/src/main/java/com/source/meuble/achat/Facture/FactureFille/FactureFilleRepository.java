package com.source.meuble.achat.Facture.FactureFille;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FactureFilleRepository extends JpaRepository<FactureFille, Integer> {

}

