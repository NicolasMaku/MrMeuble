package com.source.meuble.achat.marchandise;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MarchandiseService {

    @Autowired
    private MarchandiseRepository marchandiseRepository;

    public List<Marchandise> findAll() {
        return marchandiseRepository.findAll();
    }

    public Optional<Marchandise> findById(Integer id) {
        return marchandiseRepository.findById(id);
    }

    public Marchandise save(Marchandise marchandise) {
        return marchandiseRepository.save(marchandise);
    }

    public void deleteById(Integer id) {
        marchandiseRepository.deleteById(id);
    }
}
