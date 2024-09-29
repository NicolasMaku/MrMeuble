package com.source.meuble.analytique.centre;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.source.meuble.analytique.centre.SommeCentre.SommeCentre;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

@Service
public class CentreService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    CentreRepository centreRepository;

    public List<Map<String, Object>> sommeCentre() {
        String sql = "select id_centre, nom,sum(reel) from analyse_ensemble GROUP BY id_centre, nom; ";
        return jdbcTemplate.queryForList(sql);
    }

    public List<SommeCentre> listeSommeCentre() {
        List<Map<String, Object>> map = sommeCentre();
        List<SommeCentre> retour = new ArrayList<>();

        for (Map<String, Object> each : map) {
            SommeCentre sc = new SommeCentre(each);
            System.out.println(sc.getNom());
            retour.add(sc);
        }

        return retour;
    }

    public Centre addCentre(Centre centre) {
        return centreRepository.save(centre);
    }

    public List<Centre> getAllCentre() {
        return centreRepository.findAll();
    }

}
