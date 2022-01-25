/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 *
 * @author Gogic
 */
public class PredajePredmet implements Serializable {
    private Nastavnik nastavnik;
    private Predmet predmet;
    private int semestar;
    private String studijskiProgram;
    private Date datumAngazovanja;
    private Korisnik korisnik;

    public PredajePredmet() {
    }

    public PredajePredmet(Nastavnik nastavnik, Predmet predmet, int semestar, String studijskiProgram, Date datumAngazovanja, Korisnik korisnik) {
        this.nastavnik = nastavnik;
        this.predmet = predmet;
        this.semestar = semestar;
        this.studijskiProgram = studijskiProgram;
        this.datumAngazovanja = datumAngazovanja;
        this.korisnik = korisnik;
    }

    public Korisnik getKorisnik() {
        return korisnik;
    }

    public void setKorisnik(Korisnik korisnik) {
        this.korisnik = korisnik;
    }

    public Nastavnik getNastavnik() {
        return nastavnik;
    }

    public void setNastavnik(Nastavnik nastavnik) {
        this.nastavnik = nastavnik;
    }

    public Predmet getPredmet() {
        return predmet;
    }

    public void setPredmet(Predmet predmet) {
        this.predmet = predmet;
    }

    public int getSemestar() {
        return semestar;
    }

    public void setSemestar(int semestar) {
        this.semestar = semestar;
    }

    public String getStudijskiProgram() {
        return studijskiProgram;
    }

    public void setStudijskiProgram(String studijskiProgram) {
        this.studijskiProgram = studijskiProgram;
    }

    public Date getDatumAngazovanja() {
        return datumAngazovanja;
    }

    public void setDatumAngazovanja(Date datumAngazovanja) {
        this.datumAngazovanja = datumAngazovanja;
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
        final PredajePredmet other = (PredajePredmet) obj;
        if (!Objects.equals(this.nastavnik, other.nastavnik)) {
            return false;
        }
        if (!Objects.equals(this.predmet, other.predmet)) {
            return false;
        }
        return true;
    }
    
    
}
