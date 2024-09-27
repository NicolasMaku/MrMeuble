package com.source.meuble.utilisateur;

import org.springframework.stereotype.Service;

@Service
public class UtilisateurService {

    private final UtilisateurRepository utilisateurRepository;

    public UtilisateurService(UtilisateurRepository utilisateurRepository) {
        this.utilisateurRepository = utilisateurRepository;
    }

    public Utilisateur login(String username, String password)
            throws Exception {
        return utilisateurRepository.findByUsernameAndPassword(username, password)
            .orElseThrow()
        ;
    }
}
