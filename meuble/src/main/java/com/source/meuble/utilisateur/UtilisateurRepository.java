package com.source.meuble.utilisateur;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Integer> {


    @Query("SELECT u FROM Utilisateur u WHERE u.username = :username AND u.password = :password")
    Optional<Utilisateur> findByUsernameAndPassword(String username, String password);
}
