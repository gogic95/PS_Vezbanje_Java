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
public class Zivotinja implements Serializable{
    private int zivotinjaID;
    private String naziv;
    private boolean autohtonaVrsta;
    private double subvencijaPoGrlu;

    public Zivotinja() {
    }

    public Zivotinja(int zivotinjaID, String naziv, boolean autohtonaVrsta, double subvencijaPoGrlu) {
        this.zivotinjaID = zivotinjaID;
        this.naziv = naziv;
        this.autohtonaVrsta = autohtonaVrsta;
        this.subvencijaPoGrlu = subvencijaPoGrlu;
    }

    public double getSubvencijaPoGrlu() {
        return subvencijaPoGrlu;
    }

    public void setSubvencijaPoGrlu(double subvencijaPoGrlu) {
        this.subvencijaPoGrlu = subvencijaPoGrlu;
    }

    public int getZivotinjaID() {
        return zivotinjaID;
    }

    public void setZivotinjaID(int zivotinjaID) {
        this.zivotinjaID = zivotinjaID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public boolean isAutohtonaVrsta() {
        return autohtonaVrsta;
    }

    public void setAutohtonaVrsta(boolean autohtonaVrsta) {
        this.autohtonaVrsta = autohtonaVrsta;
    }

    @Override
    public String toString() {
        return naziv;
    }

    @Override
    public int hashCode() {
        int hash = 5;
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
        final Zivotinja other = (Zivotinja) obj;
        if (this.zivotinjaID != other.zivotinjaID) {
            return false;
        }
        return true;
    }
    
    
    
    
}
