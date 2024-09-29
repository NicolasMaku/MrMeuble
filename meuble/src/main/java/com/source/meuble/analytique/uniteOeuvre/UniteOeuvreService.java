package com.source.meuble.analytique.uniteOeuvre;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UniteOeuvreService {

    private final UniteOeuvreRepository uniteOeuvreRepository;

    public UniteOeuvreService(UniteOeuvreRepository uniteOeuvreRepository) {
        this.uniteOeuvreRepository = uniteOeuvreRepository;
    }


    public List<UniteOeuvre> getAllUO() {
        return uniteOeuvreRepository.findAll();
    }

    @Transactional
    public UniteOeuvre saveUO(UniteOeuvre uo) {
        return uniteOeuvreRepository.save(uo);
    }
}
