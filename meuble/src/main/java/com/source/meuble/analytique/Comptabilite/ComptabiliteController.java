package com.source.meuble.analytique.Comptabilite;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.centre.CentreRepository;

@Controller
public class ComptabiliteController {

    @Autowired
    CentreRepository centreRepository;

    @GetMapping("/accueil")
    public ModelAndView repartition() {
        List<Centre> centre = centreRepository.centreByCategorie(0);

        ModelAndView mv = new ModelAndView("accueil/accueil");
        mv.addObject("type", centre);
        return mv;
    }

}
