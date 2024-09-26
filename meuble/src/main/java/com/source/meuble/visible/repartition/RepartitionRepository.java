package com.source.meuble.visible.repartition;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepartitionRepository  extends JpaRepository<Repartition, Long> {

}