package com.source.meuble.achat.BonReception;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BonReceptionRepository extends JpaRepository<BonReception, Integer> {

}

