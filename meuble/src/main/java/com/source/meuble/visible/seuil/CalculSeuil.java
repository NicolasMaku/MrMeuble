package com.source.meuble.visible.seuil;

import com.source.meuble.analytique.natureCharge.VariableFixe;
import com.source.meuble.analytique.natureCharge.VariableFixeRepository;
import com.source.meuble.visible.cout.Cout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalculSeuil {
    private double chiffreAffaire;

    private double coutVariable;
    private double coutFixe;
    private double margeCoutVariable;
    private double seuil;

    public int id_exercice;

    @Autowired
    private VariableFixeRepository variableFixeRepository;

    public double getChiffreAffaire(Cout cout) {
        chiffreAffaire = cout.getQuantite()*cout.getCoutRevient();
        return chiffreAffaire;
    }

    public double getCoutVariable(int id) {
        coutVariable = variableFixeRepository.findByNatureAndIdExercice(1, id_exercice ).get(0).getValeur().doubleValue();
        return coutVariable;
    }

    public double getCoutFixe() {
        coutFixe = variableFixeRepository.findByNatureAndIdExercice(1, id_exercice).get(1).getValeur().doubleValue();
        return coutFixe;
    }

    public double getMargeCoutVariable() {
        margeCoutVariable = chiffreAffaire - coutVariable;;
        return margeCoutVariable;
    }

    public double getseuil() {
        double numerateur = coutFixe;
        double denominateur = margeCoutVariable;

        return numerateur/denominateur;
    }
}
