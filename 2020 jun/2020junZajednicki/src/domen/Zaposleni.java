/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author Gogic
 */
public class Zaposleni implements Serializable{
    private Long zaposleniID;
    private String ime;
    private String prezime;
    private String JMBG;
    private String ziroRacun;
    private double iznos;
    private Kompanija kompanija;
    private Banka banka;

    public Zaposleni() {
    }

    public Zaposleni(Long zaposleniID, String ime, String prezime, String JMBG, String ziroRacun, double iznos, Kompanija kompanija, Banka banka) {
        this.zaposleniID = zaposleniID;
        this.ime = ime;
        this.prezime = prezime;
        this.JMBG = JMBG;
        this.ziroRacun = ziroRacun;
        this.iznos = iznos;
        this.kompanija = kompanija;
        this.banka = banka;
    }

    public Banka getBanka() {
        return banka;
    }

    public void setBanka(Banka banka) {
        this.banka = banka;
    }

    public Long getZaposleniID() {
        return zaposleniID;
    }

    public void setZaposleniID(Long zaposleniID) {
        this.zaposleniID = zaposleniID;
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

    public String getJMBG() {
        return JMBG;
    }

    public void setJMBG(String JMBG) {
        this.JMBG = JMBG;
    }

    public String getZiroRacun() {
        return ziroRacun;
    }

    public void setZiroRacun(String ziroRacun) {
        this.ziroRacun = ziroRacun;
    }

    public double getIznos() {
        return iznos;
    }

    public void setIznos(double iznos) {
        this.iznos = iznos;
    }

    public Kompanija getKompanija() {
        return kompanija;
    }

    public void setKompanija(Kompanija kompanija) {
        this.kompanija = kompanija;
    }

    @Override
    public String toString() {
        return ime+" "+prezime;
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
        final Zaposleni other = (Zaposleni) obj;
        if (!Objects.equals(this.zaposleniID, other.zaposleniID)) {
            return false;
        }
        return true;
    }
    
    
    
}
