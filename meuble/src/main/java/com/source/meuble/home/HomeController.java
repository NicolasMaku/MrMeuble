package com.source.meuble.home;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.centre.CentreService;
import com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueRow;
import com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueService;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import com.source.meuble.analytique.typeRubrique.TypeRubriqueService;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvreService;
import com.source.meuble.util.Layout;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {

    private final UniteOeuvreService uniteOeuvreService;
    private final CentreService centreService;
    private final TypeRubriqueService typeRubriqueService;
    private final ListeAnalytiqueService listeAnalytiqueService;

    public HomeController(UniteOeuvreService uniteOeuvreService, CentreService centreService, TypeRubriqueService typeRubriqueService, ListeAnalytiqueService listeAnalytiqueService) {
        this.uniteOeuvreService = uniteOeuvreService;
        this.centreService = centreService;
        this.typeRubriqueService = typeRubriqueService;
        this.listeAnalytiqueService = listeAnalytiqueService;
    }

    @GetMapping
    public ModelAndView showHome() {
        ModelAndView modelAndView = new ModelAndView("landing");

        List<UniteOeuvre> uniteOeuvres = uniteOeuvreService.getAllUO();
        List<Centre> centres = centreService.getAllCentre();
        List<TypeRubrique> trs = typeRubriqueService.getAllTypeRubrique();

        modelAndView.addObject("uos", uniteOeuvres);
        modelAndView.addObject("centres", centres);
        modelAndView.addObject("trs", trs);

        return modelAndView;
    }

    @GetMapping("table")
    public ModelAndView showTable(){
        ModelAndView modelAndView = new ModelAndView("tableau");

        ListeAnalytiqueRow[] tableau = listeAnalytiqueService.getTableau();

        List<UniteOeuvre> uniteOeuvres = uniteOeuvreService.getAllUO();
        List<Centre> centres = centreService.getAllCentre();
        List<TypeRubrique> trs = typeRubriqueService.getAllTypeRubrique();

        modelAndView.addObject("uos", uniteOeuvres);
        modelAndView.addObject("centres", centres);
        modelAndView.addObject("trs", trs);
        modelAndView.addObject("tableau", tableau);

        return modelAndView;
    }
}
