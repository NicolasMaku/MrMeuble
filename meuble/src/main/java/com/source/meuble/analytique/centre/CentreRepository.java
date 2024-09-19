package com.source.meuble.analytique.centre;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface CentreRepository extends JpaRepository<Centre, String> {

}
