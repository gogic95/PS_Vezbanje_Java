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
public class Predmet implements Serializable{
    private int predmetID;
    private String naziv;
    private int ESPB;

    public Predmet() {
    }

    public Predmet(int predmetID, String naziv, int ESPB) {
        this.predmetID = predmetID;
        this.naziv = naziv;
        this.ESPB = ESPB;
    }

    public int getESPB() {
        return ESPB;
    }

    public void setESPB(int ESPB) {
        this.ESPB = ESPB;
    }

    public int getPredmetID() {
        return predmetID;
    }

    public void setPredmetID(int predmetID) {
        this.predmetID = predmetID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
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
        final Predmet other = (Predmet) obj;
        if (this.predmetID != other.predmetID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return naziv;
    }
    
    
}
