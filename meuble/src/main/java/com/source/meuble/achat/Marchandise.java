package com.source.meuble.achat;

import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "marchandise")
public class Marchandise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_marchandise", nullable = false)
    private Integer id;

    @Column(name = "nom", length = 50)
    private String nom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_unite_oeuvre")
    private UniteOeuvre idUniteOeuvre;

}