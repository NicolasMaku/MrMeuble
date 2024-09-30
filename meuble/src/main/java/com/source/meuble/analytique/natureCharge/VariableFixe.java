package com.source.meuble.analytique.natureCharge;

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
@Table(name = "v_variable_fixe")
public class VariableFixe {
    @Id
    @Column(name = "row_number")
    private Long rowNumber;

    @Column(name = "id_exercice")
    private Integer idExercice;

    @Column(name = "nature")
    private Integer nature;

    @Column(name = "valeur")
    private BigDecimal valeur;

}