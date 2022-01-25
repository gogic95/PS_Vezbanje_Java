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
public class Nastavnik implements Serializable{
    private int nastavnikID;
    private String ime;
    private String prezime;
    private String zvanje;

    public Nastavnik() {
    }

    public Nastavnik(int nastavnikID, String ime, String prezime, String zvanje) {
        this.nastavnikID = nastavnikID;
        this.ime = ime;
        this.prezime = prezime;
        this.zvanje = zvanje;
    }

    public String getZvanje() {
        return zvanje;
    }

    public void setZvanje(String zvanje) {
        this.zvanje = zvanje;
    }

    public int getNastavnikID() {
        return nastavnikID;
    }

    public void setNastavnikID(int nastavnikID) {
        this.nastavnikID = nastavnikID;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
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
        final Nastavnik other = (Nastavnik) obj;
        if (this.nastavnikID != other.nastavnikID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
         return ime+" "+prezime;
    }
    
}
