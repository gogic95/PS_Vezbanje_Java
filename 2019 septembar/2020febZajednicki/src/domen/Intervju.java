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
public class Intervju implements Serializable{
    private int intervjuID;
    private Date datum;
    private String opis;
    private double brojPoenaTest;
    private String vozacka;
    private boolean prethodnoIskustvo;
    private Kandidat kandidat;
    private Regruter regruter;

    public Intervju() {
    }

    public Intervju(int intervjuID, Date datum, String opis, double brojPoenaTest, String vozacka, boolean prethodnoIskustvo, Kandidat kandidat, Regruter regruter) {
        this.intervjuID = intervjuID;
        this.datum = datum;
        this.opis = opis;
        this.brojPoenaTest = brojPoenaTest;
        this.vozacka = vozacka;
        this.prethodnoIskustvo = prethodnoIskustvo;
        this.kandidat = kandidat;
        this.regruter = regruter;
    }

    public Regruter getRegruter() {
        return regruter;
    }

    public void setRegruter(Regruter regruter) {
        this.regruter = regruter;
    }

    public int getIntervjuID() {
        return intervjuID;
    }

    public void setIntervjuID(int intervjuID) {
        this.intervjuID = intervjuID;
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public double getBrojPoenaTest() {
        return brojPoenaTest;
    }

    public void setBrojPoenaTest(double brojPoenaTest) {
        this.brojPoenaTest = brojPoenaTest;
    }

    public String getVozacka() {
        return vozacka;
    }

    public void setVozacka(String vozacka) {
        this.vozacka = vozacka;
    }

    public boolean isPrethodnoIskustvo() {
        return prethodnoIskustvo;
    }

    public void setPrethodnoIskustvo(boolean prethodnoIskustvo) {
        this.prethodnoIskustvo = prethodnoIskustvo;
    }

    public Kandidat getKandidat() {
        return kandidat;
    }

    public void setKandidat(Kandidat kandidat) {
        this.kandidat = kandidat;
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
        final Intervju other = (Intervju) obj;
        if (this.intervjuID != other.intervjuID) {
            return false;
        }
        return true;
    }
    
    
}
