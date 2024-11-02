package com.source.meuble.stock.etatStock;

import com.source.meuble.auth.LayoutService;
import com.source.meuble.exception.NoExerciceFoundException;
import com.source.meuble.exception.NoUserLoggedException;
import com.source.meuble.util.Layout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/etat-stock")
public class EtatStockController {
    @Autowired
    EtatStockService etatStockService;
    @Autowired
    private LayoutService layoutService;

    @GetMapping("/list")
    public ModelAndView showList() throws NoUserLoggedException, NoExerciceFoundException {
        Layout layout = layoutService.getLayout("stock/etat-stock/list");
        ModelAndView mav = layout.getModelAndView();
        mav.addObject("stocks", etatStockService.resteEnStock());
        return mav;
    }

//    @GetMapping("stock/etatStock")
//    public ModelAndView allEtatStock(){
//        ModelAndView modelAndView = new ModelAndView("template");
//
//        List<EtatStock> etatStockList = etatStockService.resteEnStock();
//        modelAndView.addObject("etat", etatStockList);
//
//        String content = "landingStock.jsp";
//        String sidebar = "template/floating-sidebar-stock.jsp";
//        String validation = "stock/etatStock.jsp";
//        modelAndView.addObject("content", content);
//        modelAndView.addObject("sidebar", sidebar);
//        modelAndView.addObject("insideContent", validation);
//        return modelAndView;
//    }
}
