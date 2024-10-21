package com.source.meuble.auth;

public class NoExerciceFoundException extends Exception {
    public NoExerciceFoundException() {
        super("No exercice was setted");
    }
}
