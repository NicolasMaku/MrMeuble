package com.source.meuble.achat.besoin;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public Map<Integer, List<Besoin>> getBesoinsGroupByEtat() {
        List<Besoin> besoins = besoinRepository.findAll();
        Map<Integer, List<Besoin>> map = new HashMap<>();
        map.put(0, new ArrayList<>());
        map.put(1, new ArrayList<>());
        map.put(2, new ArrayList<>());

        besoins.forEach(besoin -> {
            map.get(besoin.getEtat()).add(besoin);
        });

        return map;
    }

    public Besoin saveBesoin(Besoin besoin) {
        return besoinRepository.save(besoin);
    }

}
