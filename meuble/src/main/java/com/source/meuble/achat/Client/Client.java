package com.source.meuble.achat.Client;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "client")
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_client", nullable = false)
    private Integer id;

    @Column(name = "nom", length = 50)
    private String nom;

    @Column(name = "daty")
    private LocalDate daty;

    @Column(name = "compte", length = 7)
    private String compte;

}