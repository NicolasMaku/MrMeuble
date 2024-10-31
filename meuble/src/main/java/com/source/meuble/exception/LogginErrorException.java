package com.source.meuble.exception;

public class LogginErrorException extends Exception {
    public LogginErrorException() {
        super("Votre identifiant ou mot de passe est incorrect");
    }
}
