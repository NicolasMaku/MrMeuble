package com.source.meuble.analytique.listeAnalytique;


import com.source.meuble.analytique.rubrique.Rubrique;
import com.source.meuble.analytique.rubrique.RubriqueRepository;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import com.source.meuble.analytique.typeRubrique.TypeRubriqueRepository;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class ListeAnalytiqueService {

    private final ListAnalytiqueRepository listAnalytiqueRepository;
    private final TypeRubriqueRepository typeRubriqueRepository;

    public ListeAnalytiqueService(ListAnalytiqueRepository listAnalytiqueRepository, TypeRubriqueRepository typeRubriqueRepository) {
        this.listAnalytiqueRepository = listAnalytiqueRepository;
        this.typeRubriqueRepository = typeRubriqueRepository;
    }

    public ListeAnalytiqueRow[] getTableau() {
        List<TypeRubrique> trs = typeRubriqueRepository.findAll();
        List<ListeAnalytiqueRow> rows = new LinkedList<>();

        trs.forEach((tr) -> {
            ListeAnalytiqueRow row = new ListeAnalytiqueRow(tr);
            rows.add(row);
        });

        System.out.println(rows);

        return rows.toArray(ListeAnalytiqueRow[]::new);
    }
}
