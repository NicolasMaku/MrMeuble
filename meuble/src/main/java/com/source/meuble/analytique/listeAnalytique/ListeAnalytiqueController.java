package com.source.meuble.analytique.listeAnalytique;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/resultat")
public class ListeAnalytiqueController {

    private final ListeAnalytiqueService listeAnalytiqueService;

    public ListeAnalytiqueController(ListeAnalytiqueService listeAnalytiqueService) {
        this.listeAnalytiqueService = listeAnalytiqueService;
    }

    @GetMapping()
    public ModelAndView showResultat() {
        ModelAndView modelAndView = new ModelAndView("tableau");
        listeAnalytiqueService.getTableau();
        return modelAndView;
    }

}
