package com.source.meuble.analytique.exercice;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExerciceService {
    public final ExerciceRepository exerciceRepositoiry;


    public ExerciceService(ExerciceRepository exerciceRepositoiry) {
        this.exerciceRepositoiry = exerciceRepositoiry;
    }

    public Exercice save(Exercice exercice) {
        return exerciceRepositoiry.save(exercice);
    }

    public List<Exercice> getAllExercices() {
        return exerciceRepositoiry.findAll();
    }

}
