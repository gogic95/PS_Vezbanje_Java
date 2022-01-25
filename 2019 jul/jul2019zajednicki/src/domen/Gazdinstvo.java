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
public class Gazdinstvo implements Serializable{
    private int gazdinstvoID;
    private String naziv;
    private Date datumRegistracije;
    private double ukupnoSubvencija;
    private Poljoprivrednik poljoprivrednik;

    public Gazdinstvo() {
    }

    public Gazdinstvo(int gazdinstvoID, String naziv, Date datumRegistracije, double ukupnoSubvencija, Poljoprivrednik poljoprivrednik) {
        this.gazdinstvoID = gazdinstvoID;
        this.naziv = naziv;
        this.datumRegistracije = datumRegistracije;
        this.ukupnoSubvencija = ukupnoSubvencija;
        this.poljoprivrednik = poljoprivrednik;
    }

    public Poljoprivrednik getPoljoprivrednik() {
        return poljoprivrednik;
    }

    public void setPoljoprivrednik(Poljoprivrednik poljoprivrednik) {
        this.poljoprivrednik = poljoprivrednik;
    }

    public int getGazdinstvoID() {
        return gazdinstvoID;
    }

    public void setGazdinstvoID(int gazdinstvoID) {
        this.gazdinstvoID = gazdinstvoID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public Date getDatumRegistracije() {
        return datumRegistracije;
    }

    public void setDatumRegistracije(Date datumRegistracije) {
        this.datumRegistracije = datumRegistracije;
    }

    public double getUkupnoSubvencija() {
        return ukupnoSubvencija;
    }

    public void setUkupnoSubvencija(double ukupnoSubvencija) {
        this.ukupnoSubvencija = ukupnoSubvencija;
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
        final Gazdinstvo other = (Gazdinstvo) obj;
        if (this.gazdinstvoID != other.gazdinstvoID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return naziv;
    }
    
    
}
