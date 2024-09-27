package com.source.meuble.analytique.uniteOeuvre;

import com.source.meuble.util.Redirection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/ue")
public class UniteOeuvreController {

    @Autowired
    UniteOeuvreRepository uniteRepository;

    @PostMapping("/save")
    public String save(
        @RequestParam("nom") String nom
    ) {
        UniteOeuvre uo = new UniteOeuvre();
        uo.setNom(nom);
        uniteRepository.save(uo);

        Redirection redirection = new Redirection("/home");
        return redirection.getUrl();
    }

}
