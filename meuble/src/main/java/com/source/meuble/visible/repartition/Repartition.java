package com.source.meuble.visible.repartition;

import com.source.meuble.analytique.centre.Centre;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

import java.math.BigDecimal;

/**
 * Mapping for DB view
 */
@Data
@Entity
@Immutable
@Table(name = "v_repartition")
public class Repartition {
    @Id
    @Column(name = "row_number")
    private Long rowNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_centre")
    private Centre idCentre;

    @Column(name = "nom", length = 50)
    private String nom;

    @Column(name = "montant")
    private BigDecimal montant;

    @Column(name = "categorie")
    private Integer categorie;

    @Column(name = "cle")
    private BigDecimal cle;

    @Column(name = "structure")
    private BigDecimal structure;

    @Column(name = "cout_total")
    private BigDecimal coutTotal;

    @Column(name = "id_exercice")
    private Integer idExercice;


    public Double getCoutTotal() {
        return coutTotal.doubleValue();
    }
}