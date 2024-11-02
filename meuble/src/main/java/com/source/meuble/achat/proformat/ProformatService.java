package com.source.meuble.achat.proformat;

import com.source.meuble.achat.Fornisseur.Fournisseur;
import com.source.meuble.achat.besoin.Besoin;
import com.source.meuble.achat.proformat.proformatFille.ProformatFille;
import com.source.meuble.achat.proformat.proformatFille.ProformatFilleRepository;
import com.source.meuble.analytique.produit.Produit;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;

@Service
public class ProformatService {


    private final ProformatFilleRepository proformatFilleRepository;
    private final ProformatRepository proformatRepository;

    public ProformatService(ProformatFilleRepository proformatFilleRepository, ProformatRepository proformatRepository) {
        this.proformatFilleRepository = proformatFilleRepository;
        this.proformatRepository = proformatRepository;
    }

    @Transactional
    public Proformat ajouterPrixProformat(Proformat proformat, ProformatFille[] proformatFilles, Double[] listePrix)
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
        proformat.setEtat(1);
        proformatRepository.save(proformat);
        return proformat;
    }

    public Map<Produit, Double> getPrixMarchandise(Proformat proformat) {
        Map<Produit, Double> map = new HashMap<>();
        proformat.getFilles().forEach((fille) -> {
            map.put(fille.getIdMarchandise(), fille.getPrix().doubleValue());
        });
        return map;
    }

    @Transactional
    public Proformat demanderProformat(List<Besoin> besoins, Fournisseur fournisseur) {
        Proformat proformat = new Proformat();
        proformat.setDaty(LocalDate.now());
        proformat.setIdFournisseur(fournisseur);
        proformat = proformatRepository.save(proformat);

        List<ProformatFille> pfs = new ArrayList<>();
        for(Besoin besoin: besoins) {
            ProformatFille proformatFille = new ProformatFille();
            proformatFille.setIdProformat(proformat);
            proformatFille.setQte(besoin.getQuantite().doubleValue());
            proformatFille.setIdMarchandise(besoin.getIdMarchandise());
            pfs.add(proformatFille);
        }

        proformatFilleRepository.saveAll(pfs);
        return proformat;
    }

    public List<Proformat> getAllProformats() {
        return proformatRepository.findAll();
    }

}