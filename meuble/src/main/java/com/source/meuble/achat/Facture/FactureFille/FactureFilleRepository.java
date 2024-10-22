package com.source.meuble.achat.Facture.FactureFille;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FactureFilleRepository extends JpaRepository<FactureFille, Integer> {

    List<FactureFille> findByIdFacture_Id(Integer id);
}

