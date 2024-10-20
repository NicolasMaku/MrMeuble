package com.source.meuble.stock.etatStock;

import com.source.meuble.achat.marchandise.Marchandise;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "etat_stock")
public class EtatStock {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_etat_stock", nullable = false)
    private Integer id;

    @Column(name = "date_enregistrement")
    private LocalDate dateEnregistrement;

    @Column(name = "quantite")
    private Integer quantite;

    @Column(name = "prix_unitaire", precision = 11, scale = 2)
    private BigDecimal prixUnitaire;

    @ManyToOne
    @JoinColumn(name = "id_marchandise", nullable = false)
    private Marchandise marchandise;

    @Transient
    private BigDecimal prixTotal;

    public EtatStock(LocalDate date, int qt, double pu)throws Exception{
        this.setDateEnregistrement(date);
        this.setQuantite(qt);
        this.setPrixUnitaire(pu);
        this.calculPrixTotal();
    }

    public EtatStock(){}

    public void setQuantite(int qt)throws Exception{
        if(qt<0){
            throw new Exception("Quantite Invalide ou insuffisant");
        }
        this.quantite = qt;
    }


    public void setPrixUnitaire(double d)throws Exception{
        BigDecimal bd = new BigDecimal(String.valueOf(d));
        BigDecimal rouded = bd.setScale(2, RoundingMode.HALF_UP);
        this.prixUnitaire = rouded;
    }

    public void setPrixTotal(double d)throws Exception{
        BigDecimal bd = new BigDecimal(String.valueOf(d));
        BigDecimal rouded = bd.setScale(2, RoundingMode.HALF_UP);
        this.prixTotal = rouded;
    }

    public void calculPrixTotal(){
        this.prixTotal = this.getPrixUnitaire().multiply(new BigDecimal(this.getQuantite()));
    }

    public void calculPrixUnitaire(){
        this.prixUnitaire = this.getPrixTotal().divide(new BigDecimal(this.getQuantite()));
    }

}
