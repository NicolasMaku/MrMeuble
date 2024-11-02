package com.source.meuble.achat.bonCommande;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BonCommandeRepository extends JpaRepository<BonCommande, Integer> {

    @Query("select bc from BonCommande bc where (:role like 'DEPT_FINANCE' and bc.etat = 0) or (:role like 'DIRECTION' and bc.etat = 1)")
    List<BonCommande> findAllByRole(String role);
}
