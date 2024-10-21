package com.source.meuble.achat.besoin;

import com.source.meuble.achat.marchandise.Marchandise;
import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.util.Redirection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDate;

@Controller
@RequestMapping("/besoin")
public class BesoinController {

    private final BesoinService besoinService;

    public BesoinController(BesoinService besoinService) {
        this.besoinService = besoinService;
    }

    @PostMapping("/save")
    public String save(
        @RequestParam("centre") Centre centre,
        @RequestParam("marchandise") Marchandise marchandise,
        @RequestParam("qte") Double qte,
        @RequestParam("date")LocalDate date
    ) {
        Besoin besoin = new Besoin();
        besoin.setEtat(0);
        besoin.setDaty(date);
        besoin.setIdDemandeur(centre);
        besoin.setIdMarchandise(marchandise);
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
