package com.source.meuble.analytique.listeGeneral;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

import java.math.BigDecimal;

/**
 * Mapping for DB view
 */
@Getter
@Setter
@Entity
@Immutable
@Table(name = "liste_general")
public class ListeGeneral {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "id_exeercice")
    private Integer idExeercice;

    @Column(name = "libelle", length = 20)
    private String libelle;

    @Column(name = "id_type_rubrique")
    private Integer idTypeRubrique;

    @Column(name = "total_rubrique")
    private BigDecimal totalRubrique;

    @Column(name = "incorporabilite")
    private Integer incorporabilite;

}