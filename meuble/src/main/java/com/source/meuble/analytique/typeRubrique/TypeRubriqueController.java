package com.source.meuble.analytique.typeRubrique;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class TypeRubriqueController {
    @Autowired
    TypeRubriqueRepository rubriqueRepository;
}
