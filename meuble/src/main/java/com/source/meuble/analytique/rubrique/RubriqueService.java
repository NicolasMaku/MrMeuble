package com.source.meuble.analytique.rubrique;


import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RubriqueService {

    private final RubriqueRepository rubriqueRepository;

    public RubriqueService(RubriqueRepository rubriqueRepository) {
        this.rubriqueRepository = rubriqueRepository;
    }

    @Transactional
    public Rubrique saveRubrique(Rubrique rubrique) {
        return rubriqueRepository.save(rubrique);
    }

    public List<Rubrique> getAllRubrique() {
        return rubriqueRepository.findAll();
    }
}
