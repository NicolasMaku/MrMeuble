package com.source.meuble.achat.Facture;

import com.source.meuble.achat.BonReception.BonReception;
import com.source.meuble.achat.BonReception.BonReceptionService;
import com.source.meuble.util.Redirection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;

@Controller
@RequestMapping("/Facture")
public class FactureController {
    private final BonReceptionService bonReceptionService;
    private final FactureService factureService;

    public FactureController(BonReceptionService bonReceptionService, FactureService factureService) {
        this.bonReceptionService = bonReceptionService;
        this.factureService = factureService;
    }
    @GetMapping("/transfert")
    public String transfertBrToFact(@RequestParam("id") BonReception bonReception){
        factureService.genererFacture(bonReception);
//        factureService.genererFactureWithFille(bonReception);
        return  new Redirection("achat/validation-facture").getUrl();
    }

    @GetMapping("/details")
    public ModelAndView showDetails(
            @RequestParam("id") Facture facture
    ) {
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/facture-detail.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        modelAndView.addObject("factFille", factureService.findFilleByIdMere(facture.getId()));
        return modelAndView;
    }

}
