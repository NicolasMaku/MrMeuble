package com.source.meuble.achat.bonReception;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BonReceptionRepository extends JpaRepository<BonReception, Integer> {
}