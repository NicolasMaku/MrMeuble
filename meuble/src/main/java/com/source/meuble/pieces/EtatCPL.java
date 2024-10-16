package com.source.meuble.pieces;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class EtatCPL {
    Etat mere;
    List<?> filles;
}
