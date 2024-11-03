package com.source.meuble.auth;

public class NoAccountLoggedException extends Exception{
    public NoAccountLoggedException() {
        super("Vous devez etre connecte pour poursuivre l'action");
    }
}
