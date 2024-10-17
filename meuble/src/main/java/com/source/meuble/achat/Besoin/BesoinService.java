package com.source.meuble.achat.Besoin;

import com.source.meuble.achat.Fournisseur;
import com.source.meuble.achat.Proformat.Proformat;
import com.source.meuble.achat.ProformatFille.ProformatFille;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class BesoinService {

    private final BesoinRepository besoinRepository;

    public BesoinService(BesoinRepository besoinRepository) {
        this.besoinRepository = besoinRepository;
    }

    public void validerBesoin(Besoin besoin) {
        if (besoin.getEtat() < 2)
            besoin.setEtat(besoin.getEtat() + 1);
    }

    public List<Besoin> getBesoins(Integer etat) {
        return besoinRepository.findAllByEtat(etat);
    }

    @Transactional
    public Proformat demanderProformat(Besoin[] besoins, Fournisseur fournisseur) {
        Proformat proformat = new Proformat();
        proformat.setDaty(LocalDate.now());
        proformat.setIdFournisseur(fournisseur);

        List<ProformatFille> pfs = new ArrayList<>();
        for (Besoin besoin : besoins) {
            ProformatFille pf = new ProformatFille();
            pf.setIdMarchandise(besoin.getIdMarchandise());
        }

        return proformat;
    }
}
