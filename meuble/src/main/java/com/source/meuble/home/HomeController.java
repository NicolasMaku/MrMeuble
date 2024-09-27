package com.source.meuble.home;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.centre.CentreService;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import com.source.meuble.analytique.typeRubrique.TypeRubriqueService;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvreService;
import com.source.meuble.util.Layout;
import org.springframework.stereotype.Controller;
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

    public HomeController(UniteOeuvreService uniteOeuvreService, CentreService centreService, TypeRubriqueService typeRubriqueService) {
        this.uniteOeuvreService = uniteOeuvreService;
        this.centreService = centreService;
        this.typeRubriqueService = typeRubriqueService;
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
}
