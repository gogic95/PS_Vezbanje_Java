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
public class Vest implements Serializable{
    private Izdanje izdanje;
    private int RB;
    private String naslov;
    private String tekst;

    public Vest() {
    }

    public Vest(Izdanje izdanje, int RB, String naslov, String tekst) {
        this.izdanje = izdanje;
        this.RB = RB;
        this.naslov = naslov;
        this.tekst = tekst;
    }

    public String getTekst() {
        return tekst;
    }

    public void setTekst(String tekst) {
        this.tekst = tekst;
    }

    public Izdanje getIzdanje() {
        return izdanje;
    }

    public void setIzdanje(Izdanje izdanje) {
        this.izdanje = izdanje;
    }

    public int getRB() {
        return RB;
    }

    public void setRB(int RB) {
        this.RB = RB;
    }

    public String getNaslov() {
        return naslov;
    }

    public void setNaslov(String naslov) {
        this.naslov = naslov;
    }

    @Override
    public String toString() {
        return naslov;
        
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
        final Vest other = (Vest) obj;
        if (this.RB != other.RB) {
            return false;
        }
        if (!Objects.equals(this.izdanje, other.izdanje)) {
            return false;
        }
        return true;
    }
    
    
    
    
}
