package com.source.meuble.achat.proformat.proformatFille;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProformatFilleRepository extends JpaRepository<ProformatFille, Integer> {
}