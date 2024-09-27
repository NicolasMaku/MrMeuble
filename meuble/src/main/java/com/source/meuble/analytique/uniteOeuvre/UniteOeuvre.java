package com.source.meuble.analytique.uniteOeuvre;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "unite_oeuvre")
public class UniteOeuvre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_unite_oeuvre")
    Integer idUniteOeuvre;

    @Column(name = "nom")
    String nom;

}
