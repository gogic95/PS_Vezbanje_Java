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
public class Sud implements Serializable{
    private int sudID;
    private String naziv;
    private String adresa;

    public Sud() {
    }

    public Sud(int sudID, String naziv, String adresa) {
        this.sudID = sudID;
        this.naziv = naziv;
        this.adresa = adresa;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public int getSudID() {
        return sudID;
    }

    public void setSudID(int sudID) {
        this.sudID = sudID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    @Override
    public String toString() {
        return naziv;
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
        final Sud other = (Sud) obj;
        if (this.sudID != other.sudID) {
            return false;
        }
        return true;
    }
    
    
    
}
