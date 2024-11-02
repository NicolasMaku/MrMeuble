package com.source.meuble.achat.besoin;

import com.source.meuble.utilisateur.UserRole;
import com.source.meuble.utilisateur.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BesoinRepository extends JpaRepository<Besoin,Integer> {

    @Query("select b from Besoin b where b.etat = ?1")
    Besoin findByEtat(Integer etat);

    @Query("select b from Besoin b where b.etat = ?1")
    List<Besoin> findAllByEtat(Integer etat);

    @Query("select b from Besoin b where (:role = 'DIRECTION' and b.etat = 1) or (:role = 'DEPT_ACHAT' and b.etat = 0)")
    List<Besoin> findAllByRole(String role);


}
