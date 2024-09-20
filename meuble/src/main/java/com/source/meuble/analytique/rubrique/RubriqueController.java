package com.source.meuble.analytique.rubrique;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class RubriqueController {
    @Autowired
    RubriqueRepository rubriqueRepository;
}
