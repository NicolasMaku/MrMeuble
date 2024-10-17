package com.source.meuble.achat.bonCommandeFille;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BonCommandeFilleRepository extends JpaRepository<BonCommandeFille, Integer> {
}
