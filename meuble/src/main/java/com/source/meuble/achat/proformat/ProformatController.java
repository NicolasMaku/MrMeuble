package com.source.meuble.achat.proformat;

import com.source.meuble.achat.Fornisseur.Fournisseur;
import com.source.meuble.achat.besoin.Besoin;
import com.source.meuble.achat.proformat.proformatFille.ProformatFille;
import com.source.meuble.analytique.centre.CentreRepository;
import com.source.meuble.analytique.produit.Produit;
import com.source.meuble.analytique.produit.ProduitService;
import com.source.meuble.util.Redirection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/proformat")
public class ProformatController {

    private final ProformatService proformatService;
    private final CentreRepository centreRepository;
    private final ProduitService marchandiseService;

    public ProformatController(ProformatService proformatService, CentreRepository centreRepository, ProduitService marchandiseService) {
        this.proformatService = proformatService;
        this.centreRepository = centreRepository;
        this.marchandiseService = marchandiseService;
    }

//    @GetMapping("/liste")
//    public ModelAndView showList() {
//        ModelAndView modelAndView = new ModelAndView("template");
//
//        String content = "landingAchat.jsp";
//        String sidebar = "template/floating-sidebar-achat.jsp";
//        String validation = "achat/proformat.jsp";
//        modelAndView.addObject("content", content);
//        modelAndView.addObject("sidebar", sidebar);
//        modelAndView.addObject("insideContent", validation);
//        modelAndView.addObject("centres", centreRepository.findAll());
//        modelAndView.addObject("produits", marchandiseService.findAll());
//        return modelAndView;
//    }

    @GetMapping("/details")
    public ModelAndView afficherDetails(
        @RequestParam("id") Proformat proformat
    ) {
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/proformat-detail.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        modelAndView.addObject("centres", centreRepository.findAll());
        modelAndView.addObject("produits", marchandiseService.findAll());
        modelAndView.addObject("pfs", proformat.getFilles());
        return modelAndView;
    }

    @PostMapping("/demande")
    public String demanderProformat(
        @RequestParam("besoin[]") List<Besoin> besoins,
        @RequestParam("fournisseur")Fournisseur fournisseur
    ) {
        proformatService.demanderProformat(besoins, fournisseur);
        return new Redirection("/home/achat/proformat").getUrl();
    }

    @PostMapping("/ajouter-prix")
    public String ajouterPrixProformat(
        @RequestParam("pf[]") List<ProformatFille> pfs,
        @RequestParam("prix[]") List<Double> prixList
    ) throws Exception {
        proformatService.ajouterPrixProformat(pfs.toArray(new ProformatFille[0]), prixList.toArray(new Double[0]));
        return new Redirection("/proformat/details?id="+pfs.get(0).getIdProformat().getId()).getUrl();
    }
}
