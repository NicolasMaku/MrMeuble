package com.source.meuble.analytique.typeRubrique;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeRubriqueService {
    private final TypeRubriqueRepository typeRubriqueRepository;

    public TypeRubriqueService(TypeRubriqueRepository typeRubriqueRepository) {
        this.typeRubriqueRepository = typeRubriqueRepository;
    }

//    public List<TypeRubrique> getAllTypeRubrique

    public TypeRubrique saveTypeRubrique(TypeRubrique typeRubrique) {
        return typeRubriqueRepository.save(typeRubrique);
    }

    public List<TypeRubrique> getAllTypeRubrique() {
        return typeRubriqueRepository.findAll();
    }
}
