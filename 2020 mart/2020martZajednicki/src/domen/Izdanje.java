/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Gogic
 */
public class Izdanje implements Serializable{
    private int izdanjeID;
    private Date datum;
    private int broj;
    private Publikacija publikacija;

    public Izdanje() {
    }

    public Izdanje(int izdanjeID, Date datum, int broj, Publikacija publikacija) {
        this.izdanjeID = izdanjeID;
        this.datum = datum;
        this.broj = broj;
        this.publikacija = publikacija;
    }

    public Publikacija getPublikacija() {
        return publikacija;
    }

    public void setPublikacija(Publikacija publikacija) {
        this.publikacija = publikacija;
    }

    public int getIzdanjeID() {
        return izdanjeID;
    }

    public void setIzdanjeID(int izdanjeID) {
        this.izdanjeID = izdanjeID;
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    public int getBroj() {
        return broj;
    }

    public void setBroj(int broj) {
        this.broj = broj;
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
        final Izdanje other = (Izdanje) obj;
        if (this.izdanjeID != other.izdanjeID) {
            return false;
        }
        return true;
    }
    
    
}
