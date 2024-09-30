package com.source.meuble.analytique.listeAnalytique;


import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.analytique.exercice.ExerciceRepository;
import com.source.meuble.analytique.rubrique.Rubrique;
import com.source.meuble.analytique.rubrique.RubriqueRepository;
import com.source.meuble.analytique.typeRubrique.TypeRubriqueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class ListeAnalytiqueService {

    private final ListAnalytiqueRepository listAnalytiqueRepository;
    private final TypeRubriqueRepository typeRubriqueRepository;

    @Autowired
    private ExerciceRepository exerciceRepository;

    @Autowired
    private RubriqueRepository rubriqueRepository;

    public ListeAnalytiqueService(ListAnalytiqueRepository listAnalytiqueRepository, TypeRubriqueRepository typeRubriqueRepository, ExerciceRepository exerciceRepositoiry) {
        this.listAnalytiqueRepository = listAnalytiqueRepository;
        this.typeRubriqueRepository = typeRubriqueRepository;
    }

    public ListeAnalytiqueTableau getTableau(Integer idExercice) {
        List<Rubrique> trs = rubriqueRepository.findAllByIdExercice(idExercice);
        List<ListeAnalytiqueRow> rows = new LinkedList<>();

        trs.forEach((tr) -> {
            ListeAnalytiqueRow row = new ListeAnalytiqueRow(tr);
            rows.add(row);
        });

        System.out.println(rows);

        return new ListeAnalytiqueTableau(rows.toArray(ListeAnalytiqueRow[]::new));
    }
}
