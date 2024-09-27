package com.source.meuble.analytique.rubrique;

import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import com.source.meuble.util.Redirection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDate;

@Controller
@RequestMapping("/rubrique")
public class RubriqueController {

    private final RubriqueService rubriqueService;

    public RubriqueController(RubriqueService rubriqueService) {
        this.rubriqueService = rubriqueService;
    }

    @PostMapping("/save")
    public String save(
        @RequestParam("tr") TypeRubrique tr,
        @RequestParam("pu") Double pu,
        @RequestParam("qte") Double qte
//        @RequestParam("date") LocalDate date
        ) {

        Rubrique rubrique = new Rubrique();
        rubrique.setIdTypeRubrique(tr);
        rubrique.setPrixUnitaire(BigDecimal.valueOf(pu));
        rubrique.setQuantite(BigDecimal.valueOf(qte));

        rubriqueService.saveRubrique(rubrique);

        Redirection redirection = new Redirection("/home");
        return redirection.getUrl();
    }
}
