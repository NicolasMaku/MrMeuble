package com.source.meuble.stock.produitFinit;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProduitFinitRepository extends JpaRepository<ProduitFinit, Integer> {
}
