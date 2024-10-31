package com.source.meuble.exception;

public class UnallowedRoleException extends Exception {

    public UnallowedRoleException() {
        super("Vous n'avez pas le droit d'effectuer cette action");
    }
}
