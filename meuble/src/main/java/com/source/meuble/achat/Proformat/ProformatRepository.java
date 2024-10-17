package com.source.meuble.achat.Proformat;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProformatRepository extends JpaRepository<Proformat, Integer> {
}