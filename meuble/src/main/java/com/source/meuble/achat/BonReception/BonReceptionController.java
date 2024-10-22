package com.source.meuble.achat.BonReception;

import com.source.meuble.achat.marchandise.MarchandiseService;
import com.source.meuble.achat.proformat.Proformat;
import com.source.meuble.analytique.centre.CentreRepository;
import com.source.meuble.stock.mouvementStock.MouvementStockService;
import com.source.meuble.util.Redirection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/BonReception")
public class BonReceptionController {

    private final BonReceptionService bonReceptionService;
    private final CentreRepository centreRepository;
    private final MarchandiseService marchandiseService;

    public BonReceptionController(BonReceptionService bonReceptionService1, CentreRepository centreRepository, MarchandiseService marchandiseService){
        this.bonReceptionService = bonReceptionService1;
        this.centreRepository = centreRepository;
        this.marchandiseService = marchandiseService;
    }

    @PostMapping("/transfert")
    public String transfertToBr(@RequestParam("date") LocalDate daty, @RequestParam("idBc") int id){
        bonReceptionService.transferBcToBr(id,daty);
        return  new Redirection("/achat/bon-reception").getUrl();
    }

    @GetMapping("/details")
    public ModelAndView showDetails(
            @RequestParam("id") BonReception bonReception
    ) {
        ModelAndView modelAndView = new ModelAndView("template");

        String content = "landingAchat.jsp";
        String sidebar = "template/floating-sidebar-achat.jsp";
        String validation = "achat/bon-reception-detail.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        modelAndView.addObject("centres", centreRepository.findAll());
        modelAndView.addObject("produits", marchandiseService.findAll());
        modelAndView.addObject("brFille", bonReceptionService.findFilleByIdMere(bonReception.getId()));
        return modelAndView;
    }
}
