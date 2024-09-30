package com.source.meuble.visible.cout;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import com.source.meuble.visible.repartition.Repartition;
import com.source.meuble.visible.repartition.RepartitionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
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

    public Cout calculCout(UniteOeuvre uniteOeuvre, Double quantite, List<Centre> centres, int id_exercice, String libelle) {
        Cout cout = new Cout();

        Map<Centre, Double> cpc = new HashMap<>();

        List<Repartition> repartitionList = repartitionRepository.findByIdExercice(id_exercice);

        List<Integer> ids = centres.stream().map(Centre::getIdCentre).toList();

        List<Repartition> repartitions = repartitionList.stream().filter(repartition -> ids.contains(repartition.getIdCentre().getIdCentre())).toList();

//        Set<Repartition> repartitions = centre
//        List<Repartition>

        repartitions.forEach((repartition) -> {
            System.out.println(repartition);
            cpc.put(repartition.getIdCentre(), repartition.getCoutTotal().doubleValue());
        });

        double cout_total = repartitions.stream()
                .mapToDouble(Repartition::getCoutTotal) // Extraction de l'attribut 'valeur'
                .sum(); // Calcul de la somme

//        double quantite_d = Double.valueOf(quantite);
        cout.setQuantite(quantite);
        cout.setCout_total(cout_total);
        cout.setCoutParCentre(cpc);
        cout.setLibelle(libelle);
        cout.setUniteOeuvre(uniteOeuvre);

        return cout;
    }
}
