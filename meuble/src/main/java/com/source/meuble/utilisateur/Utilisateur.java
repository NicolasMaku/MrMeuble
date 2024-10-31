package com.source.meuble.utilisateur;

import com.source.meuble.mock.SidebarMock;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "utilisateur")
public class Utilisateur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;

    @Column(name = "username")
    String username;

    @Column(name = "password")
    String password;

    @Column(name = "id_role")
    UserRole role;


    public Utilisateur() {

    }

    public Utilisateur(int id, String username) {
        this.id = id;
        this.username = username;
    }

    public String getSidebar(String currentUrl) {
        return SidebarMock.DEFAULT_SIDEBAR.getHtml(this, currentUrl);
    }

}
