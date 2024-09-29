package com.source.meuble.analytique.exercice;


import com.source.meuble.util.Layout;
import com.source.meuble.util.Redirection;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/exercice")
public class ExerciceController {

    private final HttpSession session;
    private final ExerciceService exerciceService;

    public ExerciceController(HttpSession session, ExerciceService exerciceService) {
        this.session = session;
        this.exerciceService = exerciceService;
    }

    @GetMapping()
    public ModelAndView chooseExerciceView() {
        ModelAndView modelAndView = new ModelAndView("exercice");
        List<Exercice> exercices = exerciceService.getAllExercices();
        modelAndView.addObject("exercices", exercices);

        return modelAndView;
    }

    @PostMapping("/set")
    public String setExercice(@RequestParam("exercice") Exercice exercice) {
        this.session.setAttribute("exercice", exercice);
        Redirection redirection = new Redirection("/home");
        return redirection.getUrl();
    }

    @PostMapping("/add")
    public String addExercice(
        @RequestParam("dateDebut") LocalDate dateDebut
    ) {
        Exercice exercice = new Exercice(dateDebut);
        exerciceService.save(exercice);

        Redirection redirection = new Redirection("/exercice");
        return redirection.getUrl();
    }

}
