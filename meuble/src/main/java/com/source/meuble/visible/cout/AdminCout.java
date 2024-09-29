package com.source.meuble.visible.cout;

import com.source.meuble.visible.repartition.Repartition;
import com.source.meuble.visible.repartition.RepartitionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class AdminCout {

    @Autowired
    RepartitionRepository repartitionRepository;

    private List<Integer> split(String id_centres) {
        String[] splitted = id_centres.split(";");
        List<Integer> ids = new ArrayList<>();

        for(String string_id : splitted) {
            ids.add(Integer.valueOf(string_id));
        }

        return ids;
    }

    public Cout calculCout(int idUniteOeuvre, String quantite, String id_centres, int id_exercice) {
        Cout cout = new Cout();
        List<Repartition> repartitionList = repartitionRepository.findByIdExercice(id_exercice);

        List<Integer> ids = split(id_centres);

        List<Repartition> repartitions = repartitionList.stream().filter(repartition -> ids.contains(repartition.getIdCentre())).toList();

        double cout_total = repartitions.stream()
                .mapToDouble(Repartition::getCoutTotal) // Extraction de l'attribut 'valeur'
                .sum(); // Calcul de la somme

        double quantite_d = Double.valueOf(quantite);
        cout.setQuantite(quantite_d);
        cout.setCout_total(cout_total);

        return cout;
    }
}
