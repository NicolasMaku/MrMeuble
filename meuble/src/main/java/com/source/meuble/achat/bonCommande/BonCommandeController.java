package com.source.meuble.achat.bonCommande;

import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.achat.BonReception.BonReceptionService;
import com.source.meuble.achat.marchandise.MarchandiseService;
import com.source.meuble.achat.proformat.Proformat;
import com.source.meuble.analytique.centre.CentreRepository;
import com.source.meuble.auth.AuthService;
import com.source.meuble.auth.UnallowedRoleException;
import com.source.meuble.util.Redirection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;

@Controller
@RequestMapping("/bon-commande")
public class BonCommandeController {

    private final BonCommandeService bonCommandeService;
    private final BonReceptionService bonReceptionService;
    private final CentreRepository centreRepository;
    private final MarchandiseService marchandiseService;

    @Autowired
    private AuthService authService;

    public BonCommandeController(BonCommandeService bonCommandeService, BonReceptionService bonReceptionService, CentreRepository centreRepository, MarchandiseService marchandiseService) {
        this.bonCommandeService = bonCommandeService;
        this.bonReceptionService = bonReceptionService;
        this.centreRepository = centreRepository;
        this.marchandiseService = marchandiseService;
    }

    @GetMapping("/generer")
    public String genererBC(@RequestParam("id") Proformat proformat) throws UnallowedRoleException {
        authService.requireRole(5);
        bonCommandeService.genererBonCommande(proformat);
        return new Redirection("/home/achat/validation-bon-commande").getUrl();
    }

    @GetMapping("/valider")
    public String valider(
        @RequestParam("id") BonCommande bonCommande
    ) throws UnallowedRoleException {
        if(bonCommande.getEtat() == 0) {
            authService.requireRole(4);
        } else if (bonCommande.getEtat() == 1) {
            authService.requireRole(6);
        }
        bonCommandeService.validerBonCommande(bonCommande);
        return new Redirection("/home/achat/validation-bon-commande").getUrl();
    }

    @PostMapping("/transferer")
    public String transferer(
        @RequestParam("id")  BonCommande bc,
        @RequestParam("date") LocalDate date
    ) throws UnallowedRoleException {
        authService.requireRole(5,6);
        bonReceptionService.transferBcToBr(bc.getId(), date);
        return new Redirection("/home/achat/bon-reception").getUrl();
    }

    @GetMapping("/details")
    public ModelAndView showDetails(
        @RequestParam("id") BonCommande bonCommande
    ) {
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/bon-commande-detail.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        modelAndView.addObject("centres", centreRepository.findAll());
        modelAndView.addObject("produits", marchandiseService.findAll());
        modelAndView.addObject("bcFille", bonCommande.getFilles());
        return modelAndView;
    }

}
