package com.source.meuble.stock.produitFinit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/produitFinit")
public class ProduitFinitController {
    @Autowired
    ProduitFinitService produitFinitService;

}
