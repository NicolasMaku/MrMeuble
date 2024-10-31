package com.source.meuble.exception;

public class NoUserLoggedException extends Exception {
    public NoUserLoggedException() {
        super("Vous devez d'abord vous connecter");
    }
}
