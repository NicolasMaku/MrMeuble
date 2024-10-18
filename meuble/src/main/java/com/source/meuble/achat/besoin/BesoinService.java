package com.source.meuble.achat.besoin;

import org.springframework.stereotype.Service;

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
        besoinRepository.save(besoin);
    }

    public List<Besoin> getBesoins(Integer etat) {
        return besoinRepository.findAllByEtat(etat);
    }

}
