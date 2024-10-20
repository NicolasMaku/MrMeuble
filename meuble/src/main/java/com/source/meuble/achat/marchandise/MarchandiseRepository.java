package com.source.meuble.achat.marchandise;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MarchandiseRepository extends JpaRepository<Marchandise, Integer> {
}

