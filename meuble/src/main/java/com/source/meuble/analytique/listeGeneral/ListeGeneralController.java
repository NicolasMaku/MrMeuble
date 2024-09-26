package com.source.meuble.analytique.listeGeneral;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ListeGeneralController {
    @Autowired
    ListeGeneralRepository listeGeneralRepository;
}
