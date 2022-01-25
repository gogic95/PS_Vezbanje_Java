/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author Gogic
 */
public class StavkaPrijave implements  Serializable{
    private Prijava prijava;
    private int RB;
    private String tipVakcine;

    public StavkaPrijave() {
    }

    public StavkaPrijave(Prijava prijava, int RB, String tipVakcine) {
        this.prijava = prijava;
        this.RB = RB;
        this.tipVakcine = tipVakcine;
    }

    public String getTipVakcine() {
        return tipVakcine;
    }

    public void setTipVakcine(String tipVakcine) {
        this.tipVakcine = tipVakcine;
    }

    public Prijava getPrijava() {
        return prijava;
    }

    public void setPrijava(Prijava prijava) {
        this.prijava = prijava;
    }

    public int getRB() {
        return RB;
    }

    public void setRB(int RB) {
        this.RB = RB;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final StavkaPrijave other = (StavkaPrijave) obj;
        if (this.RB != other.RB) {
            return false;
        }
        if (!Objects.equals(this.prijava, other.prijava)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return tipVakcine;
    }
    
    
}
