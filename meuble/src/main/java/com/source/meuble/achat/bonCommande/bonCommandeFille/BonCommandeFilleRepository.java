package com.source.meuble.achat.bonCommande.bonCommandeFille;

import com.source.meuble.achat.bonCommande.BonCommande;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BonCommandeFilleRepository extends JpaRepository<BonCommandeFille, Integer> {
    @Query("select b from BonCommandeFille b where b.idBc.id=:idBonCommande")
    List<BonCommandeFille> findFilleBonCommande(@Param("idBonCommande") Integer id);

    List<BonCommandeFille> findByIdBc(BonCommande idBc);

    List<BonCommandeFille> findByIdBc_Id(Integer id);
}
