package com.source.meuble.home;

import com.source.meuble.achat.Fornisseur.FournisseurService;
import com.source.meuble.achat.besoin.BesoinService;
import com.source.meuble.achat.marchandise.MarchandiseService;
import com.source.meuble.achat.proformat.ProformatService;
import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.centre.CentreRepository;
import com.source.meuble.analytique.centre.CentreService;
import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueService;
import com.source.meuble.analytique.listeAnalytique.ListeAnalytiqueTableau;
import com.source.meuble.analytique.produit.ProduitService;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import com.source.meuble.analytique.typeRubrique.TypeRubriqueService;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvreService;
import com.source.meuble.auth.AuthService;
import com.source.meuble.auth.NoExerciceFoundException;
import com.source.meuble.visible.cout.AdminCout;
import com.source.meuble.visible.cout.Cout;
import com.source.meuble.visible.AdminRepartition;
import com.source.meuble.visible.repartition.Repartition;
import com.source.meuble.visible.repartition.TotauxRepartition;
import com.source.meuble.visible.seuil.CalculSeuil;
import com.source.meuble.visible.seuil.Seuil;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @Autowired
    CalculSeuil calculSeuil;
    @Autowired
    private CentreRepository centreRepository;
    @Autowired
    private ProduitService produitService;
    @Autowired
    private MarchandiseService marchandiseService;
    @Autowired
    private AuthService authService;
    @Autowired
    private BesoinService besoinService;
    @Autowired
    private FournisseurService fournisseurService;
    @Autowired
    private ProformatService proformatService;

    public HomeController(UniteOeuvreService uniteOeuvreService, CentreService centreService,
            TypeRubriqueService typeRubriqueService, ListeAnalytiqueService listeAnalytiqueService,
            HttpSession httpSession, AdminCout adminCout) {
        this.uniteOeuvreService = uniteOeuvreService;
        this.centreService = centreService;
        this.typeRubriqueService = typeRubriqueService;
        this.listeAnalytiqueService = listeAnalytiqueService;
        this.httpSession = httpSession;
        this.adminCout = adminCout;
    }

    @GetMapping
    public ModelAndView showHome() {
        ModelAndView modelAndView = new ModelAndView("template");
        String content = "landing.jsp";
        modelAndView.addObject("content", content);
        return modelAndView;
    }

    @GetMapping("ca")
    public ModelAndView showCa(){
        ModelAndView modelAndView = new ModelAndView("template");

        List<UniteOeuvre> uniteOeuvres = uniteOeuvreService.getAllUO();
        List<Centre> centres = centreService.getAllCentre();
        List<TypeRubrique> trs = typeRubriqueService.getAllTypeRubrique();

        modelAndView.addObject("uos", uniteOeuvres);
        modelAndView.addObject("centres", centres);
        modelAndView.addObject("trs", trs);
        modelAndView.addObject("cos", centres.stream().filter(c -> c.getCategorie() == 1).toList());

        String content = "landingCa.jsp";
        String sidebar = "template/floating-sidebar-ca.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        return modelAndView;
    }

    @GetMapping("achat")
    public ModelAndView showAchat() throws NoExerciceFoundException {
        Exercice exercice = authService.requireExercice();

        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("centres", centreRepository.findAll());
        modelAndView.addObject("produits", marchandiseService.findAll());
        return modelAndView;
    }

    @GetMapping("achat/validation-besoin")
    public ModelAndView showAchatValidationBesoin(){
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/validation-besoin.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        modelAndView.addObject("centres", centreRepository.findAll());
        modelAndView.addObject("produits", marchandiseService.findAll());
        modelAndView.addObject("besoinMap", besoinService.getBesoinsGroupByEtat());
        modelAndView.addObject("fournisseurs", fournisseurService.findAllFournisseur());

//        modelAndView.addObject("besoins", besoinService.ge);
        return modelAndView;
    }

    @GetMapping("achat/bon-commande")
    public ModelAndView showAchatBonCommande() throws NoExerciceFoundException {
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/bon-commande.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        modelAndView.addObject("centres", centreRepository.findAll());
        modelAndView.addObject("produits", marchandiseService.findAll());
        return modelAndView;
    }

    @GetMapping("achat/validation-bon-commande")
    public ModelAndView showAchatValidationBonCommande(){
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/validation-bon-commande.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        return modelAndView;
    }

    @GetMapping("achat/creation-bon-reception")
    public ModelAndView showAchatCreationBonReception(){
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/creation-bon-reception.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        return modelAndView;
    }

    @GetMapping("achat/validation-facture")
    public ModelAndView showAchatValidationFacture(){
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/validation-facture.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        return modelAndView;
    }

    @GetMapping("achat/proformat")
    public ModelAndView showAchatProformat(){
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/proformat.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        modelAndView.addObject("centres", centreRepository.findAll());
        modelAndView.addObject("produits", marchandiseService.findAll());
        modelAndView.addObject("proformats", proformatService.getAllProformats());
        return modelAndView;
    }


    @GetMapping("table")
    public ModelAndView showTable() {
        Exercice myExo = ((Exercice) httpSession.getAttribute("exercice"));
        if (myExo == null)
            return new ModelAndView("redirect:/exercice");

        ModelAndView modelAndView = new ModelAndView("template");

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

        String content = "landingCa.jsp";
        String sidebar = "template/floating-sidebar-ca.jsp";
        String tableauCa = "tableau.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("tableauCa", tableauCa);
        return modelAndView;
    }

    @GetMapping("/table/sortie")
    public ModelAndView showTableWithSortie(
            @RequestParam("libelle") String libelle,
            @RequestParam("pv") Double pv,
            @RequestParam("uo") UniteOeuvre uo,
            @RequestParam("qte") Double qte,
            @RequestParam("centre[]") List<Centre> centre) {
        Exercice myExo = ((Exercice) httpSession.getAttribute("exercice"));
        centre.forEach(System.out::println);
        ListeAnalytiqueTableau tableau = listeAnalytiqueService.getTableau(myExo.getId());

        if(centre.isEmpty()) return new ModelAndView("redirect:/home");

        Cout cout = adminCout.calculCout(uo, qte, centre, myExo.getId(), libelle);

        double chiffreAffaire = cout.getQuantite()*pv;
        Seuil seuil = calculSeuil.getSeuil(cout, myExo.getId());
        seuil.setCoutVariable(tableau.getTotalVariable());
        seuil.setCoutFixe(tableau.getTotalFixe());

        double numerateur = seuil.getCoutFixe() * chiffreAffaire;
        double denominateur = chiffreAffaire - seuil.getCoutVariable();
        double seuilValue = numerateur/denominateur;

        seuil.setSeuil(seuilValue);
        seuil.setChiffreAffaire(chiffreAffaire);

        ModelAndView modelAndView = showTable();
        modelAndView.addObject("hasSortie", true);
        modelAndView.addObject("cout", cout);
        modelAndView.addObject("seuil", seuil);

        return modelAndView;

        // modelAndView.addObject();
    }

}
