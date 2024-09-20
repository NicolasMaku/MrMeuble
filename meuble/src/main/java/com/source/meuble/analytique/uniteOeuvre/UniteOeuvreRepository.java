package com.source.meuble.analytique.uniteOeuvre;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface UniteOeuvreRepository extends JpaRepository<UniteOeuvre, String> {

}
