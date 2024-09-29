
package com.source.meuble.visible;

import com.source.meuble.analytique.centre.SommeCentre.SommeCentre;
import com.source.meuble.visible.repartition.Repartition;
import com.source.meuble.visible.repartition.RepartitionRepository;
import com.source.meuble.visible.repartition.TotauxRepartition;
import com.source.meuble.visible.repartition.TotauxRepartitionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminRepartition {

    @Autowired
    RepartitionRepository repartitionRepository;

    @Autowired
    TotauxRepartitionRepository totauxRepartitionRepository;

    public List<Repartition> getListeRepartition(int id_exercice) {
        return repartitionRepository.findByIdExercice(id_exercice);
    }

    public TotauxRepartition getTotal(int id_exercice) {
        return totauxRepartitionRepository.findByIdExercice(id_exercice).get(0);
    }
}