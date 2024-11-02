package com.source.meuble.achat.besoin;

import com.source.meuble.auth.AuthService;
import com.source.meuble.exception.NoUserLoggedException;
import com.source.meuble.exception.UnallowedRoleException;
import com.source.meuble.utilisateur.UserRole;
import com.source.meuble.utilisateur.Utilisateur;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BesoinService {

    private final BesoinRepository besoinRepository;
    private final AuthService authService;

    public BesoinService(BesoinRepository besoinRepository, AuthService authService) {
        this.besoinRepository = besoinRepository;
        this.authService = authService;
    }

    public void validerBesoin(Besoin besoin) throws UnallowedRoleException, NoUserLoggedException {
        if(besoin.getEtat() == 0) {
            authService.allowRoles(UserRole.DEPT_ACHAT);
            besoin.setEtat(besoin.getEtat() + 1);
            besoinRepository.save(besoin);

        } else if (besoin.getEtat() == 1) {
            authService.allowRoles(UserRole.DIRECTION);
            besoin.setEtat(besoin.getEtat() + 1);
            besoinRepository.save(besoin);

        }
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

    public List<Besoin> findAllByUtilisateur(Utilisateur u) {
        return besoinRepository.findAllByRole(u.getRole().name());
    }

}
