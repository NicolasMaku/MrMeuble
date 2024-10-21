package com.source.meuble.achat.BonReception;

import com.source.meuble.util.Redirection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/BonReception")
public class BonReceptionController {

    private final BonReceptionService bonReceptionService;
    public BonReceptionController(BonReceptionService bonReceptionService1){

        this.bonReceptionService = bonReceptionService1;
    }

    @GetMapping("/bonReception")
    public String getAllBonReception(Model model){
        List<BonReception> bonReceptions=bonReceptionService.findAll();
        model.addAttribute("bonReception",bonReceptions);
        return "bonReception";
    }

    @PostMapping("/transfert")
    public String transfertToBr(@RequestParam("date") LocalDate daty, @RequestParam("idBc") int id){
        bonReceptionService.transferBcToBr(id,daty);
        return  new Redirection("test/home").getUrl();
    }
}
