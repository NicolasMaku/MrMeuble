package com.source.meuble.exception;

public class NoExerciceFoundException extends Exception {
    public NoExerciceFoundException() {
        super("Vous devez tout d'abord choisir une exercice");
    }
}
