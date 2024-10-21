package com.source.meuble.stock.etatStock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/etatStock")
public class EtatStockController {
    @Autowired
    EtatStockService etatStockService;

    @GetMapping("stock/etatStock")
    public ModelAndView allEtatStock(){
        ModelAndView modelAndView = new ModelAndView("template");

        List<EtatStock> etatStockList = etatStockService.resteEnStock();
        modelAndView.addObject("etat", etatStockList);

        String content = "landingStock.jsp";
        String sidebar = "template/floating-sidebar-stock.jsp";
        String validation = "stock/etatStock.jsp";
        modelAndView.addObject("content", content);
        modelAndView.addObject("sidebar", sidebar);
        modelAndView.addObject("insideContent", validation);
        return modelAndView;
    }
}
