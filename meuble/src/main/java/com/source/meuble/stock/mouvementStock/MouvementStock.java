package com.source.meuble.stock.mouvementStock;

import com.source.meuble.analytique.produit.Produit;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "mouvement_stock")
public class MouvementStock {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_mouvement_stock", nullable = false)
    private Integer id;

    @Column(name = "date_enregistrement")
    private LocalDate dateEnregistrement;

//    @Column(name = "quantite")
//    private Integer quantite;

    @Column(name = "prix_unitaire", precision = 11, scale = 2)
    private BigDecimal prixUnitaire;

//    @Column(name = "nature")
//    private Integer nature;

    @Column(name = "entree")
    private Double entree;

    @Column(name = "sortie")
    private Double sortie;

    @ManyToOne
    @JoinColumn(name = "id_produit", nullable = false)
    private Produit marchandise;

    @Transient
    private Double prixTotal;

//    public void setQuantite(Double qte)throws Exception{
//        if(qt<=0){
//            throw new Exception("Quantite Invalide");
//        }
//        this.quantite = qte;
//    }

    public void setPrixUnitaire(double d)throws Exception{
        BigDecimal bd = new BigDecimal(String.valueOf(d));
        BigDecimal rouded = bd.setScale(2, RoundingMode.HALF_UP);
        this.prixUnitaire = rouded;
    }

//    public void setPrixTotal(double d)throws Exception{
//        BigDecimal bd = new BigDecimal(String.valueOf(d));
//        BigDecimal rouded = bd.setScale(2, RoundingMode.HALF_UP);
//        this.prixTotal = rouded;
//    }

    public void setPrixTotal() {
        this.prixTotal = this.getEntree() * this.getPrixUnitaire().doubleValue() - this.getSortie() * this.getPrixUnitaire().doubleValue();
    }

    public Double getEntree() {
        if(entree == null) return 0.00;
        return entree;
    }

    public Double getSortie() {
        if(sortie == null) return 0.00;
        return sortie;
    }

//    public void calculPrixTotal(){
//        this.prixTotal = this.getPrixUnitaire().multiply(new BigDecimal(this.getQuantite()));
//    }

//    public void calculPrixUnitaire(){
//        this.prixUnitaire = this.getPrixTotal().divide(new BigDecimal((this.getQuantite())));
//    }

//    public Marchandise getMarchandise() {
//        return marchandise;
//    }

//    public void setMarchandise(Marchandise marchandise) {
//        this.marchandise = marchandise;
//    }
}
