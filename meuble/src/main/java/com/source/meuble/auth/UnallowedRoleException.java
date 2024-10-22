package com.source.meuble.auth;

public class UnallowedRoleException extends Exception{
    public UnallowedRoleException(){
        super("Departement non autorisee pour effectuer cette action");
    }
}
