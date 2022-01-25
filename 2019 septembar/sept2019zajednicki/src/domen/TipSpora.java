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
public class TipSpora implements Serializable{
    private int tipSporaID;
    private String naziv;

    public TipSpora() {
    }

    public TipSpora(int tipSporaID, String naziv) {
        this.tipSporaID = tipSporaID;
        this.naziv = naziv;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public int getTipSporaID() {
        return tipSporaID;
    }

    public void setTipSporaID(int tipSporaID) {
        this.tipSporaID = tipSporaID;
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
        final TipSpora other = (TipSpora) obj;
        if (this.tipSporaID != other.tipSporaID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return naziv;
    }
    
    
}
