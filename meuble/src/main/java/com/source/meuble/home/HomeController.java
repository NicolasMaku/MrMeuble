package com.source.meuble.home;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.centre.CentreService;
import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueRow;
import com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueService;
import com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueTableau;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import com.source.meuble.analytique.typeRubrique.TypeRubriqueService;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvreService;
import com.source.meuble.util.Layout;
import com.source.meuble.visible.cout.AdminCout;
import com.source.meuble.visible.cout.Cout;
import com.source.meuble.visible.AdminRepartition;
import com.source.meuble.visible.repartition.Repartition;
import com.source.meuble.visible.repartition.TotauxRepartition;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {

    private final UniteOeuvreService uniteOeuvreService;
    private final CentreService centreService;
    private final TypeRubriqueService typeRubriqueService;
    private final ListeAnalytiqueService listeAnalytiqueService;
    private final HttpSession httpSession;
    private final AdminCout adminCout;

    @Autowired
    AdminRepartition adminRepartition;

    public HomeController(UniteOeuvreService uniteOeuvreService, CentreService centreService,
            TypeRubriqueService typeRubriqueService, ListeAnalytiqueService listeAnalytiqueService,
            HttpSession httpSession) {
        this.uniteOeuvreService = uniteOeuvreService;
        this.centreService = centreService;
        this.typeRubriqueService = typeRubriqueService;
        this.listeAnalytiqueService = listeAnalytiqueService;
        this.httpSession = httpSession;
        this.adminCout = adminCout;
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
        modelAndView.addObject("cos", centres.stream().filter(c -> c.getCategorie() == 1).toList());

        return modelAndView;
    }

    @GetMapping("table")
    public ModelAndView showTable() {
        Exercice myExo = ((Exercice) httpSession.getAttribute("exercice"));
        if (myExo == null)
            return new ModelAndView("redirect:/exercice");

        ModelAndView modelAndView = new ModelAndView("tableau");

        ListeAnalytiqueTableau tableau = listeAnalytiqueService.getTableau(myExo.getId());

        List<UniteOeuvre> uniteOeuvres = uniteOeuvreService.getAllUO();
        List<Centre> centres = centreService.getAllCentre();
        List<TypeRubrique> trs = typeRubriqueService.getAllTypeRubrique();

        List<Repartition> repartitions = adminRepartition.getListeRepartition(myExo.getId());
        TotauxRepartition total = new TotauxRepartition(repartitions);

        modelAndView.addObject("uos", uniteOeuvres);
        modelAndView.addObject("centres", centres);
        modelAndView.addObject("trs", trs);
        modelAndView.addObject("tableau", tableau);
        modelAndView.addObject("hasSortie", false);
        modelAndView.addObject("cos", centres.stream().filter(c -> c.getCategorie() == 1).toList());
        modelAndView.addObject("repartitions", repartitions);
        modelAndView.addObject("totalRepa", total);

        return modelAndView;
    }

    @GetMapping("/table/sortie")
    public ModelAndView showTableWithSortie(
            @RequestParam("libelle") String libelle,
            @RequestParam("uo") UniteOeuvre uo,
            @RequestParam("qte") Double qte,
            @RequestParam("centre[]") List<Centre> centre) {
        Exercice myExo = ((Exercice) httpSession.getAttribute("exercice"));
        centre.forEach(System.out::println);

        Cout cout = adminCout.calculCout(uo, qte, centre, myExo.getId(), libelle);

        ModelAndView modelAndView = showTable();
        modelAndView.addObject("hasSortie", true);
        modelAndView.addObject("cout", cout);

        return modelAndView;

        // modelAndView.addObject();
    }

}
