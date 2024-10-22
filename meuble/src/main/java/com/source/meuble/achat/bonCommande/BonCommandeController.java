package com.source.meuble.achat.bonCommande;

import com.source.meuble.achat.proformat.Proformat;
import com.source.meuble.util.Redirection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/bon-commande")
public class BonCommandeController {

    private final BonCommandeService bonCommandeService;

    public BonCommandeController(BonCommandeService bonCommandeService) {
        this.bonCommandeService = bonCommandeService;
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
}
