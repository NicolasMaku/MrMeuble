package com.source.meuble.analytique.exercice;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "exercice")
public class Exercice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_exercice", nullable = false)
    private Integer id;

    @Column(name = "annee")
    private Integer annee;

    @Column(name = "date_debut")
    private LocalDate dateDebut;

}