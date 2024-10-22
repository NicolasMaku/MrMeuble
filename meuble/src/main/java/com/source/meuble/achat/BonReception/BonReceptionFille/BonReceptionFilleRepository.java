package com.source.meuble.achat.BonReception.BonReceptionFille;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BonReceptionFilleRepository extends JpaRepository<BonReceptionFille, Integer> {

    List<BonReceptionFille> findByIdBr_Id(Integer id);
}

