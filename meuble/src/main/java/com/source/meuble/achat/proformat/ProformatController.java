package com.source.meuble.achat.proformat;

import com.source.meuble.achat.Fornisseur.Fournisseur;
import com.source.meuble.achat.besoin.Besoin;
import com.source.meuble.util.Redirection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/proformat")
public class ProformatController {

    private final ProformatService proformatService;

    public ProformatController(ProformatService proformatService) {
        this.proformatService = proformatService;
    }

    @PostMapping("/demande")
    public String demanderProformat(
        @RequestParam("besoin[]") List<Besoin> besoins,
        @RequestParam("fournisseur")Fournisseur fournisseur
    ) {
        proformatService.demanderProformat(besoins, fournisseur);
        return new Redirection("/home/achat/proformat").getUrl();
    }
}
