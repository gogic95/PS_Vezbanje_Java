/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;

/**
 *
 * @author Gogic
 */
public class Kandidat implements Serializable{
    private int kandidatID;
    private String imePrezime;
    private String strucnaSprema;
    private String zanimanje;

    public Kandidat() {
    }

    public Kandidat(int kandidatID, String imePrezime, String strucnaSprema, String zanimanje) {
        this.kandidatID = kandidatID;
        this.imePrezime = imePrezime;
        this.strucnaSprema = strucnaSprema;
        this.zanimanje = zanimanje;
    }

    public String getZanimanje() {
        return zanimanje;
    }

    public void setZanimanje(String zanimanje) {
        this.zanimanje = zanimanje;
    }

    public int getKandidatID() {
        return kandidatID;
    }

    public void setKandidatID(int kandidatID) {
        this.kandidatID = kandidatID;
    }

    public String getImePrezime() {
        return imePrezime;
    }

    public void setImePrezime(String imePrezime) {
        this.imePrezime = imePrezime;
    }

    public String getStrucnaSprema() {
        return strucnaSprema;
    }

    public void setStrucnaSprema(String strucnaSprema) {
        this.strucnaSprema = strucnaSprema;
    }

    @Override
    public String toString() {
        return imePrezime;
    }

    @Override
    public int hashCode() {
        int hash = 3;
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
        final Kandidat other = (Kandidat) obj;
        if (this.kandidatID != other.kandidatID) {
            return false;
        }
        return true;
    }
    
    
    
    
}
