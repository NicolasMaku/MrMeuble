package com.source.meuble.analytique.exercice;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExerciceService {
    public final ExerciceRepositoiry exerciceRepositoiry;


    public ExerciceService(ExerciceRepositoiry exerciceRepositoiry) {
        this.exerciceRepositoiry = exerciceRepositoiry;
    }

    public Exercice save(Exercice exercice) {
        return exerciceRepositoiry.save(exercice);
    }

    public List<Exercice> getAllExercices() {
        return exerciceRepositoiry.findAll();
    }

}
