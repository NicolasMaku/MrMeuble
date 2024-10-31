package com.source.meuble.util;

import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.utilisateur.Utilisateur;
import lombok.Data;
import org.springframework.web.servlet.ModelAndView;

@Data
public class Layout {
    private ModelAndView modelAndView;
    private Exercice exercice;
    private Utilisateur utilisateur;

    public Layout() {
    }

}
