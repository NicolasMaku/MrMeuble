package com.source.meuble.analytique.typeRubrique;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.imputation.Imputation;
import com.source.meuble.analytique.imputation.ImputationRepository;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import com.source.meuble.util.Redirection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/tr")
public class TypeRubriqueController {
    private final TypeRubriqueService typeRubriqueService;
    private final ImputationRepository imputationRepository;

    public TypeRubriqueController(TypeRubriqueService typeRubriqueService,
                                  ImputationRepository imputationRepository) {
        this.typeRubriqueService = typeRubriqueService;
        this.imputationRepository = imputationRepository;
    }
//    @Autowired
//    TypeRubriqueRepository rubriqueRepository;

    @PostMapping("/save")
    public String save(
        @RequestParam("nom") String nom,
        @RequestParam("uo") UniteOeuvre uo,
        @RequestParam("nature") Integer nature,
        @RequestParam("incorporabilite") Integer incorp,
        @RequestParam("centre[]") List<Centre> centres,
        @RequestParam("pourcentage[]")List<Double> pourcentages

    ){
        TypeRubrique tr = new TypeRubrique();
        tr.setLibelle(nom);
        tr.setIdUniteOeuvre(uo);
        tr.setNature(nature);
        tr.setIncorporabilite(incorp);
        TypeRubrique saved = typeRubriqueService.saveTypeRubrique(tr);

        Double sum = 0.00;
        for(Double d: pourcentages) {
            sum += d;
        }

        if(sum == 0) sum = 1.00;

        List<Imputation> list = new ArrayList<>();

        for(int i = 0; i < centres.size(); i++) {
            Imputation imputation = new Imputation();
            imputation.setIdCentre(centres.get(i));
            imputation.setIdTypeRubrique(saved);
            imputation.setPourcentage(BigDecimal.valueOf(pourcentages.get(i)/sum * 100));
            list.add(imputation);
        }

        imputationRepository.saveAll(list);


        Redirection redirection = new Redirection("/home");
        return redirection.getUrl();

    }
}
