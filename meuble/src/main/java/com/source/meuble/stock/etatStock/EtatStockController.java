package com.source.meuble.stock.etatStock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/etatStock")
public class EtatStockController {
    @Autowired
    EtatStockService etatStockService;

}
