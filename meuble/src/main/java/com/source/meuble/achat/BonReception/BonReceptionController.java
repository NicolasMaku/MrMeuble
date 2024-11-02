package com.source.meuble.achat.BonReception;

import com.source.meuble.achat.bonCommande.BonCommande;
import com.source.meuble.achat.proformat.Proformat;
import com.source.meuble.analytique.centre.CentreRepository;
import com.source.meuble.analytique.produit.Produit;
import com.source.meuble.analytique.produit.ProduitService;
import com.source.meuble.auth.AuthService;
import com.source.meuble.auth.LayoutService;
import com.source.meuble.exception.NoExerciceFoundException;
import com.source.meuble.exception.NoUserLoggedException;
import com.source.meuble.stock.mouvementStock.MouvementStockService;
import com.source.meuble.util.Layout;
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
@RequestMapping("/bon-reception")
public class BonReceptionController {

    private final BonReceptionService bonReceptionService;
    private final CentreRepository centreRepository;
    private final ProduitService marchandiseService;
    private final AuthService authService;
    private final LayoutService layoutService;

    public BonReceptionController(BonReceptionService bonReceptionService1, CentreRepository centreRepository, ProduitService marchandiseService, AuthService authService, LayoutService layoutService){
        this.bonReceptionService = bonReceptionService1;
        this.centreRepository = centreRepository;
        this.marchandiseService = marchandiseService;
        this.authService = authService;
        this.layoutService = layoutService;
    }

    @PostMapping("/transfert")
    public String transfertToBr(@RequestParam("date") LocalDate daty, @RequestParam("idBc") int id){
        bonReceptionService.transferBcToBr(id,daty);
        return  new Redirection("test/home").getUrl();
    }

    @GetMapping("/list")
    public ModelAndView showList() throws NoUserLoggedException, NoExerciceFoundException {
        Layout layout = layoutService.getLayout("bon-reception/list");
        ModelAndView mav = layout.getModelAndView();
        mav.addObject("brs", bonReceptionService.findAll());
        return mav;
    }

    @GetMapping("/details")
    public ModelAndView showDetails(
        @RequestParam("id") BonReception br
    ) throws NoUserLoggedException, NoExerciceFoundException {
        Layout layout = layoutService.getLayout("bon-reception/details");
        ModelAndView mav = layout.getModelAndView();
        mav.addObject("br", br);
        mav.addObject("brf", br.getFille());
        return mav;
    }

    @PostMapping("/generer")
    public String genererBR(
        @RequestParam("idBc")BonCommande bc,
        @RequestParam("dateReception") LocalDate dateReception
    ) throws NoUserLoggedException {
        authService.requireUser();
        bonReceptionService.genererBR(bc, dateReception);
        return new Redirection("/bon-commande/details?id="+bc.getId()).getUrl();
    }

//    @GetMapping("/details")
//    public ModelAndView showDetails(
//            @RequestParam("id") BonReception bonReception
//    ) {
//        ModelAndView modelAndView = new ModelAndView("template");
//
//        String content = "landingAchat.jsp";
//        String sidebar = "template/floating-sidebar-achat.jsp";
//        String validation = "achat/bon-reception-detail.jsp";
//        modelAndView.addObject("content", content);
//        modelAndView.addObject("sidebar", sidebar);
//        modelAndView.addObject("insideContent", validation);
//        modelAndView.addObject("centres", centreRepository.findAll());
//        modelAndView.addObject("produits", marchandiseService.findAll());
//        modelAndView.addObject("brFille", bonReceptionService.findFilleByIdMere(bonReception.getId()));
//        return modelAndView;
//    }
}
