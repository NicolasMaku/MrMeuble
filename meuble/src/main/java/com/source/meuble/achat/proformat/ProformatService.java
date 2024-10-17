package com.source.meuble.achat.proformat;

import com.source.meuble.achat.Fournisseur;
import com.source.meuble.achat.besoin.Besoin;
import com.source.meuble.achat.proformatFille.ProformatFille;
import com.source.meuble.achat.proformatFille.ProformatFilleRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProformatService {

    private final ProformatRepository proformatRepository;
    private final ProformatFilleRepository proformatFilleRepository;

    public ProformatService(ProformatRepository proformatRepository,
                            ProformatFilleRepository proformatFilleRepository) {
        this.proformatRepository = proformatRepository;
        this.proformatFilleRepository = proformatFilleRepository;
    }

    @Transactional
    public Proformat demanderProformat(Besoin[] besoins, Fournisseur fournisseur) {
        Proformat proformat = new Proformat();
        proformat.setDaty(LocalDate.now());
        proformat.setIdFournisseur(fournisseur);
        proformatRepository.save(proformat);

        List<ProformatFille> pfs = new ArrayList<>();
        for (Besoin besoin : besoins) {
            ProformatFille pf = new ProformatFille();
            pf.setIdMarchandise(besoin.getIdMarchandise());
            pf.setIdMarchandise(besoin.getIdMarchandise());
            pf.setIdProformat(proformat.getId());
        }

        proformatFilleRepository.saveAll(pfs);
        return proformat;
    }
}
