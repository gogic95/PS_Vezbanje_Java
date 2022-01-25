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
public class Podnesak implements Serializable{
    private Predmet predmet;
    private int RB;
    private Date datumPrijema;
    private String opis;
    private String vrstaPodneska;

    public Podnesak() {
    }

    public Podnesak(Predmet predmet, int RB, Date datumPrijema, String opis, String vrstaPodneska) {
        this.predmet = predmet;
        this.RB = RB;
        this.datumPrijema = datumPrijema;
        this.opis = opis;
        this.vrstaPodneska = vrstaPodneska;
    }

    public String getVrstaPodneska() {
        return vrstaPodneska;
    }

    public void setVrstaPodneska(String vrstaPodneska) {
        this.vrstaPodneska = vrstaPodneska;
    }

    public Predmet getPredmet() {
        return predmet;
    }

    public void setPredmet(Predmet predmet) {
        this.predmet = predmet;
    }

    public int getRB() {
        return RB;
    }

    public void setRB(int RB) {
        this.RB = RB;
    }

    public Date getDatumPrijema() {
        return datumPrijema;
    }

    public void setDatumPrijema(Date datumPrijema) {
        this.datumPrijema = datumPrijema;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
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
        final Podnesak other = (Podnesak) obj;
        if (this.RB != other.RB) {
            return false;
        }
        if (!Objects.equals(this.predmet, other.predmet)) {
            return false;
        }
        return true;
    }
    
}
