package com.source.meuble.stock.produitMarchandise;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/produit_marchandise")
public class ProduitMarchandiseController {
    @Autowired
    ProduitMarchandiseService produitMarchandiseService;

}
