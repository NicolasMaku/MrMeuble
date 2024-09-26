package com.source.meuble.analytique.listeAnalytique;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ListeAnalytiqueController {
    @Autowired
    ListAnalytiqueRepository listAnalytiqueRepository;
}
