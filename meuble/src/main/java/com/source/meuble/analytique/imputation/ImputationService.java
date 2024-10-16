package com.source.meuble.analytique.imputation;

import com.source.meuble.analytique.centre.Centre;
import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.analytique.typeRubrique.TypeRubrique;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class ImputationService {
    private final ImputationRepository imputationRepository;
    private final static Double TOLERANCE = 10e-1;

    public ImputationService(ImputationRepository imputationRepository) {
        this.imputationRepository = imputationRepository;
    }

    public Imputation save(Imputation imputation) {
        return imputationRepository.save(imputation);
    }

    public List<Imputation> saveAll (
        TypeRubrique typeRubrique,
        Exercice exercice,
        List<Centre> centres,
        List<Double> percentages
    ) throws Exception{
        int size = centres.size();

        if(size != percentages.size()) throw new Exception("Exception at: ImputationService.saveAll");

        List<Imputation> imputations = new ArrayList<>();

        for(int i = 0; i < size; ++i) {
            Imputation imputation = new Imputation();
            imputation.setIdTypeRubrique(typeRubrique);
            imputation.setIdCentre(centres.get(i));
            imputation.setPourcentage(BigDecimal.valueOf(percentages.get(i)));
            imputations.add(imputation);
        }

        return saveAll(imputations);
    }

    public List<Imputation> saveAll (List<Imputation> imputations) throws Exception {
        checkImputation(imputations);
        return imputationRepository.saveAll(imputations);
    }

    public Boolean checkImputation (List<Imputation> imputations)  throws Exception {
        double sum = 0.00;
        for(Imputation imputation : imputations) {
            sum += imputation.getPourcentage().doubleValue();
        }

        if(Math.abs(100.00 - sum) <= TOLERANCE) {
            return true;
        }

        throw new Exception("Invalid Percentage for each center: " + sum + "%");
    }
}
