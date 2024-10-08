package com.source.meuble.analytique.typeRubrique;

import com.source.meuble.analytique.exercice.Exercice;
import com.source.meuble.analytique.listeAnalytique.ListAnalytique;
import com.source.meuble.analytique.uniteOeuvre.UniteOeuvre;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "type_rubrique")
public class TypeRubrique {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_type_rubrique", nullable = false)
    private Integer id;

    @Column(name = "libelle", length = 20)
    private String libelle;

    @Column(name = "nature")
    private Integer nature;

    @Column(name = "incorporabilite")
    private Integer incorporabilite;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_unite_oeuvre")
    private UniteOeuvre idUniteOeuvre;

    @OneToMany(mappedBy = "typeRubrique", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ListAnalytique> listAnalytiques;

}