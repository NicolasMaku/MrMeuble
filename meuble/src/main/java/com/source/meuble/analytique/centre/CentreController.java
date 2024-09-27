package com.source.meuble.analytique.centre;

import com.source.meuble.util.Redirection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/centre")
public class CentreController {

    @Autowired
    CentreRepository centreRepository;

    @PostMapping("save")
    public String saveCentre(
        @RequestParam("nom") String nom,
        @RequestParam("categorie") int categorie
    ) throws Exception {
        Centre centre = new Centre(nom, categorie);
        centreRepository.save(centre);

        Redirection redirection = new Redirection("/home");
        return redirection.getUrl();
    }

}
