package com.source.meuble.achat.proformat;

import com.source.meuble.achat.marchandise.Marchandise;
import com.source.meuble.achat.proformat.proformatFille.ProformatFille;
import com.source.meuble.achat.proformat.proformatFille.ProformatFilleRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class ProformatService {


    private final ProformatFilleRepository proformatFilleRepository;

    public ProformatService(ProformatFilleRepository proformatFilleRepository) {
        this.proformatFilleRepository = proformatFilleRepository;
    }

    public Proformat ajouterPrixProformat(ProformatFille[] proformatFilles, Double[] listePrix)
        throws Exception {
        if(proformatFilles.length == 0) {
            throw new Exception("Le nombre de PF doit etre superieur a 0");
        }

        if(proformatFilles.length != listePrix.length) {
            throw new Exception("Nombre de PF doit etre egal au nombre de Liste des Prix: " + proformatFilles.length + " =/= " + listePrix.length);
        }

        List<ProformatFille> pfs = new ArrayList<>();
        for(int i = 0; i < proformatFilles.length; i++) {
            proformatFilles[i].setPrix(BigDecimal.valueOf(listePrix[i]));
        }

        proformatFilleRepository.saveAll(pfs);
        return proformatFilles[0].getIdProformat();
    }

    public Map<Marchandise, Double> getPrixMarchandise(Proformat proformat) {
        Map<Marchandise, Double> map = new HashMap<>();
        proformat.getFilles().forEach((fille) -> {
            map.put(fille.getIdMarchandise(), fille.getPrix().doubleValue());
        });
        return map;
    }
}