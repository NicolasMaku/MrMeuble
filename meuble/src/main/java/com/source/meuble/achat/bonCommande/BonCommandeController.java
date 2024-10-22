package com.source.meuble.achat.bonCommande;

import com.source.meuble.achat.BonReception.BonReceptionService;
import com.source.meuble.achat.proformat.Proformat;
import com.source.meuble.util.Redirection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;

@Controller
@RequestMapping("/bon-commande")
public class BonCommandeController {

    private final BonCommandeService bonCommandeService;
    private final BonReceptionService bonReceptionService;

    public BonCommandeController(BonCommandeService bonCommandeService, BonReceptionService bonReceptionService) {
        this.bonCommandeService = bonCommandeService;
        this.bonReceptionService = bonReceptionService;
    }

    @GetMapping("/generer")
    public String genererBC(@RequestParam("id") Proformat proformat) {
        bonCommandeService.genererBonCommande(proformat);
        return new Redirection("/home/achat/validation-bon-commande").getUrl();
    }

    @GetMapping("/valider")
    public String valider(
        @RequestParam("id") BonCommande bonCommande
    ){
        bonCommandeService.validerBonCommande(bonCommande);
        return new Redirection("/home/achat/validation-bon-commande").getUrl();
    }

    @PostMapping("/transferer")
    public String transferer(
        @RequestParam("id")  BonCommande bc,
        @RequestParam("date") LocalDate date
    ) {
        bonReceptionService.transferBcToBr(bc.getId(), date);
        return new Redirection("/home/achat/validation-bon-reception").getUrl();
    }

}
