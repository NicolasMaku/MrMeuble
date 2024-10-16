package com.source.meuble.pieces;

import java.util.List;

public abstract class Etat {
    public abstract EtatCPL transferer();

    public abstract List<Object> getFille();
}
