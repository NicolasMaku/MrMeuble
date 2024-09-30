package com.source.meuble.visible.seuil;

import com.source.meuble.analytique.natureCharge.VariableFixe;
import com.source.meuble.analytique.natureCharge.VariableFixeRepository;
import com.source.meuble.visible.cout.Cout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalculSeuil {

    @Autowired
    private VariableFixeRepository variableFixeRepository;

    public Seuil getSeuil(Cout cout, int id_exercice) {
        Double chiffreAffaire = cout.getQuantite()*cout.getCoutRevient();

        double coutVariable = variableFixeRepository.findByNatureAndIdExercice(1, id_exercice ).get(0).getValeur().doubleValue();
        double coutFixe = variableFixeRepository.findByNatureAndIdExercice(0, id_exercice).get(0).getValeur().doubleValue();
        double margeCoutVariable = chiffreAffaire - coutVariable;

        double numerateur = coutFixe * chiffreAffaire;
        double denominateur = chiffreAffaire - coutVariable;

        double seuil = numerateur/denominateur;

        Seuil seuilObject = new Seuil();
        seuilObject.setChiffreAffaire(chiffreAffaire);
        seuilObject.setCoutVariable(coutVariable);
        seuilObject.setCoutFixe(coutFixe);
        seuilObject.setMargeCoutVariable(margeCoutVariable);
        seuilObject.setSeuil(seuil);

        return seuilObject;
    }

}
