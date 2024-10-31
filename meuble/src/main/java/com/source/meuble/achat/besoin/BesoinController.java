package com.source.meuble.achat.besoin;


import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.produit.Produit;
import com.source.meuble.analytique.produit.ProduitService;
import com.source.meuble.auth.AuthService;
import com.source.meuble.auth.LayoutService;
import com.source.meuble.exception.NoExerciceFoundException;
import com.source.meuble.exception.NoUserLoggedException;
import com.source.meuble.util.Layout;
import com.source.meuble.util.Redirection;
import com.source.meuble.utilisateur.Utilisateur;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.time.LocalDate;

@Controller
@RequestMapping("/besoin")
public class BesoinController {

    private final BesoinService besoinService;
    private final LayoutService layoutService;
    private final ProduitService produitService;
    private final AuthService authService;

    public BesoinController(BesoinService besoinService, LayoutService layoutService, ProduitService produitService, AuthService authService) {
        this.besoinService = besoinService;
        this.layoutService = layoutService;
        this.produitService = produitService;
        this.authService = authService;
    }

    @GetMapping("/form")
    public ModelAndView showForm() throws NoUserLoggedException, NoExerciceFoundException {
        Layout layout = layoutService.getLayout("besoin/form");
        ModelAndView mav = layout.getModelAndView();
        mav.addObject("produits", produitService.findAll());
        return mav;
    }

    @PostMapping("/save")
    public String save(
        @RequestParam("prd") Produit produit,
        @RequestParam("qte") Double qte,
        @RequestParam("date")LocalDate date
    ) throws NoUserLoggedException {
        Utilisateur u = authService.requireUser();
        Besoin besoin = new Besoin();
        besoin.setEtat(0);
        besoin.setDaty(date);
        besoin.setRole(u.getRole());
        besoin.setIdMarchandise(produit);
        besoin.setQuantite(BigDecimal.valueOf(qte));
        besoinService.saveBesoin(besoin);

        return new Redirection("/home/achat").getUrl();
    }

    @GetMapping("/valider")
    public String valider(@RequestParam("idBesoin") Besoin besoin) {
        besoinService.validerBesoin(besoin);
        return new Redirection("/home/achat/validation-besoin").getUrl();
    }
}
