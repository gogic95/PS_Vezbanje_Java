/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Gogic
 */
public class Linija implements Serializable{
    
    private int linijaID;
    private String nazivLinije;
    private Stanica pocetnaStanica;
    private Stanica KrajnjaStanica;
    private ArrayList<LinijaStanica> listaMedjustanica;

    public Linija(int linijaID, String nazivLinije, Stanica pocetnaStanica, Stanica KrajnjaStanica, ArrayList<LinijaStanica> listaMedjustanica) {
        this.linijaID = linijaID;
        this.nazivLinije = nazivLinije;
        this.pocetnaStanica = pocetnaStanica;
        this.KrajnjaStanica = KrajnjaStanica;
        this.listaMedjustanica = listaMedjustanica;
    }
    
    public Linija() {
    }

    

    public Stanica getKrajnjaStanica() {
        return KrajnjaStanica;
    }

    public void setKrajnjaStanica(Stanica KrajnjaStanica) {
        this.KrajnjaStanica = KrajnjaStanica;
    }

    public int getLinijaID() {
        return linijaID;
    }

    public void setLinijaID(int linijaID) {
        this.linijaID = linijaID;
    }

    public String getNazivLinije() {
        return nazivLinije;
    }

    public void setNazivLinije(String nazivLinije) {
        this.nazivLinije = nazivLinije;
    }

    public Stanica getPocetnaStanica() {
        return pocetnaStanica;
    }

    public void setPocetnaStanica(Stanica pocetnaStanica) {
        this.pocetnaStanica = pocetnaStanica;
    }

    @Override
    public String toString() {
        return nazivLinije;
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
        final Linija other = (Linija) obj;
        if (this.linijaID != other.linijaID) {
            return false;
        }
        return true;
    }

    public ArrayList<LinijaStanica> getListaMedjustanica() {
        return listaMedjustanica;
    }

    public void setListaMedjustanica(ArrayList<LinijaStanica> listaMedjustanica) {
        this.listaMedjustanica = listaMedjustanica;
    }
    
    
    
}
