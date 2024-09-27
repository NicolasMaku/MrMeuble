package com.source.meuble.analytique.typeRubrique;

import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import com.source.meuble.util.Redirection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/tr")
public class TypeRubriqueController {
    private final TypeRubriqueService typeRubriqueService;

    public TypeRubriqueController(TypeRubriqueService typeRubriqueService) {
        this.typeRubriqueService = typeRubriqueService;
    }
//    @Autowired
//    TypeRubriqueRepository rubriqueRepository;

    @PostMapping("/save")
    public String save(
        @RequestParam("nom") String nom,
        @RequestParam("uo") UniteOeuvre uo,
        @RequestParam("nature") Integer nature,
        @RequestParam("incorporabilite") Integer incorp

    ){
        TypeRubrique tr = new TypeRubrique();
        tr.setLibelle(nom);
        tr.setIdUniteOeuvre(uo);
        tr.setNature(nature);
        tr.setIncorporabilite(incorp);
        typeRubriqueService.saveTypeRubrique(tr);

        Redirection redirection = new Redirection("/home");
        return redirection.getUrl();

    }
}
