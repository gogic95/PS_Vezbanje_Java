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
public class Prognoza implements Serializable {
    private int prognozaID;
    private Date dan;
    private String opis;
    private Meteorolog meteorolog;

    public Prognoza() {
    }

    public Prognoza(int prognozaID, Date dan, String opis, Meteorolog meteorolog) {
        this.prognozaID = prognozaID;
        this.dan = dan;
        this.opis = opis;
        this.meteorolog = meteorolog;
    }

    public Meteorolog getMeteorolog() {
        return meteorolog;
    }

    public void setMeteorolog(Meteorolog meteorolog) {
        this.meteorolog = meteorolog;
    }

    public int getPrognozaID() {
        return prognozaID;
    }

    public void setPrognozaID(int prognozaID) {
        this.prognozaID = prognozaID;
    }

    public Date getDan() {
        return dan;
    }

    public void setDan(Date dan) {
        this.dan = dan;
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
        final Prognoza other = (Prognoza) obj;
        if (this.prognozaID != other.prognozaID) {
            return false;
        }
        return true;
    }
    
    
}
