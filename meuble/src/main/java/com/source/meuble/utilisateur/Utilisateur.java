package com.source.meuble.utilisateur;

public class Utilisateur {
    int id;
    String username;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Utilisateur(int id, String username) {
        this.id = id;
        this.username = username;
    }

}
