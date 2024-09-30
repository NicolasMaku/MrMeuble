package com.source.meuble.analytique.typeRubrique;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface TypeRubriqueRepository extends JpaRepository<TypeRubrique, Integer> {


}