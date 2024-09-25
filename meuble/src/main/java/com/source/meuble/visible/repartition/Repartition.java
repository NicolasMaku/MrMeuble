package com.source.meuble.visible.repartition;

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
@Setter
@Entity
@Immutable
@Table(name = "v_repartition")
public class Repartition {
    @Id
    @Column(name = "row_number")
    private Long rowNumber;

    @Column(name = "id_centre")
    private Integer idCentre;

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

    public BigDecimal getCoutTotal_bigdecimal() {
        return coutTotal;
    }

    public Double getCoutTotal() {
        return coutTotal.doubleValue();
    }


    public void setCoutTotal(BigDecimal coutTotal) {
        this.coutTotal = coutTotal;
    }

    public Long getRowNumber() {
        return rowNumber;
    }

    public Integer getIdCentre() {
        return idCentre;
    }

    public String getNom() {
        return nom;
    }

    public BigDecimal getMontant() {
        return montant;
    }

    public Integer getCategorie() {
        return categorie;
    }

    public BigDecimal getCle() {
        return cle;
    }

    public BigDecimal getStructure() {
        return structure;
    }
}